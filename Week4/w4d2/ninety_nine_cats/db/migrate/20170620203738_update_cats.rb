class UpdateCats < ActiveRecord::Migration[5.0]
  def change
    change_column :cats, :birth_date, :string
  end
end
