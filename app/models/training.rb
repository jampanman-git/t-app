class Training < ApplicationRecord
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
end
