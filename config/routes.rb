Rails.application.routes.draw do

  scope :api, defaults: {format: 'json'} do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

    # Users
    resources :users, only: [:index, :show] do
      collection do
        put :edit_profile
      end
    end

  end
end
