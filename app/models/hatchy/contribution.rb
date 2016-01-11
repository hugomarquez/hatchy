module Hatchy
  class Contribution < ActiveRecord::Base
    
    attr_accessor :card_number, :card_verification
  	
  	belongs_to	:user, 		class_name:'Hatchy::User'
  	belongs_to	:reward,	class_name:'Hatchy::Reward'
  	belongs_to	:project, class_name:'Hatchy::Project'
  	belongs_to	:country, class_name:'Hatchy::Country'

  	validates_presence_of :user, :project, :value, :email, 
      :name, :address_street, :address_number, :address_city, 
      :address_state, :address_zip, :address_phone
  	
  	validates_numericality_of :value, greater_than_or_equal_to: 10.00
    validate :validate_card, on: :create

  	validate :reward_is_from_project, :value_greater_equal_than_reward, 
  		:cant_contribute_if_max_contribution

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

    def credit_card
      # @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      #   type:               card_type,
      #   number:             card_number,
      #   verification_value: card_verification,
      #   month:              card_expires_on.month,
      #   year:               card_expires_on.year,
      #   first_name:         user.first_name,
      #   last_name:          user.last_name
      #   )
    end

  end
end
