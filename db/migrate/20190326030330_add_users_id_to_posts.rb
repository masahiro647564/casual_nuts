class AddUsersIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_integer :posts, :user_id, foreign_key: true
  end
end
