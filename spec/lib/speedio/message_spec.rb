require 'spec_helper'

describe Speedio::Message do
  describe "#send" do
    let(:request_mock) { double post: true }

    subject { described_class.new :number, :message }

    before do
      Speedio::Request.stub(:new).and_return request_mock
    end

    it "should call request with correct params" do
      request_mock.should_receive(:post).with({
        to: :number, content: :message
      })

      subject.send
    end
  end
end
