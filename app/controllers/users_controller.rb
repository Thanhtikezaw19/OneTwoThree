class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(
      name: params[:name],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Created user Successfully"
      redirect_to '/signup'
    else
      flash[:warning] = "Invalid!!!"
      redirect_to '/signup'
    end
  end
end
