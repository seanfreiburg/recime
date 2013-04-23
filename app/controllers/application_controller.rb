class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def image_search(name)

    agent = Mechanize.new
    agent.log = Logger.new "mech.log"



    agent.redirect_ok = false
    page = agent.get "http://www.google.com/imghp?hl=en&tab=ii"
    search_form = page.form_with :name => "f"
    query = name
    search_form.field_with(:name => "q").value = query

    search_results = agent.submit search_form
    results = search_results.parser.xpath("//a/@href").to_html
    offset = 0
    while true
      index_of_keyword = results.index("imgurl",offset)
      if index_of_keyword == nil
        break
      end
      start_of_url=index_of_keyword+7
      offset = start_of_url
      url = ""
      while results[start_of_url] != '&'
        url = url + results[start_of_url]
        start_of_url = start_of_url+1
        if results[start_of_url] == '%' && (results.index(".jpg",offset) + 4) == start_of_url
          break
        end
      end
      begin
        page = agent.get url
        if page.code.to_s.chomp == "200"
          return url
        end
      rescue
      end
    end
  end
end
