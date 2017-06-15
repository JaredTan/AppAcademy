class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :e_mail, null: false
      t.timestamps
    end

    add_index :users, :e_mail
  end
end
