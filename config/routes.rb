Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'users#create'
      post 'signin', to: 'sessions#create'

      resources :students, only: [:index, :show] do
        resources :exams, only: [:index, :create, :show, :destroy] do
          resources :exam_results, only: [:create]
        end
        resources :interview_records, only: [:index, :create, :show, :destroy]
      end

      resources :exams, only: [] do
        resources :exam_results, only: [:update, :destroy]
      end
    end
  end
end
