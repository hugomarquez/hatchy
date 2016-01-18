module Hatchy
  class Reward < ActiveRecord::Base
    belongs_to :project,      class_name:'Hatchy::Project'
    has_many  :contributions, class_name:'Hatchy::Contribution', dependent: :nullify
    has_many  :payments,      through: :contributions
    validates_presence_of :min_value, :description
  end
end
