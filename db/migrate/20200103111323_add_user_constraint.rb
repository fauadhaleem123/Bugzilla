class AddUserConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :type , false
  end
end
