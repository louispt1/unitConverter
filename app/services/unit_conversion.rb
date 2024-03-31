class UnitConversion
  def self.convert(value, from_unit, to_unit)
    conversion_factors = {
      'mm' => { 'cm' => 0.1, 'm' => 0.001, 'km' => 0.000001, 'in' => 0.0393701, 'yd' => 0.00109361},
      'cm' => { 'mm' => 10, 'm' => 0.01 , 'km' => 0.0001, 'in' => 0.393701, 'yd' => 0.0109361},
      'm' => { 'mm' => 1000, 'cm' => 100, 'km' => 0.001, 'in' => 39.3701, 'yd' => 1.09361},
      'km' => { 'mm' => 1000000, 'cm' => 1000000, 'm' => 1000, 'in' => 39370.1, 'yd' => 1093.61},
      'in' => { 'mm' => 25.4, 'cm' => 2.54, 'm' => 0.0254, 'km' => 0.0000254, 'yd' => 0.0277778},
      'yd' => { 'mm' => 914.4, 'cm' => 91.44, 'm' => 0.9144, 'km' => 0.0009144, 'in' => 36},

      'g' => { 'kg' => 0.001, 'lb' => 0.00220462, 'st' => 0.000157473},
      'kg' => { 'g' => 1000, 'lb' =>  2.20462, 'st' => 0.157473}, 
      'lb' => { 'g' => 453.592, 'kg' => 0.453592, 'st' => 0.0714286}, 
      'st' => { 'g' => 6350.29, 'kg' => 6.35029, 'lb' => 14}, 
    }

    return value if from_unit == to_unit

    if conversion_factors[from_unit].nil? || conversion_factors[from_unit][to_unit].nil?
      return nil  # Units are not convertible
    else
      conversion_factor = conversion_factors[from_unit][to_unit]
      return (value * conversion_factor).round(5)
    end
  end
end
