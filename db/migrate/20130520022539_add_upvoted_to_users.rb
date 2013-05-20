class AddUpvotedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :upvoted, :string
  end
end
