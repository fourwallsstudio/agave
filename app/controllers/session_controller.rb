class SessionController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login @user
    else
      render json: ['Invalid username or password'], status: 401
    end
  end

  def destroy
    logout
    render json: {}
  end
end
