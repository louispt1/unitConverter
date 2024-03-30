class UnitConversion
  def self.convert(value, from_unit, to_unit)

    conversion_factors = {
      'mm' => { 'cm' => 0.1, 'm' => 0.001, 'km' => 0.000001}, # Define conversion factors for length units
      'cm' => { 'mm' => 10, 'm' => 0.01 , 'km' => 0.0001},
      'm' => { 'mm' => 1000, 'cm' => 100, 'km' => 0.001},
      'km' => { 'mm' => 1000000, 'cm' => 1000000, 'm' => 1000},

      'g' => { 'kg' => 0.001, 'lb' => 0.00220462, 'st' => 0.000157473},  # Define conversion factors for weight units
      'kg' => { 'g' => 1000, 'lb' =>  2.20462, 'st' => 0.157473}, 
      'lb' => { 'g' => 453.592, 'kg' => 0.453592, 'st' => 0.0714286}, 
      'st' => { 'g' => 6350.29, 'kg' => 6.35029, 'lb' => 14}, 
    }

    if from_unit == to_unit
      return value
    end

    if conversion_factors[from_unit].nil? || conversion_factors[from_unit][to_unit].nil?
      return nil  # Units are not convertible
    else
      conversion_factor = conversion_factors[from_unit][to_unit]
      return value * conversion_factor
    end
  end
end