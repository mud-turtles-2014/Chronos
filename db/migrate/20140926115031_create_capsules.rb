class CreateCapsules < ActiveRecord::Migration
  def change

    create_table :capsules do |t|
      t.references :user
      t.string :title, :caption, :url
      t.datetime :next_time, default: Chronic.parse('tomorrow')

      t.timestamps
    end
  end
end
