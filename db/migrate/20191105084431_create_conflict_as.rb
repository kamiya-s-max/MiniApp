class CreateConflictAs < ActiveRecord::Migration[5.2]
  def change
    create_table :conflict_as do |t|
      t.text :text
      t.timestamps
    end
  end
end
