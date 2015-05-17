# -*- coding: utf-8 -*-
# Todo ネーミングセンスを獲得すること

require './portal.rb'
require './notification.rb'
require './library.rb'

task :slack do
  for i in 1..4 do
    s = SlackNotification.new
    p = Portal.new
    p.login
    s.post(p.subject(i), p.content(i))
  end
end
