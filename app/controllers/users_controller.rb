class UsersController < ApplicationController
  def show
    # @user = User.find(session[:user_id])
    @user = User.find_by(id: session[:user_id])
    if !@user
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # redirect先に載っけたい時は、flash
      flash[:success] = "登録しました"
      redirect_to root_path
    else
      # 現在のページに載っけたい時は、flash.now
      flash.now[:danger] = "登録失敗しました"
      # ページテンプレートを上書きしているだけ
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(
          :name, 
          :email, 
          :password, 
          :password_confirmation
    )
  end
end
