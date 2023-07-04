Rails.application.routes.draw do
  resources :instructors do
    resources :students, only: [:create]
  end
  resources :students, except: [:create]
end
