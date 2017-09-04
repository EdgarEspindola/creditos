Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  resources :profiles, except: [:index, :destroy]
  resources :requisitions, except: :destroy 
  resources :personal_references
   
  root "requisitions#index"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
