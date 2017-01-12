Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do 
      resources :students
      resources :experiences
      resources :educations
      resources :skills
      resources :capstones
    end
  end
end
