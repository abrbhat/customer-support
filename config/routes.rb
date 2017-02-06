Rails.application.routes.draw do
  scope '/api', defaults: {format: :json} do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :support_requests, except: [:destroy]
    resources :users, only: [:show]
    resources :agents
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
