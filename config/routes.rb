Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)

  root 'homepage#index'
  resources :ideas, only: [:edit, :update, :create]

  namespace :api do
    namespace :v1 do
      resources :ideas
    end
  end
end
