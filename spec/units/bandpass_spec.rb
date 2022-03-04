# frozen_string_literal: true

require 'bandpass'

describe 'bandpass_filter' do
  it "returns a single number array" do
    expect(bandpass_filter([60])).to eq [60]
  end

  it "returns a multi-number array" do
    expect(bandpass_filter([60,70,80])).to eq [60,70,80]
  end
end
