// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'
//
//= require list

Spree.ready(function($) {
  new List('bulk-cart', { valueNames: [ 'name', 'image', 'price', 'sku' ] });
});
