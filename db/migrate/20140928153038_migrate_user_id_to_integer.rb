class MigrateUserIdToInteger < ActiveRecord::Migration
  def change
    change_column :vocabs, :user_id, :integer
  end
end
