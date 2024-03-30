class QuestionsController < ApplicationController
    def new
    end

    def convert # Handle unit conversion and display result
        input_value = params[:input_value].to_f
        from_unit = params[:from_unit]
        to_unit = params[:to_unit]

        converted_value = case from_unit
            when 'mm'
            input_value / 1000 # Convert millimeters to meters
            when 'cm'
            input_value / 100 # Convert centimeters to meters
            when 'm'
            input_value # No conversion needed
            when 'km'
            input_value * 1000 # Convert kilometers to meters
            when 'inches'
            input_value * 0.0254 # Convert inches to meters
            when 'yards'
            input_value * 0.9144 # Convert yards to meters
            end

    @converted_value = case to_unit
            when 'mm'
                converted_value * 1000 # Convert meters to millimeters
            when 'cm'
                converted_value * 100 # Convert meters to centimeters
            when 'm'
                converted_value # No conversion needed
            when 'km'
                converted_value / 1000 # Convert meters to kilometers
            when 'inches'
                converted_value / 0.0254 # Convert meters to inches
            when 'yards'
                converted_value / 0.9144 # Convert meters to yards
            end
    
    redirect_to root_path(converted_value: @converted_value)
    end
end
