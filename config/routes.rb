Rails.application.routes.draw do
  resources :instructors do
    resources :students
  end
  resources :students
end
