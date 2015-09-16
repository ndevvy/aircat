Rails.application.routes.draw do
  resources :cats, :only => [:index, :new, :create, :show, :edit, :update]
  resources :cat_rental_requests, :only => [:index, :new, :create, :show]
  resources :cat_rental_requests do
    member do
      post 'approve'
      post 'deny'
    end
  end
end
