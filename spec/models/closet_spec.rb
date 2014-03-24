require 'spec_helper'

describe Closet do
  it { should belong_to(:user) }
  it { should have_many(:stores) }
end
