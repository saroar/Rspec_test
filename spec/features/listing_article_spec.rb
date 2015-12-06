require 'rails_helper'

RSpec.feature 'Listing Articles' do
  before do
    @article1 = Article.create(title: 'This is 1st Article Title', body: 'Body of first article')
    @article2 = Article.create(title: 'This is 2st Article Title', body: 'Body of second article')
  end

  scenario 'Listing all articles' do
    visit '/'

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article1.title)
  end
end
