class ChangePeople < ActiveRecord::Migration[5.0]
  def change
    rename_column :people, :person_id, :house_id
  end
end
