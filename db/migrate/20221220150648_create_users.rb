class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :contact_name, null: false, default: ''
      t.string :password_digest, null: false
      t.boolean :superuser, null: false, default: false

      t.timestamps
    end
  end
end
