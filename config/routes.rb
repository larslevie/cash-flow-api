Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :health_check, only: [:show]

  root to: "welcomes#show"
end
