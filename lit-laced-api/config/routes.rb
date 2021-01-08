Rails.application.routes.draw do
  namespace :api do
    resources :sneakers, except: [:new, :edit]
  end
end
