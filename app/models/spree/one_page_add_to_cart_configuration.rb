module Spree
  class OnePageAddToCartConfiguration < Preferences::Configuration
    preference :show_master_variants, :boolean, default: false
  end
end
