class CreateCapsules < ActiveRecord::Migration
  def change
    Time.zone = "EST"
    create_table :capsules do |t|
      t.references :user
      t.string :title, :caption, :url
      t.datetime :next_time, default: Time.now

      t.timestamps
    end
  end
end
