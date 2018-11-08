class RemovColumnFromCryptoe < ActiveRecord::Migration[5.2]
  def change

  remove_column :cryptodbs, :price
  add_column :cryptodbs, :price, :float
  end
end
