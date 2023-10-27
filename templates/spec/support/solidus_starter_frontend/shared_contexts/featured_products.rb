# frozen_string_literal: true

RSpec.shared_context "featured products" do
  before(:each) do
    create(:store)
    categories = FactoryBot.create(:taxonomy, name: 'Categories')
    categories_root = categories.root
    clothing_taxon = FactoryBot.create(:taxon, name: 'Clothing', parent_id: categories_root.id, taxonomy: categories)
    image = FactoryBot.create(:image)
    variant = FactoryBot.create(:variant, images: [image, image])
  
    FactoryBot.create(:custom_product, name: 'Solidus hoodie', price: '29.99', taxons: [clothing_taxon], variants: [variant])

  end
end
