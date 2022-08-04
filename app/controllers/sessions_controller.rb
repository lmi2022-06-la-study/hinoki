class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = "ログインに成功"
      redirect_to root_path
    else
      flash.now[:danger] = "ログインに失敗"
      render :new
    end
  end

  def destroy
    # DBに保管していないからnilにする
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to login_url
  end
  
  private
  def login(email, password)
    # .find_by(カラム: 値)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
