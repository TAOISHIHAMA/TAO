class CreateTaos < ActiveRecord::Migration[6.1]
  def change
    create_table :taos do |t|
      t.string :goods
      t.text :goodscoment

      t.timestamps
    end
  end
end
