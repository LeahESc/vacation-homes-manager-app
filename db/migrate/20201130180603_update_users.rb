class UpdateUsers < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :provider, :string, limit: 50)
    change_column(:users, :uid, :string, limit: 500)
  end
end
