Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # API ROUTES
  namespace :api do
    namespace :v1 do 
      resources :students, :experiences, :educations, :skills, :capstones
      get '/students/:id/resume', to: 'students#resume'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/
  #routing.html
  resources :resumes
  get "/resumes/:id/.pdf", to: "resumes#pdf_renderer"
end
