module ProductsHelper
  def image_or_placeholder(image)
    return "/assets/bike_placeholder.png" if image.blank? || image.empty?
    image
  end
end
