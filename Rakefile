# -*- coding: utf-8 -*-
# Todo ネーミングセンスを獲得すること

require './portal.rb'
require './notification.rb'
require './library.rb'

@conf = YAML.load(open('config.yml').read)

task :portal do
  s = SlackNotification.new
  p = Portal.new
  p.login
  for i in 1..7 do
    s.post(p.subject(i), @conf['slack']['portal_room'], p.content(i))
  end
end

task :library do
  s = SlackNotification.new
  p = Library.new
  p.login
  msg = "現在貸出中の本は#{p.circulation(1)}冊です\n"
  msg += "累積貸出数は#{p.circulation(2)}冊です\n"
  msg += "現在予約中の本は#{p.circulation(3)}冊です\n"
  msg += "返却期限切れの本は#{p.circulation(4)}冊です"
  s.post('Library', @conf['slack']['library_room'] , msg)
end
