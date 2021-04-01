Rails.application.routes.draw do
  namespace :api, constraints: { format: "json" } do
    namespace :v1 do
      get "tickers", to: "tickers#index"
    end
  end
  root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end