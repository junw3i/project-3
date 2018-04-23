Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  get 'patient/dashboard', to: 'patient#index'
  resources :consults
  resources :patient do
    resources :consults
  end



  get 'doctors/dashboard', to: 'doctors#index'

  root 'welcome#index'
end
