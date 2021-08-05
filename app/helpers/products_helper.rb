module ProductsHelper


  def product_thumbnail product

    tag("img",src:"#{url_for(product.images[0])}", width:"100%",height:"auto")


    # product.images.each do |image|
      # "<img src='#{product.images[0]}>".html_safe
      # image_tag url_for(image)

    # end
  end
end
