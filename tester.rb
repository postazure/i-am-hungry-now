require "JSON"
require "RestClient"
require "pry"

json_hash = RestClient.get("https://www.orderaheadapp.com/places/best-of-thai-noodle--san-francisco-ca.json")
json = JSON.parse(json_hash.body)
pry.binding
