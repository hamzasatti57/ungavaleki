class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authorize_user!

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        if params[:user][:parent_id].present?
          @user.child_users(params[:user][:parent_id].join(' ').split)
        end
        format.html { redirect_to users_url, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    password = params[:user][:password]
    respond_to do |format|
      if password.present?
        if @user.update(user_params)
          if params[:user][:parent_id].present?
            @user.child_users(params[:user][:parent_id].join(' ').split)
          end
          format.html { redirect_to users_url, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        if @user.update(user_edit_params)
          if params[:user][:parent_id].present?
            @user.child_users(params[:user][:parent_id].join(' ').split)
          end
          format.html { redirect_to users_url, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :dob, :phone, :user_type)
  end

  def user_edit_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :dob, :phone, :user_type)
  end
end
