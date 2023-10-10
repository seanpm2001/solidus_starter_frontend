# frozen_string_literal: true

class HomeController < StoreController
  helper 'spree/products'
  respond_to :html

  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    
    featured_products_names = [
      'Solidus Water Bottle',
      'Solidus tote',
      'Solidus hoodie',
    ]

    shop_collection_products_names = [
      'Solidus mug set',
      'Solidus winter hat',
      'Solidus circle sticker',
      'Solidus dark tee'
    ]

    new_arrivals_collection_products_names = [
      "Solidus dark tee",
      "Solidus canvas tote bag",
      "Solidus cap"
    ]

    @featured_products = Spree::Product.where(name: featured_products_names).sort_by { |value| value.id }

    cta_products = {
      names: ['Solidus notebook', 'Solidus t-shirt'],
      text_colors: ['dark', 'light']
    }

    @shop_collection_products = Spree::Product.where(name: shop_collection_products_names).sort_by { |value| value.id }
    @cta_collection_products = Spree::Product.where(name: cta_products[:names])
    @cta_collection_text_colors = cta_products[:text_colors]
 
    @new_product_featured = Spree::Product.find_by!(name: "Solidus hoodie")
    @new_arrivals_collection_products = Spree::Product.where(name: new_arrivals_collection_products_names).sort_by { |value| value.id }
  end
end
