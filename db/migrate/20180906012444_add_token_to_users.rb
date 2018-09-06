class AddTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :authentication_token, :string
    add_index :user, :authentication_token, :unique => true

    User.find_each do |user|
      user.generate_authentication_token
      user.save!
      puts "Had generated user #{user.id} token."
    end
  end
end
