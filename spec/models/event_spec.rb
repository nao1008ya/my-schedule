require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'イベント登録' do
    context 'イベント登録が上手くいくとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@event).to be_valid
      end

      it '詳細がなくても登録できること' do
        @event.content = nil
        expect(@event).to be_valid
      end
    end

    context 'イベント登録が上手くいかないとき' do
      it 'titleがない場合は登録できないこと' do
        @event.title = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end

      it 'start_timeがない場合は登録できないこと' do
        @event.start_time = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Start time can't be blank")
      end

    end
  end
end
