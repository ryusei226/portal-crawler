# -*- coding: utf-8 -*-
require File.expand_path('../base.rb', __FILE__)
require 'date'

#とてもつらい

class Library < Base

  def login
    @session.visit('http://linkit.kanazawa-it.ac.jp/linusnc_jlne3010.html')
    @session.fill_in 'riyousha_no_tx', with: @conf['library']['id']
    @session.fill_in 'passwd_tx', with: @conf['library']['pass']
    @session.click_button ' 照  会 '
    @page = Nokogiri::HTML.parse(@session.html)
  end

  def path(xpath)
    @page.xpath(xpath).text.strip
  end

  def circulation(num)
    path("//table[2]/tbody/tr[#{num}]/td[2]/b/font/p")
  end

  def book_info(tr, td)
    path("//center[3]/table/tbody/tr[#{tr}]/td[#{td}]/b")
  end

  def reserved_book(tr, td)
    path("//center[3]/cneter/table/tbody/tr[#{tr}]/td[#{td}]/b")
  end

  def loan_period(num)
    split = book_info(num, 2).split('/')
    Date.new(split[0].to_i, split[1].to_i, split[2].to_i).jd - Date.today.jd
  end
end
