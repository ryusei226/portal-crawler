# -*- coding: utf-8 -*-

require File.expand_path('../base.rb', __FILE__)

# Rubyで心ぴょんぴょんしたい…したくない…？

class Portal < Base
  def login
    @session.visit ('http://portal10.mars.kanazawa-it.ac.jp/portal/student')
    @session.fill_in 'uid', with: @conf['portal']['id']
    @session.fill_in 'pw', with: @conf['portal']['pass']
    @session.click_button 'ログイン'
    @session.click_link '科目別連絡'
    @page = Nokogiri::HTML.parse(@session.html)
  end

  def subject(num)
    @page.xpath("//table[@class='default'][#{num}]/tbody/tr/th/a").text
  end

  def content(num)
    @page.xpath("//table[@class='default'][#{num}]/tbody/tr/td/table/tbody/tr/td/ul/li").text
  end
end
