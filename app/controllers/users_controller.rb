class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @cities = City.all
  end

  def create
    @user = User.new
    @user.first_name = params[:first_name][0]
    @user.last_name = params[:last_name][0]
    @user.age = params[:age][0]
    @user.description = params[:description][0]
    @user.city = City.find(params[:city])
    @user.email = params[:email][0]
    @user.password = params[:password][0]

    if @user.save
      login(@user) dark 3
      redirect_to user_path(@user)
    else
      @user.errors.full_messages.each do |error|
        flash.now[:danger] = error
      end
      render :new
    end
  end
end
