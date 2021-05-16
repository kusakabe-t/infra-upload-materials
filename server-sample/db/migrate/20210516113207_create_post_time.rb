class CreatePostTime < ActiveRecord::Migration[6.1]
  def change
    create_table :post_times do |t|
      t.string :time, null: false
      t.timestamps
    end
  end
end
