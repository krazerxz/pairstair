class CreateCollaberation < ActiveRecord::Migration
  def change
    create_table :collaberations do |t|
      t.string :card
      t.datetime :last_activity_date
      t.timestamps null: false
    end
  end
end
