class AddUserNameToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :user_name, :string
  end
end
