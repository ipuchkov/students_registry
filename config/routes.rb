Rails.application.routes.draw do
  resources :students
  root :to => 'students#index'
end
