require 'spec_helper'

describe Category do
  it { should belong_to(:store) }
  it { should have_many(:sizes) }
end
