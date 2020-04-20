require 'minitest/unit'

module MiniTest
  module Assertions
    def assert_same_image(expected_image_path, image_object, delta = 0.0)
      path = File.expand_path(expected_image_path)

      expected = Magick::Image.read(path).first
      _, error = expected.compare_channel(image_object, Magick::MeanSquaredErrorMetric)
      p "!" * 80
      p "#{path} : #{error}"
      assert_in_delta(0.0, error, delta)
    end
  end
end
