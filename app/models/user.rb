class User < ApplicationRecord
    # 
    before_save {self.email.downcase!}
    validates :name, presence: true, length: {maximum: 50}    
    validates :email, presence: true, length: {maximum: 255},
                format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                uniqueness: {case_sensitive: false }
    
    # 1.暗号化したパスワードをpassword_digestに登録できる
    # 2.会員登録時に自動的にpassword, password_confirmation属性が使える様になる
    # 3.ログイン認証にauthenticatemメソッドを使える
    has_secure_password
    has_many :books
end