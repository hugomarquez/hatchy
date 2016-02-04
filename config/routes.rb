Hatchy::Engine.routes.draw do

  root to: 'home#index'
  get 'explore', to: 'home#explore'
  match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement', via:[:get]
  get 'dashboard', to: 'dashboard#index', as:'dashboard'
  
  # *** Devise ***
  devise_for :users, class_name:'Hatchy::User', module: :devise

  # *** Resources ***
  resources :users, class_name:'Hatchy::User', only:[:show, :edit, :update] do 
    resources :contributions, class_name:'Hatchy::Contribution', 
      only:[:index], controller:'users/contributions'
  end
  
  resources :projects, class_name:'Hatchy::Project', except:[:index] do 
    member do 
      get 'send_to_analysis'
      get 'publish'
    end

    resources :posts, class_name:'Hatchy::ProjectPost', 
      except:[:index, :create], controller:'projects/posts'
    resources :contributions, class_name:'Hatchy::Contribution', 
      except:[:index], controller:'projects/contributions'

  end

  resources :categories do 
    member do 
      get :subscribe, to: 'categories/subscriptions#create'
      get :unsubscribe, to: 'categories/subscriptions#destroy'
    end

  end

  # *** Admin ***
  namespace :admin do 
    root 'dashboard#index', as: :root
    resources :announcements, class_name:'Hatchy::Announcement'
    resources :banks, class_name:'Hatchy::Bank'
    resources :categories, class_name:'Hatchy::Category'
    resources :countries, class_name:'Hatchy::Country'
    resources :users, class_name:'Hatchy::User', except:[:new, :create]
    resources :contributions, class_name:'Hatchy::Contribution'
    resources :projects, class_name:'Hatchy::Project', only:[:index, :show, :update, :destroy] do 
      member do 
        put 'send_to_approved'
        put 'push_to_online'
        put 'send_to_rejected'
        put 'send_to_draft'
        put 'push_to_trash'
        put 'send_to_successful'
      end
    end

  end
  
end