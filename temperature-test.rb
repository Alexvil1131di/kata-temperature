require 'minitest/autorun'
require_relative 'kata-temp.rb'
include Kata_temp

class Test_temperature_conversion < Minitest::Test

    def test_the_temperature_only_can_accept_numbers_and_a_dot
        assert_equal 3323.5, Kata_temp.temperature("3323.5","kelvin").value.to_f
    end

    def test_scale_has_to_be_the_kelvin_fahrenheit_or_celsius
        assert_equal "celsius", Kata_temp.temperature("3323.5","celsius").scale
    end

    def test_add_has_to_be_one_number_plus_the_other
        assert_equal 250, Kata_temp.operations(Kata_temp.temperature("150","celsius"),Kata_temp.temperature("100","celsius"))[:add]
    end

    def test_add_has_to_be_commutative
        assert_equal 250, Kata_temp.operations(Kata_temp.temperature("100","celsius"),Kata_temp.temperature("150","celsius"))[:add]
    end

    def test_scale_has_to_be_the_same_in_every_operation
        assert_equal "celsius", Kata_temp.operations(Kata_temp.temperature("100","celsius"),Kata_temp.temperature("150","celsius"))[:scale]
    end

    def test_sub_has_to_be_one_number_les_the_other
        assert_equal 50, Kata_temp.operations(Kata_temp.temperature("150","celsius"),Kata_temp.temperature("100","celsius"))[:sub]
    end

    def test_mul_has_to_be_one_number_multiplyed_by_the_other
        assert_equal 15000, Kata_temp.operations(Kata_temp.temperature("150","celsius"),Kata_temp.temperature("100","celsius"))[:mul]
    end

    def test_mul_has_to_be_commutative
        assert_equal 15000, Kata_temp.operations(Kata_temp.temperature("100","celsius"),Kata_temp.temperature("150","celsius"))[:mul]
    end

    def test_div_has_to_be_one_number_divided_by_other
        assert_equal 1.5, Kata_temp.operations(Kata_temp.temperature("150","celsius"),Kata_temp.temperature("100","celsius"))[:div]
    end

    def test_convert_from_celsius_to_kelvin
        assert_equal 423.16, Kata_temp.to_kelvin(Kata_temp.temperature("150","celsius")).value
    end

    def test_convert_from_fahrenheit_to_kelvin
        assert_equal 338.71555555555557, Kata_temp.to_kelvin(Kata_temp.temperature("150","fahrenheit")).value
    end

    def test_convert_from_kelvin_to_kelvin
        assert_equal 150, Kata_temp.to_kelvin(Kata_temp.temperature("150","kelvin")).value
    end

    def test_convert_from_celsius_to_fahrenheit
        assert_equal 302, Kata_temp.to_fahrenheit(Kata_temp.temperature("150","celsius")).value
    end

    def test_convert_from_fahrenheit_to_fahrenheit
        assert_equal 150, Kata_temp.to_fahrenheit(Kata_temp.temperature("150","fahrenheit")).value
    end

    def test_convert_from_kelvin_to_fahrenheit
        assert_equal -189.68800000000005, Kata_temp.to_fahrenheit(Kata_temp.temperature("150","kelvin")).value
    end

    def test_convert_from_celsius_to_celsius
        assert_equal 150, Kata_temp.to_celsius(Kata_temp.temperature("150","celsius")).value
    end

    def test_convert_from_fahrenheit_to_celsius
        assert_equal 65.55555555555556, Kata_temp.to_celsius(Kata_temp.temperature("150","fahrenheit")).value
    end

    def test_convert_from_kelvin_to_celsius
        assert_equal -123.16000000000003, Kata_temp.to_celsius(Kata_temp.temperature("150","kelvin")).value
    end

    def test_kelvin_sub_can_not_be_0
        assert_equal "kelvin can't be 0", Kata_temp.operations(Kata_temp.temperature("150","kelvin"),Kata_temp.temperature("150","kelvin"))[:sub]
    end

    def test_the_final_results_of_every_temperature_operation
        results = {
            :add => 583.1600000000001,
            :sub => -283.16,
            :mul => 64974.00000000001,
            :div => 0.3462923630990858,
            :scale => "kelvin"
        }

        assert_equal results, main("150","kelvin","160","celsius")
    end

end
