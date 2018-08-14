json.array! @store_locators do |store|
  json.id       store.id
  json.name     store.name
  json.lat      store.latitude
  json.lng      store.longitude
  json.address  store.address1
  json.address2 store.address2
  json.city     store.city
  json.state    store.state
  json.postal   store.zip
  json.phone    store.phone
  json.web      store.website
  json.image    store.image.url(:thumb)
  json.url      store_locator_url(store)
end

