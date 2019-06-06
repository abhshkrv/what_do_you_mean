require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reactions) }

    it { should have_many(:submissions) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
