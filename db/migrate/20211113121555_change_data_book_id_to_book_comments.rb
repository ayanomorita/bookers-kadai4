class ChangeDataBookIdToBookComments < ActiveRecord::Migration[5.2]
  def change
    change_column :book_comments, :book_id, :integer
  end
end
