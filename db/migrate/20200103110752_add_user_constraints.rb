class AddUserConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :type , null: false
  end
end
