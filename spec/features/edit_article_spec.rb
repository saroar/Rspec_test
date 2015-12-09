require 'rails_helper'

RSpec.feature "Edit an Article" do

  before do
    @article = Article.create(title: 'Hello', body: 'Hello World')
  end

  scenario 'update article' do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: 'Updated article'
    fill_in 'Body', with: 'Updated body of article'
    click_button 'Update Article'

    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario '' do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Update Article'

    expect(page).to have_content('Article has not been updated')
    expect(page.current_path).to eq(article_path(@article))
  end
end
