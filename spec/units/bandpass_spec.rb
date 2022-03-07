# frozen_string_literal: true

require 'bandpass'

describe 'bandpass_filter' do
  it 'filters out frequencies that are lower or higher than the default limits' do
    expect(bandpass_filter([30])).to eq [40]
    expect(bandpass_filter([1100])).to eq [1000]
  end

  it 'filters out multiple frequencies that are lower or higher than the default limits' do
    expect(bandpass_filter([30, 40, 500, 1000, 1010])).to eq [40, 40, 500, 1000, 1000]
  end

  it 'filters out multiple frequencies that are lower or higher than overridden limits' do
    expect(bandpass_filter([50, 100, 500, 1100, 1150], 100, 1100)).to eq [100, 100, 500, 1100, 1100]
  end

  it 'raises an error when not supplied with an array' do
    expect { bandpass_filter('Hello World!') }.to raise_error('Sound waves are not parsed correctly')
  end

  it 'raises an error when a supplied array includes a non-positive integer' do
    expect do
      bandpass_filter([30, 40, 'Hello World!', 1000, 1010])
    end.to raise_error('Sound waves are not parsed correctly')
  end

  it 'passes the first acceptance criterion' do
    expect(bandpass_filter([60, 10, 45, 60, 1500])).to eq [60, 40, 45, 60, 1000]
  end

  it 'passes the secound acceptance criterion' do
    expect { bandpass_filter('Hello World!') }.to raise_error('Sound waves are not parsed correctly')
  end

  it 'passes the third acceptance criterion' do
    expect do
      bandpass_filter([60, 10, 45, 'Hello World!', 1500])
    end.to raise_error('Sound waves are not parsed correctly')
  end
end
