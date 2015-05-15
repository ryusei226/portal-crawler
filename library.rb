require File.expand_path('../base.rb', __FILE__)

class Library < Base
  include Capybara::DSL

  def login
    @session.visit('http://linkit.kanazawa-it.ac.jp/linusnc_jlne3010.html')
    @session.fill_in 'riyousha_no_tx', with: @conf['library']['id']
    @session.fill_in 'passwd_tx', with: @conf['library']['pass']
    @session.click_button ' 照  会 '
  end

  def report
    page = Nokogiri::HTML.parse(@session.html)
    puts page.xpath("//p")
  end

  class Book
    attr_accessor :title, :author, :publisher, :published_at
    def initialize(title, author: nil, publisher: nil, published_at: nil)
      @title         = title

      # result list page
      @author        = author
      @publisher     = publisher
      @published_at  = Time.new(published_at.gsub('.', '/')) if published_at
    end
  end
end

c = Library.new
c.login
c.report