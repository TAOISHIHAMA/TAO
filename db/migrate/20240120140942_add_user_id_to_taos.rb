class AddUserIdToTaos < ActiveRecord::Migration[6.1]
  def change
    add_column :taos, :user_id, :integer
  end
end
