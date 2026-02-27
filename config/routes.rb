Rails.application.routes.draw do
  root "static_pages#top"
  resources :diagnoses, only: %i[new create] do
    collection do
      get :result
    end
  end
end
