class Training < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :arm
    validates :spine
    validates :abs
    validates :leg
  end

  with_options format: { with: /\A[0-9]+\z/, message: "半角数字で入力してください"} do
    validates :arm
    validates :spine
    validates :abs
    validates :leg
  end

  with_options numericality: { greater_than_or_equal_to: 0} do
    validates :arm
    validates :spine
    validates :abs
    validates :leg
  end
end
