class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.boolean :is_admin
      t.string :image
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
