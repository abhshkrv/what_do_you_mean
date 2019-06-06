class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.string :reaction
      t.integer :user_id
      t.integer :submission_id

      t.timestamps
    end
  end
end
