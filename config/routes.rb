Hatchy::Engine.routes.draw do
  
  # *** Devise ***
  devise_for :users, class_name:'Hatchy::User', module: :devise
  
end
