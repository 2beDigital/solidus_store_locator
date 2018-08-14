Deface::Override.new(virtual_path: 'spree/shared/_main_nav_bar',
                     name: 'add_link_to_frontend',
                     insert_after: "#home-link",
                     partial: 'spree/shared/store_locator_menu') 
