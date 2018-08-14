require 'spec_helper'

describe Spree::Admin::StoreLocatorsController do
  render_views
  stub_authorization!

  let(:subject) { FactoryGirl.create :store_locator }
  let(:user) { create(:user) }

  before(:each) do
    controller.stub spree_current_user: user
  end

  describe '#index' do
    before { spree_get :index }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end

  describe '#create' do
    context 'with valid attributes' do
      before { spree_post :create, store_locator: subject.attributes }

      it { expect(response).to redirect_to(spree.admin_store_locators_path) }

      it 'saves a new store' do
        expect{ spree_post :create, store_locator: subject.attributes }.to change(Spree::StoreLocator, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      before do
        subject.address1 = nil
        spree_post :create, store_locator: subject.attributes
      end

      it { expect(response).to render_template(:new) }

      it 'does not save a new store' do
        expect{ spree_post :create, store_locator: subject.attributes }.to change(Spree::StoreLocator, :count).by(0)
      end
    end
  end

  describe '#edit' do
    before { spree_get :edit, id: subject.id }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:edit) }
  end

  describe '#update' do
    before { spree_put :update, id: subject.id, store_locator: subject.attributes }

    it { expect(response).to redirect_to(spree.admin_store_locators_path) }
  end

  describe '#destroy' do
    before :each do
      @store = FactoryGirl.create :store_locator
    end

    it 'destroys the store' do
      expect{ spree_delete :destroy, id: @store.id }.to change(Spree::StoreLocator, :count).by(-1)
    end

    it 'redirects to index' do
      spree_delete :destroy, id: @store.id

      expect(response).to redirect_to(spree.admin_store_locators_path)
    end
  end

end
