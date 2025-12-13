class AddStatusToWritings < ActiveRecord::Migration[8.0]
  def change
    add_column :writings, :status, :integer, default: 0
  end
end
