Rails.application.routes.draw do
  use_doorkeeper
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get :token, controller: 'applicaiton'

resources :tweets

  resources :users, except: [:new, :edit] do
    put :follow
    put :unfollow
    collection do
      post :login
    end
  end
end
