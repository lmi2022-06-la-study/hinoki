class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  before_action :already_logged_in, only: [:new, :create]
  # Topを経由しないといけない
  # Sessions#create　を経由して session[:user_id]を生成
  def show
    # 下記だと、sessionが生成されていないとエラニーになる
    # @user = User.find(session[:user_id])
    # @user = User.find_by(id: session[:user_id])
    # helperから引っ張ってくる
    @user = :current_user
    # @user = current_user
    # require_logged_inで対応
    # if !@user
    #   redirect_to login_path
    # end
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
