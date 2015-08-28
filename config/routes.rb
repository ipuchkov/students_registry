Rails.application.routes.draw do
  resources :students
  get '/courses/:course_id/semesters/:semester_number/top' => 'students#top', :as => 'top_students'
  root :to => 'students#index'
end
