class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last_name
      t.string :male, limit: 1

      t.timestamps
    end
  end
end
