class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      #この３つを追記
      t.string :title
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
