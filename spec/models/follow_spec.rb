require 'rails_helper'
describe Follow do
  before do
    @follow = FactoryBot.build(:follow)
  end

  describe 'フォロー' do
    context 'フォローがうまくいかないとき' do
      it "followable_idが空だと登録できない" do
        @follow.followable_id = ''
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Followable must exist", "Follower must exist")
      end

      it "follower_idが空だと登録できない" do
        @follow.follower_id = ''
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Followable must exist", "Follower must exist")
      end
    end
  end
end