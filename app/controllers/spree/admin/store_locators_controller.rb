module Spree
  class Admin::StoreLocatorsController < Admin::ResourceController
    def index
      @store_locator = Spree::StoreLocator.new
    end

    def new
      @store_locator = Spree::StoreLocator.new
    end

    def create
      @store_locator = Spree::StoreLocator.new store_params
      if @store_locator.save
        redirect_to admin_store_locators_path
      else
        flash[:error] = 'There was an error.'
        render :new
      end
    end

    def update
      @store_locator.update_attributes store_params
      redirect_to admin_store_locators_path
    end

    def destroy
      @store_locator.destroy

      flash[:success] = Spree.t('store_locator.deleted')

      respond_with(@store_locator) do |format|
        format.html { redirect_to collection_url }
        format.js  { render_js_for_destroy }
      end
    end

    private

    def find_resource
      @store_locator = Spree::StoreLocator.friendly.find params[:id]
    end

    def store_params
      params.require(:store_locator).permit(
          :address1,
          :address2,
          :city,
          :country,
          :image,
          :name,
          :phone,
          :state,
          :website,
          :zip,
          :position
      )
    end
  end
end
