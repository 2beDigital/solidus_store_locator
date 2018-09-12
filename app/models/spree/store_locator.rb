require 'geocoder'

class Spree::StoreLocator < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  before_save :update_positions
  has_attached_file :image, styles: { large: "500x500>", medium: "200x200>", thumb: "100x100>" },
                            default_style: :medium,
                            url: '/store_locator/:id/:style/:basename.:extension',
                            path: '/store_locator/:id/:style/:basename.:extension'

  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }

  validates :address1, :city, :country, :state, presence: true
  scope :position_ordered, -> { order("position ASC") }
  scope :state_ordered, -> { order('state ASC') }

  geocoded_by :full_street_address

  after_validation :geocode, :if => :has_location?, :unless => :has_coordinates?

  def initialize(*args)
    super(*args)

    last_store = Spree::StoreLocator.last
    self.position = last_store ? last_store.position + 1 : 0
  end

  def full_street_address
    "#{address1}, #{city}, #{state} #{zip}, #{country}"
  end

  def full_address_with_name
    "#{name}, " + full_street_address
  end 

  def has_coordinates?
    latitude && longitude
  end

  def has_location?
    full_street_address.present?
  end

  private

  def update_positions
    unless new_record?
      return unless prev_position = Spree::StoreLocator.find(self.id).position
      if prev_position > self.position
        Spree::StoreLocator.where("? <= position AND position < ?", self.position, prev_position).update_all("position = position + 1")
      elsif prev_position < self.position
        Spree::StoreLocator.where("? < position AND position <= ?", prev_position,  self.position).update_all("position = position - 1")
      end
    end

    true
  end
end