class AddSlugToStoreLocation < ActiveRecord::Migration
  def change
    add_column :spree_store_locators, :slug, :string
    add_index :spree_store_locators, :slug, unique: true
  end
end
