class CreateMember < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to :collaberation, index: true
      t.string :member_uuid
    end
  end
end
