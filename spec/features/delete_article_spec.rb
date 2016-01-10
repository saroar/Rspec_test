require 'rails_helper'

RSpec.feature 'Delete an Article' do

  before do
    @jon = User.create!(email: "jon@email.com", password: "password")
    login_as @jon
    @article = Article.create(title: 'Hello', body: 'Hello World', user: @jon)
  end

  scenario 'delete article' do
    visit '/'

    click_link @article.title
    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(current_path).to eq(articles_path)
  end
end
