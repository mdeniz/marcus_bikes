module ApplicationHelper
  include Pagy::Frontend

  def number_to_euros(number)
    number_to_currency(number, separator: ",", delimiter: ".",  unit: "€", format: "%n %u")
  end
end
