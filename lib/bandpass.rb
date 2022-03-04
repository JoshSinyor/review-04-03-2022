# frozen_string_literal: true

def bandpass_filter(array)
  array.map! do |x|
    if x < 40
      x = 40
    else
      x = x
    end
  end
end
