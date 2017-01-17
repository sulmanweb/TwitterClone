class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_by_current_user, only: [:edit_profile]

  def edit_profile
    if @user.update(edit_profile_params)
      render status: :ok, template: 'users/show'
    else
      render status: :unprocessable_entity, json: {errors: @user.errors.full_messages}
    end
  end

  private
  def edit_profile_params
    params.permit(:name, :username, :bio, :location, :website, :dob)
  end

  def set_user_by_current_user
    @user = current_user
  end
end