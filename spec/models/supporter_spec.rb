require 'rails_helper'

describe Supporter do
  describe '#create' do

    it "is valid with a name, email, team_id, password, password_confirmation" do
      supporter = build(:supporter)
      expect(supporter).to be_valid
    end

    it "is invalid without a name" do
      supporter = build(:supporter, name: "")
      supporter.valid?
      expect(supporter.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a email" do
      supporter = build(:supporter, email: "")
      supporter.valid?
      expect(supporter.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a team_id" do
      supporter = build(:supporter, team_id: "")
      supporter.valid?
      expect(supporter.errors[:team]).to include("を入力してください")
    end

    it "is invalid without a password" do
      supporter = build(:supporter, password: nil)
      supporter.valid?
      expect(supporter.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation although with a password" do
      supporter = build(:supporter, password_confirmation: "")
      supporter.valid?
      expect(supporter.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "is invalid with a name that has more than 11 characters " do
      supporter = build(:supporter, name: "aaaaaaaaaaa")
      supporter.valid?
      expect(supporter.errors[:name]).to include("は10文字以内で入力してください")
    end

    it "is valid with a name that has less than 10 characters " do
      supporter = build(:supporter, name: "aaaaaaaaaa")
      expect(supporter).to be_valid
    end

    it "is invalid with a duplicate email address" do
      supporter = create(:supporter, email: "ttt@gmail.com")
      another_supporter = build(:supporter, email: "ttt@gmail.com")
      another_supporter.valid?
      expect(another_supporter.errors[:email]).to include("はすでに存在します")
    end

    it "is valid with a password that has more than 6 characters " do
      supporter = build(:supporter, password: "000000", password_confirmation: "000000")
      expect(supporter).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      supporter = build(:supporter, password: "00000", password_confirmation: "00000")
      supporter.valid?
      expect(supporter.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end