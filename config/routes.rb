Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  get 'dashboard', to: 'dashboard#index'
  post 'dashboard', to: 'dashboard#create_appointment'
  get '/patient/video', to: 'patient#video'

  post 'requests', to: 'requests#create'

  #I don't understand the routes and REST methods. I used POST to cancel.
  post 'requests/cancel', to: 'requests#destroy'

  get 'api/consults/:id', to: 'consults#api'

  resources :consults
  resources :patient do
    resources :consults
  end

end
