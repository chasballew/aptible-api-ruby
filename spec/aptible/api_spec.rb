require 'spec_helper'
require 'aptible/auth'

describe Aptible::Api do
  subject { Aptible::Api::App.new }

  it 'should have a configurable root_url' do
    config = described_class.configuration
    expect(config).to be_a GemConfig::Configuration
    expect(config.root_url).to eq 'https://api.aptible.com'
  end

  pending 'uses ENV["APTIBLE_API_ROOT_URL"] if defined' do
    config = described_class.configuration
    set_env 'APTIBLE_API_ROOT_URL', 'http://foobar.com' do
      config.reset
      expect(config.root_url).to eq 'http://foobar.com'
    end
  end
end
