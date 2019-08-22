Rails.application.routes.draw do
	devise_for :users,skip:[:sessions], controllers: {
    registrations: 'users/registrations',
  }
  as :user do
    get 'sign_in', to: 'users/sessions#new', as: :new_user_session
    post 'sign_in', to: 'users/sessions#create', as: :user_session
    delete 'sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  authenticated :user do
      namespace :admin do 
        resources :tests, except:[:new,:create]
        resources :papers
        resources :users, only:[:show]
        root "users#index"
      end 
      resources :tests, except:[:new,:create]
      resources :users, only:[:show]
  end
  root "users#index"
end
