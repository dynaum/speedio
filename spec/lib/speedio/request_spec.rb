require 'spec_helper'

describe Speedio::Request do
  describe "#post" do
    let(:params) { { to: "554888303054", content: "VCR cleaning" } }

    def do_post
      subject.post params
    end

    it "should return a parsed response" do
      VCR.use_cassette('speedio_request') do
        response = do_post
        response.to.should eq "554888303054"
      end
    end

    context "when an error occurs" do
      let(:params) { { to: '5511971889422' } }

      it "should raise an exception" do
        VCR.use_cassette('speedio_request_error') do
          expect { do_post }.to raise_error Speedio::Error, 'Invalid request'
        end
      end
    end
  end
end
