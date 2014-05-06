require 'spec_helper'

describe Category do

  before do
    @category = Category.new(name: "Lorem Ipsum")
  end

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:ancestry) }
  it { should respond_to(:information) }

  it { should be_valid }

  describe "when name is not present" do
    before { @category.name = " " }
    it { should_not be_valid }
  end

  describe "information associations" do

    before { @category.save }
    let!(:older_information) do
      FactoryGirl.create(:information, category: @category, created_at: 1.day.ago)
    end
    let!(:newer_information) do
      FactoryGirl.create(:information, category: @category, created_at: 1.hour.ago)
    end

    it "should have the right information in the right order" do
      expect(@category.information.to_a).to eq [newer_information, older_information]
    end

    it "should destroy associated information" do
      information = @category.information.to_a
      @category.destroy
      expect(information).not_to be_empty
      information.each do |information|
        expect(Information.where(id: information.id)).to be_empty
      end
    end
  end
end
