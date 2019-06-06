class AddSubmissionCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :submissions_count, :integer
  end
end
