class FixUserEmail < ActiveRecord::Migration
  def change
    rename_column :users, :e_mail, :email
  end
end
