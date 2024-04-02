class UnitConversion
  def self.convert(value, from_unit, to_unit)
    return nil unless value != 0.0
    return value if from_unit == to_unit 
    
    converter = find_converter(from_unit) 
    return nil unless converter           

    common_unit = converter.common_unit 
    value_in_common_unit = converter.to_common_unit(value, from_unit)
    return nil unless value_in_common_unit 

    return converter.from_common_unit(value_in_common_unit, common_unit, to_unit).round(3) # May want to adjust rounding depending on unit types included
  end

  def self.find_converter(unit)
    converters = [DistanceConverter, MassConverter] # Add more converters for other unit types here
    converters.each do |converter|
      return converter if converter.supported_units.include?(unit)
    end
  end
end


class DistanceConverter
  SUPPORTED_UNITS = ['mm', 'cm', 'm', 'km', 'in', 'yd'] # Expand here to reflect any added units
  COMMON_UNIT = 'm'

  CONVERSION_FACTORS = {                                # Expand here to reflect any added units
    'mm' => 0.001,
    'cm' => 0.01,
    'm' => 1,
    'km' => 1000,
    'in' => 0.0254,
    'yd' => 0.9144
  }

  def self.supported_units
    SUPPORTED_UNITS
  end

  def self.common_unit
    COMMON_UNIT
  end

  def self.to_common_unit(value, from_unit)
    conversion_factor = CONVERSION_FACTORS[from_unit]   
    return nil unless conversion_factor                 
    return value * conversion_factor                           
  end

  def self.from_common_unit(value, common_unit, to_unit)
    conversion_factor = CONVERSION_FACTORS[to_unit]     
    return nil unless conversion_factor                 
    return value / conversion_factor                    
  end
end

class MassConverter                                     # Can replicate with more classes for more unit types.
  SUPPORTED_UNITS = ['g', 'kg', 'lb', 'st']
  COMMON_UNIT = 'kg'

  CONVERSION_FACTORS = {
    'g' => 0.001,
    'kg' => 1,
    'lb' => 0.453592,
    'st' => 6.35029
  }

  def self.supported_units
    SUPPORTED_UNITS
  end

  def self.common_unit
    COMMON_UNIT
  end

  def self.to_common_unit(value, from_unit)
    conversion_factor = CONVERSION_FACTORS[from_unit]
    return nil unless conversion_factor
    return value * conversion_factor
  end

  def self.from_common_unit(value, common_unit, to_unit)
    conversion_factor = CONVERSION_FACTORS[to_unit]
    return nil unless conversion_factor
    return value / conversion_factor
  end
  
end

