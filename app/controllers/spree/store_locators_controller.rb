module Spree
  class StoreLocatorsController < Spree::StoreController
    def index
      @store_locators = Spree::StoreLocator.all.default_scope
    end

    def show
      @store_location = Spree::StoreLocator.friendly.find(params[:id])
    end
  end
end