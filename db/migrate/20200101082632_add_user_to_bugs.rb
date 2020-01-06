class AddUserToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :user, index: true
    add_foreign_key :bugs, :users
  end
end
 