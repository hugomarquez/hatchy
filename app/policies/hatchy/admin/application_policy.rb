module Hatchy
  class Admin::ApplicationPolicy < ApplicationPolicy
    def access?
      is_admin?
    end
  end
end