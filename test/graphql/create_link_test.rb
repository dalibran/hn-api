require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateLink.new.call(nil, args, {})
  end

  def create_user
    User.create name: 'test', email: 'test@example.com', password: '123456'
  end

  test 'creating new link' do
    link = perform(
      url: 'www.example.com',
      description: 'good stuff herre',
      user: :create_user
      )

    assert link.persisted?
    assert_equal link.description, 'good stuff herre'
    assert_equal link.url, 'www.example.com'
  end
end
