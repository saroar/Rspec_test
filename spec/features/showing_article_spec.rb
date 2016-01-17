require 'rails_helper'

RSpec.feature 'Show an Article' do
  before do
    @jon =  User.create(email: "jon@email.com", password: "password")
    @fred = User.create(email: "fred@email.com", password: "password")
    @article = Article.create(title: 'This is 1st article', body: 'This is 1st body')
  end

  scenario "A non-signed in user dones not see Edit or Delete links" do
    visit '/'

    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "A non-owner signed in cannot see both links" do
    login_as(@fred)

    visit '/'

    click_link @article.title

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "A signed in owner sees both links" do
    login_as(@jon)

    visit '/'

    click_link @article.title

    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end

  scenario 'Display Single article' do
    visit '/'

    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
