require 'spec_helper'

describe Store do
  it { should belong_to(:closet) }
  it { should have_many(:categories) }
end
