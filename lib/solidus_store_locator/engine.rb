module SolidusStoreLocator
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_store_locator'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    # initializer "spree_store_locator.permitted_attributes", before: :load_config_initializers do |app|
    #   store_locator_attributes = { translations_attributes: [:id, :locale, :name, :address1, :address2, :city, :state, :zip, :country] }
    #   Spree::PermittedAttributes::ATTRIBUTES << :store_locator_attributes
    #   Spree::PermittedAttributes.store_locator_attributes = store_locator_attributes
    # end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
