Rails.application.routes.draw do
  resources :webhooks
  resources :transactions
  resources :auth do
    collection do
      get :client_token
    end
  end
end
