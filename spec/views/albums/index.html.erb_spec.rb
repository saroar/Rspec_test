require 'rails_helper'

RSpec.describe "albums/index", type: :view do
  before(:each) do
    assign(:albums, [
      Album.create!(
        :user => nil,
        :title => "Title"
      ),
      Album.create!(
        :user => nil,
        :title => "Title"
      )
    ])
  end

  it "renders a list of albums" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
