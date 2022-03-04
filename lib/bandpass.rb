# frozen_string_literal: true

def bandpass_filter(array,lowerlimit = 40,upperlimit = 1000)
  array.map! do |x|
    if x < lowerlimit
      x = lowerlimit
    elsif x > upperlimit
      x = upperlimit
    else
      x = x
    end
  end
end
