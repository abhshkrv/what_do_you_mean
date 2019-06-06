class AddReactionCountToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :reactions_count, :integer
  end
end
