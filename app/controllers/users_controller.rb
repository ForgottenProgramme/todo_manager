class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  #to display the users in a list
  def index
    render plain: User.order(:name).map { |user| user.to_pleasant_string }.join("\n")
  end

  #to add a new user
  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "New User Added Successfully"
    render plain: response_text
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
