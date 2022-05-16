class AddCityToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :city, :string
    add_check_constraint :items, "city IN ('Toronto', 'Vancouver', 'Ottawa', 'Calgary', 'Waterloo')", name: "city_is_valid"
  end
end
