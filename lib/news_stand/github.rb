require 'news_stand'
require "news_stand/github/version"
require 'github_api'

module NewsStand
  class Github
    def initialize(options = {})
      @user = options['user']
      @repo = options['repo']
      @access_token = options['access_token']
      @issue_api = ::Github.new(oauth_token: access_token).issues
    end

    def all(state = 'open')
      @issue_api.list(user: user, repo: repo, state: state)
    end

    def get(number)
      @issue_api.find(user, repo, number)
    end

    def set(attributes = {})
      if attributes['number']
        number = attributes.delete('number')
        @issue_api.edit(user, repo, number, attributes)
      else
        @issue_api.create(user, repo, attributes)
      end
    end

    private
    def user
      @user
    end

    def repo
      @repo
    end

    def access_token
      @access_token
    end

    def issue_api
      @issue_api
    end
  end
end
