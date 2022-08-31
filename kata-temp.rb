module Kata_temp

    class Temp
        attr_accessor :value, :scale
    end

    def temperature(number,scale)


        temp = Temp.new
        temp.value = number
        temp.scale = scale

        if temp.value.match(/(\d+\.\d+|\d)/) && temp.scale == "celsius" || temp.scale == "fahrenheit" || temp.scale == "kelvin" then
            return temp
        else
            return abort("invalid input")
        end


    end

    def operations(first_value, second_value)

        results = {
            :add => 0,
            :sub => 0,
            :mul => 0,
            :div => 0,
            :scale => ""
        }

        results[:scale] = second_value.scale

        if first_value.scale != second_value.scale then
            results[scale] = false
            return results
        end

        results[:add] = first_value.value.to_f + second_value.value.to_f

        if results[:scale] == "kelvin" && first_value.value.to_f == second_value.value.to_f then
            results[:sub] = "kelvin can't be 0"
        else
            results[:sub] = first_value.value.to_f - second_value.value.to_f
        end


        results[:mul] = first_value.value.to_f * second_value.value.to_f
        results[:div] = first_value.value.to_f / second_value.value.to_f

        return results

    end

    def to_kelvin(number)
        case number.scale
            when "celsius"
                number.value = number.value.to_f + 273.16
                number.scale = "kelvin"
                return number
            
            when "fahrenheit"
                number.value = (number.value.to_f - 32) * 5/9 + 273.16
                number.scale = "kelvin"
                return number
                
            when "kelvin"
                number.value = number.value.to_f
                number.scale = "kelvin"
                return number
        end
    end
    
    def to_fahrenheit(number)
        case number.scale
            when "celsius"
                number.value = (number.value.to_f * 9/5) + 32
                number.scale = "fahrenheit"
                return number
            
            when "fahrenheit"
                number.value = number.value.to_f
                number.scale = "fahrenheit"
                return number
                
            when "kelvin"
                number.value = (number.value.to_f - 273.16) * 9/5 + 32
                number.scale = "fahrenheit"
                return number
        end
    end

    def to_celsius(number)
        case number.scale
            when "celsius"
                number.value = number.value.to_f
                number.scale = "celsius"
                return number
            
            when "fahrenheit"
                number.value = (number.value.to_f - 32) * 5/9
                number.scale = "celsius"
                return number
                
            when "kelvin"
                number.value = (number.value.to_f - 273.16)
                number.scale = "celsius"
                return number
        end
    end

end

include Kata_temp

def main(temp1,scale1,temp2,scale2)
    puts""
        puts "first temperature value and scale is: #{temp1}, #{scale1}"
        valid_temperature1 = Kata_temp.temperature(temp1,scale1)
        puts "second temperature value and scale is: #{temp2}, #{scale2}"
        valid_temperature2 = Kata_temp.temperature(temp2,scale2)
    puts""

    if scale1 != scale2 then
        case scale1
            when "celsius"
                operations_result = Kata_temp.operations(valid_temperature1,to_celsius(valid_temperature2))
            when "fahrenheit"
                operations_result = Kata_temp.operations(valid_temperature1,to_fahrenheit(valid_temperature2))
            when "kelvin"
                operations_result = Kata_temp.operations(valid_temperature1,to_kelvin(valid_temperature2))
        end
    end

    puts""

    puts "ADD = #{operations_result[:add]} #{operations_result[:scale]}"
    puts "sub = #{operations_result[:sub]} #{operations_result[:scale]}"
    puts "mul = #{operations_result[:mul]} #{operations_result[:scale]}"
    puts "div = #{operations_result[:div]} #{operations_result[:scale]}"

    return operations_result

end