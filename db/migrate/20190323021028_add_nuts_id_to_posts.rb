class AddNutsIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :nut, foreign_key: true, index: true, after: :description
  end
end
