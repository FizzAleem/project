module ProductsHelper
  

  def product_thumbnail product

    product.images.each do |image|

      image_tag url_for(image)

    end
  end
end
