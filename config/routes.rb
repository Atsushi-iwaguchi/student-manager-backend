Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "exam_results/create"
      get "exam_results/update"
      get "exam_results/destroy"
      get "exams/index"
      get "exams/create"
      get "exams/show"
      get "exams/destroy"
      get "students/index"
      get "students/show"
      post 'signup', to: 'users#create'
      post 'signin', to: 'sessions#create'
    end
  end
end
