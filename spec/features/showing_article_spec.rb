require 'rails_helper'

RSpec.feature 'Show an Article' do
  before do
    @article = Article.create(title: 'This is 1st article', body: 'This is 1st body')
  end

  scenario 'Display Single article' do
    visit '/'

    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
