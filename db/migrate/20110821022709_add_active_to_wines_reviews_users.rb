class AddActiveToWinesReviewsUsers < ActiveRecord::Migration
  def self.up
    add_column :wines, :active, :boolean, :default=>true
    Wine.update_all ["active = ?", true]

    add_column :reviews, :active, :boolean, :default=>true
    Review.update_all ["active = ?", true]

    add_column :users, :active, :boolean, :default=>true
    User.update_all ["active = ?", true]
  end

  def self.down
    remove_column :users, :active
    remove_column :reviews, :active
    remove_column :wines, :active
  end
end
