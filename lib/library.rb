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

  def book_due_date(num)
    path("//center[3]/table/tbody/tr[#{num}]/td[2]/b")
  end

  def book_name(num)
    path("//center[3]/table/tbody/tr[#{num}]/td[4]/b")
  end

  def book_author(num)
    path("//center[3]/table/tbody/tr[#{num}]/td[5]/b")
  end

  def loan_period(num)
    split = path("//center[3]/table/tbody/tr[#{num}]/td[2]/b").split('/')
    Date.new(split[0].to_i, split[1].to_i, split[2].to_i).jd - Date.today.jd
  end

  def due_date

  end

end
