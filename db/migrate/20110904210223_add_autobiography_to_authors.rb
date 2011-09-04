class AddAutobiographyToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :autobiography, :text
  end

  def self.down
    remove_column :authors, :autobiography
  end
end
