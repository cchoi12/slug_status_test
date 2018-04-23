require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'seeing if errors are overridden when valid? Is called twice with different contexts' do
    article = Article.new
    article.valid?(:title)
  end

  test 'Article status' do
    article = Article.new(title: 'Test',
                          description: 'test test',
                          status: 0
                          )
    assert_equal article.status, 'draft'
    article.status = 1
    assert_equal article.status, 'pre_published'
    article.status = 2
    assert_equal article.status, 'published'
    article.save!
    assert article.valid?
  end

  test 'Article slugged' do
    article = Article.new(title: 'Test',
                          description: 'test test',
                          status: 0
                          )
    article.save!
    assert_equal article.slug, 'Test'
    article.update!(title: 'New Title')
    assert_equal article.slug, 'New Title'
  end
end
