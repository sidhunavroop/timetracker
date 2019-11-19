Rails.application.routes.draw do
  devise_scope :teacher do
    root to: "devise/sessions#new"
  end
  devise_for :teachers
  resources :teacher do
    resources :clock_events
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
