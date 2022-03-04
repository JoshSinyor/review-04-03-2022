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

  it "filters out frequencies that are below an overridden lower limit" do
    expect(bandpass_filter([50],100)).to eq [100]
  end

  it "filters out multiple frequencies that are below an overridden lower limit" do
    expect(bandpass_filter([30,40,50,100,110],100)).to eq [100,100,100,100,110]
  end

  it "filters out frequencies that are above an overridden upper limit" do
    expect(bandpass_filter([1150],40,1100)).to eq [1100]
  end

  it "filters out multiple frequencies that are above an overridden upper limit" do
    expect(bandpass_filter([40,50,1000,1100,1150],40,1100)).to eq [40,50,1000,1100,1100]
  end
end
