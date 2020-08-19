class User < ApplicationRecord

  with_options presence: true do
    validates :nickname, uniqueness: true, length: { maximum: 6 }
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, password: "は半角英数字で入力してください"}
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end