module Hatchy
  class Project < ActiveRecord::Base
    include Hatchy::ProjectStates

    has_one     :account,         class_name:'Hatchy::ProjectAccount'
    has_many    :rewards,         class_name:'Hatchy::Reward'
    has_many    :contributions,   class_name:'Hatchy::Contribution'
    has_many    :payments,        through: :contributions
    belongs_to  :user,            class_name:'Hatchy::User'
    belongs_to  :category,        class_name:'Hatchy::Category'

    accepts_nested_attributes_for :account
    accepts_nested_attributes_for :rewards, allow_destroy: true

    mount_uploader :project_img, Hatchy::ProjectUploader
    validates :name, presence: true, uniqueness: true

    scope :recommended, -> { where(recommended: true, status:'online') }
    scope :recent, -> { where(online_date: 5.days.ago.. Time.current, status:'online') }
    scope :online_category, -> (category_id) {where("status='online' AND category_id= ?", category_id)}

    def video
      unless self.video_url.blank?
        VideoInfo.new(self.video_url).embed_code(iframe_attributes: { width: 560, height: 315, frameborder: 0, class: "embed-responsive-item"})
      end
    end

    def total_contributors
      self.contributions.select(:user_id).distinct.count
    end

    def total_contributions
      self.contributions.where(status:"pending").sum(:value).to_f
    end

    def total_percentage
      contributions = total_contributions
      percentage = (contributions / self.goal) * 100
      if percentage >= 100
        100
      else
        percentage.round(2)
      end
    end
  end
end