require 'spec_helper'

describe Run do
  it "runs" do
    expect(Run.this_is_covered).to eq 1
  end
end
