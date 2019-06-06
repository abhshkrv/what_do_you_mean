require 'rails_helper'

RSpec.describe Submission, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reactions) }

    it { should have_one(:result) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
