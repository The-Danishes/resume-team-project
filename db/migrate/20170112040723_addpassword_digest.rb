class AddpasswordDigest < ActiveRecord::Migration[5.0]
  def change
  	add_column :students, :password_digest, :string
  end
end
