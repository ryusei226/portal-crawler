require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
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

  def top
    @session.visit self.class.url
  end

  def login(url, id_input, id, password_input, password, button_name)
    @session.visit (url)
    @session.fill_in id_input, with: id
    @session.fill_in password_input, with: password
    @session.click_button button_name
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

  class Table
    def initialize(element)
      @element = element
    end

    def headers
      @element.all('th')
    end

    def rows
      item_rows = @element.all('tr')
      item_rows = item_rows.drop(1) if headers.present?
      item_rows.map { |row| Row.new(row) }
    end

    class Row
      def initialize(element)
        @element = element
      end

      def tds
        @element.all('td')
      end

      alias :cells :tds
    end
  end
end
