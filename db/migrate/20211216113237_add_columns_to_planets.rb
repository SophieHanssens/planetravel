class AddColumnsToPlanets < ActiveRecord::Migration[6.1]
  def change
    add_column :planets, :climat, :string
    add_column :planets, :specie, :string
    add_column :planets, :activity, :string
  end
end
