require 'geocoder'

class Spree::StoreLocator < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :image, styles: { large: "500x500>", medium: "200x200>", thumb: "100x100>" },
                            default_style: :medium,
                            url: '/store_locator/:id/:style/:basename.:extension',
                            path: '/store_locator/:id/:style/:basename.:extension'

  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }

  validates :address1, :city, :country, :state, presence: true

  scope :state_ordered, -> { order('state ASC') }

  geocoded_by :full_street_address

  after_validation :geocode, :if => :has_location?, :unless => :has_coordinates?

  def full_street_address
    "#{address1}, #{city}, #{state} #{zip}, #{country}"
  end

  def has_coordinates?
    latitude && longitude
  end

  def has_location?
    full_street_address.present?
  end
end