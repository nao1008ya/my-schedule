class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      #この３つを追記
      t.string :title
      t.text :content
      t.datetime :start_time
      # 制約をつけることにより、外部キー（今回であればuser_id）がないとDBに保存できないようにする
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
