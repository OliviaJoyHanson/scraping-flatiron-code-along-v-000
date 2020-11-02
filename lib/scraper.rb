require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    get_page.css(".posts-holder")
  end

  def make_courses
    get_courses.each do |course|
      course = Course.new
    end
  end

end
