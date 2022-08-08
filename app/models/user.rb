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
    # ユーザーインスタンス.booksメソッドが使えるようになる
    has_many :books
    has_many :likes
    has_many :like_books, through: :likes, source: :book

    def like(book_id)
        if self.like?(book_id)
            return false
        end
        self.likes.create(book_id: book_id)
    end
    def unlike(book_id)
        if self.like?(book_id)
            return false
        end
        like = self.likes.find_by(book_id: book_id)
        like.destroy
    end
    
    def like?(book_id)
        self.likes.where(book_id: book_id).exists?
    end
end