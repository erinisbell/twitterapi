Rails.application.routes.draw do
  # use_doorkeeper

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
