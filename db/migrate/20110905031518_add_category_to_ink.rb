class AddCategoryToInk < ActiveRecord::Migration
  def self.up
    add_column :inks, :category, :string
  end

  def self.down
    remove_column :inks, :category
  end
end
