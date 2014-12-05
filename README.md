Spree Store Locator
===================

Do you have physical stores? This extension is for you! Tell your
customers where they can get your products.

It adds an admin option to easily create Store Locations.

It uses [jQuery Store Locator Plugin](https://github.com/bjorn2404/jQuery-Store-Locator-Plugin) to allow your users to find the stores by providing an address or zip code.

Installation
------------

Add spree_store_locator to your Gemfile:

```ruby
gem 'spree_store_locator',  github: 'fruqi/spree_store_locator
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_store_locator:install
```

Customization
-------------

All the markup needed for jQuery Store Locator Plugin is in the
`app/views/spree/stores/index.html.haml`. If you want to customize the
Store Locator, you might need to override this view.

If you don't need to customize a lot, you might want to add some basic
styling.

Keep in mind that the following markup is mandatory:

```haml
#form-container
  %form#user-location{action: "#", method: "post"}
    #form-input
      %label{for: "address"} Enter Address or Zip Code:
      %input#address{name: "address", type: "text"}/
    %button#submit{type: "submit"} Submit
#map-container
  #loc-list
    %ul#list
  #map
```

If you want to customize the plugin functionality, then you will need to
override the `:coffescript` section. [Here](http://www.bjornblog.com/web/jquery-store-locator-plugin) are some examples and the full list of available options of the plugin.

You also can override the `templates` that the plugin uses for
dinamically generate the `Stores List`. Those templates are located on
your `public/templates` folder. After running the installation generator
of course.

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_store_locator/factories'
```

Contributing
------------

Pull Requests are more than welcome!. If needed, make sure you add
tests :)

About the Author
----------------

Crowd Interactive is an American web design and development company that happens to work in Colima, Mexico. We specialize in building and growing online retail stores. We don’t work with everyone – just companies we believe in. Call us today to see if there’s a fit.

