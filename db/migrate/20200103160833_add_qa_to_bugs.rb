class AddQaToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :qa, index: true
    add_foreign_key :bugs, :qas
  end
end
