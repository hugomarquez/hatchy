module Hatchy
  class Contribution < ActiveRecord::Base  
    include Hatchy::ContributionStates
    
    attr_accessor :card_number, :card_verification
    belongs_to  :user,    class_name:'Hatchy::User'
    belongs_to  :reward,  class_name:'Hatchy::Reward'
    belongs_to  :project, class_name:'Hatchy::Project'
    belongs_to  :country, class_name:'Hatchy::Country'
    
    validates_numericality_of :value, greater_than_or_equal_to: 10.00
    validates_uniqueness_of :user, scope: :project, message: "already contributed to this project."

    validate :reward_is_from_project
    validate :value_greater_equal_than_reward
    #validate :cant_contribute_if_max_contribution
    #validate :validate_card, on: :create

    scope :recent, -> { where(updated_at: 5.days.ago.. Time.current) }
    scope :user_recent, ->(current_user) { 
      where(user: current_user, updated_at: 5.days.ago.. Time.current)
    }
    scope :active_pledges, -> (user) {
      where(user: user).joins(:project).where('hatchy_projects.status': 'online')
    }
    scope :collected_pledges, -> (user){
      where(user: user).joins(:project).where('hatchy_projects.status': 'successful')
    }

    def update_billing_info
      self.country_id = user.country_id
      self.name = user.full_name if user.first_name && user.last_name
      self.email = user.email
      self.document = user.document
      self.address_street = user.address_street
      self.address_number = user.address_number
      self.address_city = user.address_city
      self.address_zip = user.address_zip
      self.address_state = user.address_state
      self.address_phone = user.phone
    end

    def update_user_billing_info
      user.update_attributes({
        country_id: country_id.presence || user.country_id,
        address_street: address_street.presence || user.address_street,
        address_number: address_number.presence || user.address_number,
        phone: address_phone.presence || user.phone,
        address_state: address_state.presence || user.address_state,
        address_zip: address_zip.presence || user.address_zip,
        address_city: address_city.presence || user.address_city,
        document: document.presence || user.document,
        email: email.presence || user.email,
      })
    end

    private

    def reward_is_from_project
      return unless reward
      errors.add(:reward, "Reward must belong to this project") unless reward.project == project
    end

    def value_greater_equal_than_reward
      return unless reward
      unless value.to_f >= reward.min_value
        errors.add(:value, "Value needs to be greater or equal to the reward's value", 
          minimum_value: reward.min_value)
      end
    end

    def cant_contribute_if_max_contribution
      return unless reward && reward.max_contributions > 0
    end

    def validate_card
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |m|
          errors.add(:base, m)
        end
      end
    end

  end
end
