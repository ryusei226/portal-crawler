# -*- coding: utf-8 -*-

require 'yaml'
require 'slack'

class SlackNotification
  def initialize
    @conf = YAML.load(open('config.yml').read)
    Slack.configure do |config|
      config.token = @conf['slack']['token']
    end
  end

  def post(username, text)
    Slack.chat_postMessage(text: text, channel: '#'+@conf['slack']['room'], username: username)
  end
end
