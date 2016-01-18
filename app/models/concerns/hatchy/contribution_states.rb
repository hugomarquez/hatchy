module Hatchy::ContributionStates
  extend ActiveSupport::Concern

  included do 
    before_create :send_to_pending, :first_step
    validate :with_steps

    def send_to_pending
      self.status = "pending"
    end

    def first_step
      self.step = "reward_data"
    end

    def send_to_waiting
      if self.status == "pending"
        self.status == "waiting_confirmation"
      else
        errors.add(:status, "Contribution needs to be pending in order to change to waiting status")
      end
    end

    def send_to_invalid
      self.status = "invalid_payment"
    end

    def send_to_confirm
      if self.status == ("pending" || "confirmed" || "waiting_confirmation" || "canceled" || "deleted")
        self.status = "confirmed"
      end
    end

    def send_to_cancel
      self.status = "canceled"
    end

    def request_refund
      if self.status == "confirmed"
        self.status = "requested_refund"
      end
    end

    def send_to_refund
      if self.status == ("requested_refund" || "confirmed")
        self.status = "refunded"
      end
    end

    private
    def with_steps
      case self.step
      when "reward_data"
        validates_presence_of :user, :project, :value, :status, :step
      when "billing_data"
        validates_presence_of :user, :project, :value, :status, :step
      when "payment_data"
        validates_presence_of :user, :project, :value, :status, :step
      end
    end

  end
end