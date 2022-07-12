class AddColumnToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :post, foreign_key: true
  end
end
