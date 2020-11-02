require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |course|
      course = Course.new
      course.title = course.css("h2").text
      course.schedule = course.css(".date").text
      course.description = course.css("p").text
    end
  end

end
