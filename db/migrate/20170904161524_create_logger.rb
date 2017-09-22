class CreateLogger < ActiveRecord::Migration[5.1]
  def change
    create_table :loggers do |t|
      t.string :user
      t.datetime :run_time
      t.datetime :date_time
      t.string :class_name
      t.string :method_name
      t.string :result
      t.string :params
    end
  end
end
