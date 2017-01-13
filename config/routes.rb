Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # API ROUTES
  namespace :api do
    namespace :v1 do 
      resources :students
      resources :experiences
      resources :educations
      resources :skills
      resources :capstones
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/
  #routing.html
  get "/resumes/:id.pdf", to: "resumes#pdf_renderer"

  resources :resumes
end
