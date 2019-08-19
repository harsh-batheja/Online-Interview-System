Rails.application.routes.draw do
	root "users#index"
  resources :tests, except:[:new] do
    get "/submit" => "tests#submit"
    resources :answers, only:[:new,:create]
  end
  resources :papers do
    resources :tests, only:[:new]
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
