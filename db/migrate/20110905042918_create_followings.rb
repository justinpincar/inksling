class CreateFollowings < ActiveRecord::Migration
  def self.up
    create_table :followings do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :followings, :followed_id, :name => "index_followings_on_followed_id"
  end

  def self.down
    drop_table :followings
  end
end
