class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  #to display the users in a list
  def index
    render plain: User.order(:name).map { |user| user.to_pleasant_string }.join("\n")
  end

  #to add a new user
  def create
    user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email:  params[:email],
      password: params[:password]
    )
    session[:current_user_id] = user.id
    redirect_to "/"
  end

  # to show whether a user exits or not
  def show
    email = params[:email]
    password = params[:password]
    person = User.find_by(email: email, password: password)
    if !person
      render plain: "false"
    else
      render plain: "true"
    end
  end

  # to delete a user
  def destroy
    email = params[:email]
    password = params[:password]
    person = User.find_by(email: email, password: password)
    if !person
      render plain: "This user doesn't exist"
    else
      person.destroy()
      render plain: "User deleted"
    end
  end

  # to change password
  def update
    email = params[:email]
    password = params[:password]
    new_password = params[:new_password]
    person = User.find_by(email: email, password: password)
    if !person
      render plain: "This user doesn't exist"
    else
      person.password = new_password
      person.save
      render plain: "Password Updated!"
    end
  end
end
