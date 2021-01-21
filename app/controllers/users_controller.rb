class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

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
end
