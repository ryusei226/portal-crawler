# -*- coding: utf-8 -*-
# Todo ネーミングセンスを獲得すること

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

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
  cal = "現在貸出中の本は#{l.circulation(1)}冊です\n"
  cal += "累積貸出数は#{l.circulation(2)}冊です\n"
  cal += "現在予約中の本は#{l.circulation(3)}冊です\n"
  cal += "返却期限切れの本は#{l.circulation(4)}冊です"
  s.post('現在の利用状況', @conf['slack']['library_room'], cal)

  for i in 2..l.circulation(1).to_i+1 do
    if l.loan_period(i) == 0
      msg = "本日返却期限の本は#{l.book_info(i, 4)}です"
    elsif l.loan_period(i) < 0
      msg = "#{l.book_info(i, 4)}は返却期限を#{l.loan_period(i)*(-1)}日過ぎています"
    else
      msg = "「#{l.book_info(i, 4)}」はあと#{l.loan_period(i)}日借りられます"
    end
    s.post('返却期限', @conf['slack']['library_room'], msg)
  end
end
