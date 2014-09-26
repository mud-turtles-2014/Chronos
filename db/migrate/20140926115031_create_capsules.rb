class CreateCapsules < ActiveRecord::Migration
  def change

    create_table :capsules do |t|
      t.references :user
      t.string :title, :caption, :url
      t.datetime :next_time

      t.timestamps

    end
  end
end
