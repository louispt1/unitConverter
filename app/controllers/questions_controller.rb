require '/home/user/unitConverter/app/services/unit_conversion.rb'

class QuestionsController < ApplicationController
  def new
  end

    def displayConversion # Handle unit conversion and display result
        input_value = params[:input_value].to_f
        from_unit = params[:from_unit]
        to_unit = params[:to_unit]

        converted_value = UnitConversion.convert(input_value, from_unit, to_unit)
        
        if converted_value.nil?
            flash[:alert] = "Units are not convertible."  
          else
            flash[:notice] = "Conversion successful."
            @converted_value = converted_value
          end
    @conversion_occurred = true     # So the error message only shows up after a conversion has been attempted
    redirect_to root_path(converted_value: @converted_value, conversion_occurred: @conversion_occurred)
    end
end
