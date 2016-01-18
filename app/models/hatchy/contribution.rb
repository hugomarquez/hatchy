module Hatchy
  class Contribution < ActiveRecord::Base  
    include Hatchy::ContributionStates
    
    attr_accessor :card_number, :card_verification
    belongs_to  :user,    class_name:'Hatchy::User'
    belongs_to  :reward,  class_name:'Hatchy::Reward'
    belongs_to  :project, class_name:'Hatchy::Project'
    belongs_to  :country, class_name:'Hatchy::Country'
    
    validates_numericality_of :value, greater_than_or_equal_to: 10.00
    validate :reward_is_from_project
    validate :value_greater_equal_than_reward
    #validate :cant_contribute_if_max_contribution
    #validate :validate_card, on: :create

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
