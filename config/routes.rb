EventManagementApp::Application.routes.draw do

  root :to => "static#index"
  match 'about', :to => 'static#about'
  match 'contact', :to => 'static#contact'
  match "/send_email/" => "static#send_email"
  
  resources :sessions, only: [:new, :create, :destroy]
  
  # signup wizard routes
  match '/signup',  to: 'signups#new'
  match '/signup/organization', to: 'signups#organization'
  match '/signup/account_plan', to: 'signups#account_plan'
  match '/signup/payment', to: 'signups#payment'
  match '/signup/save_user', to: 'signups#save_user'
  match '/signup/save_organization', to: 'signups#save_organization'
  match '/signup/save_account', to: 'signups#save_account'
  match '/signup/save_payment_details', to: 'signups#save_payment_details'


  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  
  resources :organizations

end
