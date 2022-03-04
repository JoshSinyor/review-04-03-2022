# frozen_string_literal: true

def bandpass_filter(soundwave, lowerlimit = 40, upperlimit = 1000)
  raise 'Sound waves are not parsed correctly' unless soundwave.instance_of? Array

  soundwave.map! do |frequency|
    if frequency < lowerlimit
      lowerlimit
    elsif frequency > upperlimit
      upperlimit
    else
      frequency
    end
  end
end
