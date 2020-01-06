class AddDeveloperToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :developer, index: true
    add_foreign_key :bugs, :developers
  end
end
 