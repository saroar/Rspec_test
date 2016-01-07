require 'rails_helper'

RSpec.feature 'Delete an Article' do

  before do
    @article = Article.create(title: 'Hello', body: 'Hello World')
  end

  scenario 'delete article' do
    visit '/'

    click_link @article.title
    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(current_path).to eq(articles_path)
  end
end