# -*- coding: utf-8 -*-
# Todo ネーミングセンスを獲得すること

require './portal.rb'
require './notification.rb'
require './library.rb'

@conf = YAML.load(open('config.yml').read)

s = SlackNotification.new
task :portal do
  p = Portal.new
  p.login
  for i in 1..7 do
    s.post(p.subject(i), @conf['slack']['portal_room'], p.content(i))
  end
end

task :library do
  l = Library.new
  l.login
  cal = "現在貸出中の本は#{p.circulation(1)}冊です\n"
  cal += "累積貸出数は#{p.circulation(2)}冊です\n"
  cal += "現在予約中の本は#{p.circulation(3)}冊です\n"
  cal += "返却期限切れの本は#{p.circulation(4)}冊です"
  s.post('現在の利用状況', @conf['slack']['library_room'], cal)
end
