Rails.application.routes.draw do
  root "items#index"
  get "items/details", to: "items#details"
end
