class AddUserIdToWritings < ActiveRecord::Migration[8.0]
  def change
    add_column :writings, :user_id, :integer
  end
end
