require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe 'グループ登録' do
    context 'グループ登録が上手くいくとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@group).to be_valid
      end
    end

    context 'グループ登録が上手くいかないとき' do
      it '名前がない場合は登録できないこと' do
        @group.name = nil
        @group.valid?
        expect(@group.errors.full_messages).to include("Name can't be blank")
      end

    end
  end
end
