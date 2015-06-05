require 'hyperclient'
require 'rspec'
require 'webmock/rspec'

describe Hyperclient do
  before(:all) { WebMock.disable_net_connect! }
  after(:all) { WebMock.allow_net_connect! }

  let(:page1_body) { File.read('./spec/support/page1.json') }
  let(:page2_body) { File.read('./spec/support/page2.json') }
  let(:page3_body) { File.read('./spec/support/page3.json') }

  before do
    stub_request(:get, 'http://localhost/page1')
      .to_return(status: 200,
                 body: page1_body,
                 headers: { 'Content-Type' => 'application/hal+json' })

    stub_request(:get, 'http://localhost/page2')
      .to_return(status: 200,
                 body: page3_body,
                 headers: { 'Content-Type' => 'application/hal+json' })

    stub_request(:get, 'http://localhost/page3')
      .to_return(status: 200,
                 body: page3_body,
                 headers: { 'Content-Type' => 'application/hal+json' })
  end

  subject { Hyperclient.new('http://localhost/page1') }

  describe 'getting first page' do
    it 'returns record in first page' do
      expect(subject.names.first.name).to eq 'page1'
    end
  end

  describe 'getting second page' do
    # This test case fails
    it 'returns record in second page' do
      expect(subject.next.names.first.name).to eq 'page2'
    end
  end
end
