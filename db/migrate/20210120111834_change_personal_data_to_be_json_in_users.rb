class ChangePersonalDataToBeJsonInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :personal_data, :jsonb, using: 'to_jsonb(personal_data)'
  end
end
