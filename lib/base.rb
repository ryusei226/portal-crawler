# -*- coding: utf-8 -*-

require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'nokogiri'
require 'yaml'

class Base
  include Capybara::DSL

  def initialize
    @conf = YAML.load(open('config.yml').read)
    Capybara.current_driver = :poltergeist
    Capybara.javascript_driver = :poltergeist
    @session = Capybara::Session.new(:poltergeist)
    @session.driver.headers = {'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X)"}
  end

  def query_with_type(query)
    type = query.index('//') ? :xpath : :css
    [type, query]
  end

  def scrape_table(query)
    elem = s.find(*query_with_type(query))
    raise 'not a elem selector' if elem.tag_name != 'table'
    Table.new(elem)
  end
end
