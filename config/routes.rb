Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  resource :bulk_cart, only: :new do
    post :populate
  end
end
