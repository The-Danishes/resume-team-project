Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/signup" => "students#new"
	post "/students" => "students#create"
	get "/login" => "sessions#new"
	post "/login" => "sessions#create"
	get "/logout" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/
  #routing.html
  resources :resumes
  get "/resumes/:id/.pdf", to: "resumes#pdf_renderer"

end
