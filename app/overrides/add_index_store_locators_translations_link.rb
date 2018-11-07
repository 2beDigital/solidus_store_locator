Deface::Override.new(virtual_path: 'spree/admin/store_locators/index',
				     name: 'add_index_store_locators_translations_link',
				     insert_bottom: "td.actions",
				     partial: 'spree/admin/store_locators/add_translation_link')