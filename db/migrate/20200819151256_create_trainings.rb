class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.integer :arm, null: false
      t.integer :spine, null: false
      t.integer :abs, null: false
      t.integer :leg, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
