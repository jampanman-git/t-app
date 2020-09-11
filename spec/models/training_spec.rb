require 'rails_helper'
describe Training do
  before do
    @training = FactoryBot.build(:training)
  end

  describe 'トレーニング記録' do
    context 'トレーニング記録がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
        expect(@training).to be_valid
      end

      it "armに半角数字が入っていれば記録できる" do
        @training.arm = "1"
        expect(@training).to be_valid
      end

      it "spineに半角数字が入っていれば記録できる" do
        @training.spine = "1"
        expect(@training).to be_valid
      end

      it "absに半角数字が入っていれば記録できる" do
        @training.abs = "1"
        expect(@training).to be_valid
      end

      it "legに半角数字が入っていれば記録できる" do
        @training.leg = "1"
        expect(@training).to be_valid
      end
    end

    context 'トレーニング記録がうまくいかないとき' do
      it "armが空だと登録できない" do
        @training.arm = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("Arm can't be blank")
      end

      it "spineが空だと登録できない" do
        @training.spine = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("Spine can't be blank")
      end

      it "absが空だと登録できない" do
        @training.abs = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("Abs can't be blank")
      end

      it "legが空だと登録できない" do
        @training.leg = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("Leg can't be blank")
      end

      it "Armに半角数字以外の文字が含まれていたら登録できない" do
        @training.arm = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include("Arm is not a number")
      end

      it "Spineに半角数字以外の文字が含まれていたら登録できない" do
        @training.spine = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include("Spine is not a number")
      end

      it "Absに半角数字以外の文字が含まれていたら登録できない" do
        @training.abs = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include("Abs is not a number")
      end

      it "legに半角数字以外の文字が含まれていたら登録できない" do
        @training.leg = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include("Leg is not a number")
      end
    end
  end
end