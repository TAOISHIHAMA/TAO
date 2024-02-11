class AddImageToTaos < ActiveRecord::Migration[6.1]
  def change
    add_column :taos, :image, :string
  end
end
