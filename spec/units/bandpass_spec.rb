# frozen_string_literal: true

require 'bandpass'

describe 'bandpass_filter' do
  it "returns a single number array" do
    expect(bandpass_filter([60])).to eq [60]
  end

  it "returns a multi-number array" do
    expect(bandpass_filter([60,70,80])).to eq [60,70,80]
  end

  it "filters out frequencies that are too low" do
    expect(bandpass_filter([30])).to eq [40]
  end

  it "filters out multiple frequencies that are too low" do
    expect(bandpass_filter([20,30,40,50,60])).to eq [40,40,40,50,60]
  end

  it "filters out frequencies that are too high" do
    expect(bandpass_filter([1010])).to eq [1000]
  end

  it "filters out multiple frequencies that are too low" do
    expect(bandpass_filter([990,1000,1010,1020])).to eq [990,1000,1000,1000]
  end
end
