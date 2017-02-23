Rails.application.routes.draw do
#CarrierWaveExample::Application.routes.draw do
   resources :resumes, only: [:index, :new, :create, :destroy] do
       get "download"
   end
   #resource :uploads, only: [:download] 
   root "resumes#index"
end
