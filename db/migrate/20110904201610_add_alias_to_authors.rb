class AddAliasToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :alias, :string
  end

  def self.down
    remove_column :authors, :alias
  end
end
