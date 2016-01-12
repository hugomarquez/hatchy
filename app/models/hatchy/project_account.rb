module Hatchy
  class ProjectAccount < ActiveRecord::Base
    belongs_to :bank,     class_name:'Hatchy::Bank'
    belongs_to :project,  class_name:'Hatchy::Project'

    validates_presence_of :address_street, :address_number, :address_city, 
      :address_state, :address_zip, :account_type, :email, :phone, :account,
      :account_digit, :owner_name, :owner_document
  end
end