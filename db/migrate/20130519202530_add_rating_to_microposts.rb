class AddRatingToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :rating, :integer, :null => false, :default => 1
  end
end
