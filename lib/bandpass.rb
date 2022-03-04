# frozen_string_literal: true

def bandpass_filter(array,lowerlimit = 40)
  array.map! do |x|
    if x < lowerlimit
      x = lowerlimit
    elsif x > 1000
      x = 1000
    else
      x = x
    end
  end
end
