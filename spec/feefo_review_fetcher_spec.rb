require 'spec_helper'
require 'feefo_review_fetcher'
require 'remote_feefo_review_fetcher'

describe "Fetching a set of reviews" do
  before do
    Redis.new.flushdb
  end

  let(:feefo_review_fetcher) do
    config = {
      'account'               => 'www.sealinktravelgroup.com.au/SeaLink KI',
      'time_to_cache_reviews' => 25,
      'review_limit'          => 9
    }
    FeefoReviewFetcher.new('HTCC', config)
  end

  subject(:reviews) do
    VCR.use_cassette('feefo_reviews_with_feedback') do
      feefo_review_fetcher.fetch_reviews_json
    end
  end

  it 'should return a String' do
    expect(reviews).to be_an_instance_of(String)
  end

  context 'when converted to json' do
    subject(:json) { JSON.load(reviews) }

    it { should be_a(Hash) }
    it { should include 'FEEDBACKLIST' }

    context 'its FEEDBACK list' do
      let(:feedback) { json['FEEDBACKLIST']['FEEDBACK'] }
      subject(:feedback_length) { feedback.length }

      it { should eq 9 }

      context 'its first FEEDBACK element' do
        subject { feedback.first }
        it { should be_a(Hash) }
        it { should include 'PRODUCTRATING' }
        # These guys are optional keys:
        # it { should include *%w(SERVICERATING CUSTOMERCOMMENT VENDORCOMMENT) }
      end
    end

    context 'its SUMMARY' do
      subject { json['FEEDBACKLIST']['SUMMARY'] }
      it { should include *%w(COUNT AVERAGE) }
    end
  end
end
