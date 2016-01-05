class CreateOrganizationMember < ActiveRecord::Migration
  def change
    create_table :organization_members do |t|
      t.string :trello_uuid
      t.string :name
    end
  end
end
