class AddNameAndPhoneNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
  end
end
