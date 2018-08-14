FactoryGirl.define do
  factory :store_locator, class: Spree::StoreLocator do
    address1 '865 Market St'
    address2 ''
    city     'San Francisco'
    country  'United States of America'
    name     'Westfield San Francisco Centre'
    phone    '(415) 495-5656'
    state    'CA'
    website  'www.westfield.com'
    zip      '94103'
  end

end
