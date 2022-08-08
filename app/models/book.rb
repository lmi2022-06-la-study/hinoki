class Book < ApplicationRecord
    validates :title, presence: true, length: {maximum: 50}    
    validates :author, presence: true, length: {maximum: 255}
    validates :publisher, presence: true, length: {maximum: 255}
    
    # bookインスタンス.userメソッドが使える
    belongs_to :user
    has_many :likes
    
end
