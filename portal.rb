require File.expand_path('../base.rb', __FILE__)

class Portal < Base
  def login
    @session.visit ('http://portal10.mars.kanazawa-it.ac.jp/portal/student')
    @session.fill_in 'uid', with: @conf['portal']['id']
    @session.fill_in 'pw', with: @conf['portal']['pass']
    @session.click_button 'ログイン'
    @session.click_link '科目別連絡'
  end

  def report
    page = Nokogiri::HTML.parse(@session.html)
    puts page.xpath("//th[@class='header']/a")
  end
end

s = Portal.new
s.login
s.report
