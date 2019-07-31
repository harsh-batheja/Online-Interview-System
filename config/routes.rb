Rails.application.routes.draw do

  resources :answers
	root "users#index"
  resources :papers do
    resources :questions do 
      resources :options
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
  resources :users, only:[:show]
end
