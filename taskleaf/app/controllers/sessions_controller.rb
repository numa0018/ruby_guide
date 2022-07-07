class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:params])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    rest_session
    redirect_to root_url, notice: 'ログアウトしました。'
  end

  private

  def sessison_params
    params.require(:session).permit(:email, :password)
  end
end
