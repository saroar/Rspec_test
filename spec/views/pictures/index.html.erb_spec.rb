require 'rails_helper'

RSpec.describe "pictures/index", type: :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        :album => nil,
        :user => nil,
        :caption => "Caption",
        :description => "MyText"
      ),
      Picture.create!(
        :album => nil,
        :user => nil,
        :caption => "Caption",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
