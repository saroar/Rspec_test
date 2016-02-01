require 'rails_helper'

RSpec.describe "pictures/new", type: :view do
  before(:each) do
    assign(:picture, Picture.new(
      :album => nil,
      :user => nil,
      :caption => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new picture form" do
    render

    assert_select "form[action=?][method=?]", pictures_path, "post" do

      assert_select "input#picture_album_id[name=?]", "picture[album_id]"

      assert_select "input#picture_user_id[name=?]", "picture[user_id]"

      assert_select "input#picture_caption[name=?]", "picture[caption]"

      assert_select "textarea#picture_description[name=?]", "picture[description]"
    end
  end
end
