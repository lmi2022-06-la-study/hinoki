module SessionsHelper
    # ログイン中のユーザーを取得する
    # 今までは、users#showしないと
    def current_user
        if @current_user
            @current_user
        else
            @current_user = User.find_by(id: session[:user_id])
            # イランクネ？
            return @current_user
        end
    end

    def logged_in?
        if current_user
            return true
        else
            return false
        end
    end
end
