class RenameVotesColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :votes, :users_id, :user_id
    rename_column :votes, :works_id, :work_id
  end
end
