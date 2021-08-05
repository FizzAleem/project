class PublicController < ApplicationController
  def main
    @products = Product.latest
  end
end
