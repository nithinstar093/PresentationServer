class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      
      t.string :base_url
      
      t.string :auth_type
      
      t.string :default_user_name
     
      t.string :default_password
    

      t.timestamps null: false
    end
  end
end
