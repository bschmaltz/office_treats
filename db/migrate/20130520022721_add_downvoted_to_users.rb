class AddDownvotedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :downvoted, :string
  end
end
