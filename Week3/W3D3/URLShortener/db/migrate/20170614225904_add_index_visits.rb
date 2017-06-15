class AddIndexVisits < ActiveRecord::Migration[5.0]
  def change
    add_index :visits, :user_id
  end
end
