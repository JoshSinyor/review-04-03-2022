# frozen_string_literal: true

require 'bandpass'

describe 'bandpass_filter' do
  it 'filters out frequencies that are lower or higher than the default limits (first acceptance criterion)' do
    expect(bandpass_filter([60, 10, 45, 60, 1500])).to eq [60, 40, 45, 60, 1000]
  end

  it 'filters out frequencies that are lower or higher than overridden limits (second acceptance criterion)' do
    expect(bandpass_filter([60, 10, 45, 60, 1500], 45, 60)).to eq [60, 45, 45, 60, 60]
  end

  it 'raises an error when not supplied with an array (third acceptance criterion)' do
    expect { bandpass_filter('Hello World!') }.to raise_error('Sound waves are not parsed correctly')
  end

  it 'raises an error when a supplied soundwave includes a non-positive integer (fourth acceptance criterion)' do
    expect do
      bandpass_filter([60, 10, 45, 'Hello World!', 1500])
    end.to raise_error('Sound waves are not parsed correctly')

    expect do
      bandpass_filter([60, 10, 45, -60, 1500])
    end.to raise_error('Sound waves are not parsed correctly')
  end

  it 'filters 100ms of soundwave in less than 100ms (fifth acceptance criterion)' do
    # 20-20,000Hz is approximately the range of human hearing.
    soundwave = []
    44_100.times { soundwave.push(rand(20..20_000)) }

    start_time = Time.now

    # 350-17,000Hz is, including harmonics, the approximate human vocal range.
    bandpass_filter(soundwave, 350, 17_000)

    expect(start_time).to be <= (Time.now + 1)
  end
end
