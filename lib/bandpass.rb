# frozen_string_literal: true

def bandpass_filter(soundwave, lowerlimit = 40, upperlimit = 1000)
  raise 'Sound waves are not parsed correctly' unless soundwave.is_a? Array

  map_soundwave(soundwave, lowerlimit, upperlimit)
end

private

def map_soundwave(soundwave, lowerlimit, upperlimit)
  soundwave.map! do |frequency|
    raise 'Sound waves are not parsed correctly' unless frequency.is_a?(Integer) && frequency.positive?

    next(lowerlimit) if frequency < lowerlimit
    next(upperlimit) if frequency > upperlimit

    frequency
  end
end
