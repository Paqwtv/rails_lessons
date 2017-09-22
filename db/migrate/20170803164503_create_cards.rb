class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :number
      t.string :card_type
      t.string :code
      t.references :profile

      t.timestamps
    end
  end
end
