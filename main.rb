#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'capybara/poltergeist'
require 'nokogiri'
require 'open-uri'
require 'yaml'

Capybara.current_driver = :selenium

Capybara.app_host = "http://portal10.mars.kanazawa-it.ac.jp/portal/student"
Capybara.default_wait_time = 5

module Crawler
  class Portal
    include Capybara::DSL
    def login
      visit('')
      #ポータルのIDとパスワードを入力
      fill_in "uid",
              :with => 'STUDENT_ID'
      fill_in "pw",
              :with => 'PASSWORD'
      click_button "ログイン"
    end

    def portal
      click_link("科目別連絡")
    end

    def report
      page = Nokogiri::HTML.parse(open("http://portal10.mars.kanazawa-it.ac.jp/portal/student"))
      p page

      #{within(:xpath, "/html/body/div[4]/form/table[1]/tbody/tr[1]/th/") do
      #  puts "教科:"+all('a').text
      #end
      #within(:xpath, "/html/body/div[4]/form/table[1]/tbody/tr[2]/td/table/tbody/tr/td/ul") do
      #  puts all('li').text
      #end
    end
  end
end

crawler = Crawler::Portal.new
crawler.login
crawler.portal
crawler.report
