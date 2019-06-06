require 'rails_helper'

RSpec.describe Result, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:submission) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
