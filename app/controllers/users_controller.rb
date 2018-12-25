class UsersController < ApplicationController
  def show
    @user  = User.find_by(id: params[:id])
    @books = Book.where(user_id: @user.id)
  end
  
  def signup
    @user = User.new()
  end
  
  def login_form
    @user = User.new()
  end  
  
  def logout
    session[:user_id] = nil
    redirect_to('/')
  end
  
  def login
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/show/#{@user.id}")
    else
      @error_massage = "password or email is different !!"
      render("users/login_form")
    end
  end
  
  def create
      @user = User.new(email: params[:email],name: params[:name],password: params[:password],user_image_name:"cat.png")
    
    if params[:password] == params[:confirmation_password] && @user.save
      @user.save
      redirect_to("/users/show")
    else
      render("users/signup")
    end
    
  end
  
  
end
