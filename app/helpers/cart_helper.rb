module CartHelper
  def find_attribute_option_name_in_customization(customizable_attribute_id, customization)
    customization_attribute = customization["customizable_attributes"].select { |x| x["customizable_attribute_id"] == customizable_attribute_id.to_s }.first
    AttributeOption.find(customization_attribute["attribute_option_id"]).name
  end
end
