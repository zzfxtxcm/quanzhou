require 'spec_helper'

describe Information do

  let(:category) { FactoryGirl.create(:category) }
  before do
    @information = category.information.build(title: "Lorem ipsum",
                                              content: "Lorem ipsum")
  end

  subject { @information }

  it { should respond_to(:title) }
  it { should respond_to(:style) }
  it { should respond_to(:information_thumb) }
  it { should respond_to(:keywords) }
  it { should respond_to(:description) }
  it { should respond_to(:content) }
  it { should respond_to(:listorder) }
  it { should respond_to(:status) }
  it { should respond_to(:source) }
  it { should respond_to(:category_id) }
  it { should respond_to(:category) }
  its(:category) { should eq category }


  it { should be_valid }

  describe "when category is not present" do
    before { @information.category = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @information.title = "" }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @information.content = "" }
    it { should_not be_valid }
  end

  describe "with keywords that is too long" do
    before { @information.keywords = "a" * 101 }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @information.description = "a" * 201 }
    it { should_not be_valid }
  end
end
