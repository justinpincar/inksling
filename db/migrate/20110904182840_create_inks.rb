class CreateInks < ActiveRecord::Migration
  def self.up
    create_table :inks do |t|
      t.string :title
      t.text :text
      t.integer :author_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inks
  end
end
