class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.integer :status
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
  end
end
