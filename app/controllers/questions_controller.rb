require '/home/user/unitConverter/app/services/unit_conversion.rb'

class QuestionsController < ApplicationController
  def displayConversion
    if params[:search_query].present?
      handle_search_query(params[:search_query])
    else
      render json: { error: "Please provide a search query" }, status: :unprocessable_entity
    end
  end

  private

  def handle_search_query(search_query)
    match = search_query.match(/([\d.]+)\s*(\S+)\s*in\s*(\S+)/i)

    if match
      value = match[1].to_f
      from_unit = match[2]
      to_unit = match[3]

      converted_value = UnitConversion.convert(value, from_unit, to_unit)
      if converted_value
        render json: { input_value: value, from_unit: from_unit, to_unit: to_unit, converted_value: converted_value }
      else
        render json: { error: "Invalid units or conversion not supported" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Invalid search query format" }, status: :unprocessable_entity
    end
  end
end
