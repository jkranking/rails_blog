class CreateUsers < ActiveRecord::Migration[5.0]
	enable_extension 'hstore' unless extension_enabled?('hstore')
  def change
    create_table :users do |t|
    	t.string :name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.hstore :settings, default: {}
    	t.timestamps
    end
    add_index :users, :email, unique: true
  end
end


# user = User.create(preferences: { "background" => "black", "display" => large })
# add_column :books, :hstore, default: {}
# t.string :tags, array: true, default: []
