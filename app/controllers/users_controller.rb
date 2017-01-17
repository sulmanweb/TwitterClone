class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_by_current_user, only: [:edit_profile]
  before_action :set_user_by_id, only: [:show]

  def edit_profile
    if @user.update(edit_profile_params)
      render status: :ok, template: 'users/show'
    else
      render status: :unprocessable_entity, json: {errors: @user.errors.full_messages}
    end
  end

  def index
    # TODO add pagination
    if user_signed_in?
      @users = User.where.not(id: current_user.id).all.order('id DESC')
    else
      @users = User.all.order('id DESC')
    end
  end

  def show

  end

  private
  def edit_profile_params
    params.permit(:name, :username, :bio, :location, :website, :dob)
  end

  def set_user_by_current_user
    @user = current_user
  end

  def set_user_by_id
    @user = User.find(params[:id])
  end
end