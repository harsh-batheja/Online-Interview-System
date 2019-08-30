Rails.application.routes.draw do
	devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  authenticated :user, -> (u) {u.admin} do
    root "admin/users#index"
      namespace :admin do 
        resources :tests, except:[:new,:create,:index]
        resources :users do
          resources :papers,only: [] do
            resources :tests, only:[:index]
          end
        end 
        resources :papers
        root "users#index"
      end
  end

  authenticated :user, -> (u) {!u.admin} do
    get "test/:id"=> "answers#new", as: :answer
    patch "test/:id" => "answers#update"
    get "papers/:id/results" => "papers#results",as: :results
    resources :tests, except:[:destroy,:edit,:new,:update] do 
      member do
        get "submit" => "tests#submit",as: :submit
        get "instructions" => "tests#new", as: :instructions 
      end
    end
  end
  root "papers#index"
end
