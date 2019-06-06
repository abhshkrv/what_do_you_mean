class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :submission_id
      t.string :flags
      t.float :confidence

      t.timestamps
    end
  end
end
