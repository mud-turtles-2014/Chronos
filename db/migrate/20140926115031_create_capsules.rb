class CreateCapsules < ActiveRecord::Migration
  def change

    create_table :capsules do |t|
      t.string :title, :caption, :url

      t.datetime :next_time
      t.references :user

      t.timestamps

    end
  end
end
