class UsersController < ApplicationController

  def home
  end

  def new
    user = User.new(name:params[:new_name], alias:params[:new_alias] ,email:params[:new_email], password:params[:new_password])
    if params[:new_password] == params[:password_confirm]
      if user.save
        session[:user_id] = user[:id]
        redirect_to "/users/#{user[:id]}"
      else
        flash[:notice] = user.errors.full_messages
        redirect_to '/'
      end
    else
      flash[:notice] = ["Passwords must match"]
      redirect_to '/'
    end
  end

  def login
    user = User.find_by_email(params[:login_email])
    if user && user.authenticate(params[:login_password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:notice] = ["Invalid combination"]
      redirect_to '/'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas.count
    @likes = @user.likes.count
  end

end
