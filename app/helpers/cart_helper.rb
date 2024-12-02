module CartHelper
  def find_attribute_option_name_in_customization(customizable_attribute_id, customization)
    customization_pair = customization["customizable_attributes"].select { |x| x["customizable_attributes_id"] == customizable_attribute_id.to_s }.first
    AttributeOption.find(customization_pair["attribute_option_id"]).name
  end
end
