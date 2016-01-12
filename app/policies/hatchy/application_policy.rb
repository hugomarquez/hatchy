module Hatchy
  class ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def index?
      true
    end

    def show?
      true
    end

    def create?
      is_admin?
    end

    def new?
      create?
    end

    def update?
      is_admin?
    end

    def edit?
      update?
    end

    def destroy?
      is_admin?
    end

    def scope
      Pundit.policy_scope!(user, record.class)
    end
    
    protected
    
    def is_admin?
      user.try(:admin?) || false
    end

    def owner_or_admin?
      is_owner? || user.try(:admin?)
    end

    def is_owner?
      user.present? && record.user == user
    end

  end
end