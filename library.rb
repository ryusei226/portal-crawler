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

  def circulation(num)
    @page.xpath("//table[2]/tbody/tr[#{num}]/td[2]/b/font/p").text.strip
  end

  def loan_period(date)
    split = date.split("/")
    Date.new(split[0].to_i, split[1].to_i, split[2].to_i).jd - Date.today.jd
  end
end
