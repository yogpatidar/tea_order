class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :email
      t.integer :mobile
      t.string :gender

      t.timestamps
    end
  end
end
