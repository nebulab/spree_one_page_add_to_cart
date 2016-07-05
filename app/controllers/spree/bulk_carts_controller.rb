module Spree
  class BulkCartsController < Spree::OrdersController
    respond_to :js

    def new
      @variants = Spree::Variant.where(is_master: master_variants_config)
                                .order(:product_id, :position)
    end

    def populate
      order    = current_order(create_order_if_necessary: true)
      quantity = params[:quantity].to_i
      @variant = Spree::Variant.find(params[:variant_id])

      # 2,147,483,647 is crazy. See issue #2695.
      if quantity.between?(1, 2_147_483_647)
        begin
          order.contents.add(@variant, quantity)
        rescue ActiveRecord::RecordInvalid => e
          @error = e.record.errors.full_messages.join(", ")
        end
      else
        @error = Spree.t(:please_enter_reasonable_quantity)
      end
    end

    private

    def master_variants_config
      SpreeOnePageAddToCart::Config.show_master_variants
    end
  end
end
