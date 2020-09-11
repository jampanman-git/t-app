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

      it "armに半角数字以外の文字が含まれていたら登録できない" do
        @training.arm = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include("Arm is not a number")
      end

      it "spineに半角数字以外の文字が含まれていたら登録できない" do
        @training.spine = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include("Spine is not a number")
      end

      it "absに半角数字以外の文字が含まれていたら登録できない" do
        @training.abs = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include("Abs is not a number")
      end

      it "legに半角数字以外の文字が含まれていたら登録できない" do
        @training.leg = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include("Leg is not a number")
      end

      it "armが0未満だと登録できない" do
        @training.arm = '-1'
        @training.valid?
        expect(@training.errors.full_messages).to include("Arm 半角数字で入力してください", "Arm must be greater than or equal to 0")
      end

      it "spineが0未満だと登録できない" do
        @training.spine = '-1'
        @training.valid?
        expect(@training.errors.full_messages).to include("Spine 半角数字で入力してください", "Spine must be greater than or equal to 0")
      end

      it "absが0未満だと登録できない" do
        @training.abs = '-1'
        @training.valid?
        expect(@training.errors.full_messages).to include("Abs 半角数字で入力してください", "Abs must be greater than or equal to 0")
      end

      it "legが0未満だと登録できない" do
        @training.leg = '-1'
        @training.valid?
        expect(@training.errors.full_messages).to include("Leg 半角数字で入力してください", "Leg must be greater than or equal to 0")
      end
    end
  end
end