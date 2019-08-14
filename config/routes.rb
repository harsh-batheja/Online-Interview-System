Rails.application.routes.draw do
	root "users#index"
  #get "test/:id" => "papers#start_test", as: :test
  resources :papers do
    resources :answers, only:[:new,:create]
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
