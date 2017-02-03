Rails.application.routes.draw do
  scope '/api' do
    resources :support_requests, except: [:delete]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
