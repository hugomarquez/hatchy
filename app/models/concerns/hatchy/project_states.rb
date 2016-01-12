module Hatchy::ProjectStates
  extend ActiveSupport::Concern
  
  included do 

    before_create :send_to_draft
    validate :with_status
    before_save :set_dates, if: lambda { |project| project.online? }

    
    def send_to_draft
      self.status = "draft"
      self.send_to_draft_at = Time.now
    end

    def send_to_analysis
      if self.status == "draft"
        self.status = "analysis"
      else
        errors[:status] << "Project must be in draft first to be in analysis"
      end
    end

    def send_to_rejected
      if self.status == "analysis"
        self.status = "rejected"
        self.rejected_at = Time.now
      else
        errors[:status] << "Project must be in analysis first to be rejected"
      end
    end

    def send_to_approved
      if self.status == "analysis"
        self.status = "approved"
      else
        self.errors[:status] << "Project must be in analysis first to be approved"
      end
    end

    def push_to_online
      if self.status == "approved"
        self.status = "online"
      else
        self.errors[:status] << "Project must be approved first to be online"
      end
    end

    def push_to_trash
      if self.status == "draft" or self.status == "rejected" or self.status == "analysis"
        self.status = "deleted"
      else
        self.errors[:status] << "Project must be in draft, rejected or analysis first to be deleted"
      end
    end

    # States
    def draft?
      self.status == "draft"
    end
    def analysis?
      self.status == "analysis"
    end
    def approved?
      self.status == "approved"
    end
    def rejected?
      self.status == "rejected"
    end
    def trash?
      self.status == "trash"
    end
    def failed?
      self.status == "failed"
    end
    def online?
      self.status == "online"
    end
    def successful?
      self.status == "successful"
    end

    def safe_params
      case self.status
      when "draft"
        draft_params
      when "analysis", "approved"
        approved_params
      when "online", "successful"
        online_params
      end
    end

    private
    def with_status
      case self.status
      when "draft"
        validates_presence_of :city
      when "analysis"
        validates_presence_of :about, :headline, :goal, :online_days, :budget, :project_img
      when "approved"
        validates_presence_of :about, :headline, :goal, :online_days, :budget, :project_img, :video_url
      when "online"
        validates_presence_of :about, :headline, :goal, :online_days, :budget, :project_img, :video_url, :account
      when "successful"
        validates_presence_of :about, :headline, :goal, :online_days, :budget, :project_img, :video_url, :account
      when "failed"
        validates_presence_of :about, :headline, :goal, :online_days, :budget, :project_img, :video_url, :account
      end
    end

    protected
    def set_dates
      self.online_date = Time.now
      self.expires_at = self.online_date + self.online_days.days
    end

    # TODO: change to pundit authorization
    def draft_params
      [ :about,       :budget,      :category_id,:city,
        :goal,        :headline,    
        :name,        :online_date, :online_days,
        :project_img, :short_url,   :status,
        :video_url,

        rewards_attributes:[
          :_destroy,  :deliver_at,        :description,
          :id,        :max_contributions, :min_value,
          :project_id
        ]
      ]
    end

    def approved_params
      [ :about,       :budget,      :category_id,:city,
        :goal,        :headline,
        :name,        :online_date, :online_days,
        :project_img, :short_url,   :status,
        :video_url,

        rewards_attributes:[
          :_destroy,  :deliver_at,        :description,
          :id,        :max_contributions, :min_value,
          :project_id
        ],

        account_attributes:[
          :account,       :account_digit,     :account_type,
          :address_city,  :address_number,    :address_state,
          :address_street,:address_zip,       :agency,
          :agency_digit,  :bank_id,           :email,
          :owner_document,:owner_name,        :phone,
          :project_id
        ]
      ]
    end

    def online_params
      [ :about,       :budget,
        :headline,
        :project_img, :video_url,

        rewards_attributes:[
          :_destroy,  :deliver_at,        :description,
          :id,        :max_contributions, :min_value,
          :project_id
        ]
      ]
    end


  end
end