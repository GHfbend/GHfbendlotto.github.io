class HomeController < ApplicationController
  def click
    
  end
  
  def index
    require 'open-uri'
    require 'json'
    
     @page = open ('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=801')
     @page_info = @page.read
    
     @page_hash = JSON.parse(@page_info)
    
     @draw_numbers = []
    
      @page_hash.each do |k, v|
       @draw_numbers << v if k.include? ('drwtNo')
    end
    
    @draw_numbers.sort!
    
    @bonus_number = @page_info["7"]
    
    @lotto = [*1..45].sample(6).sort
    
    @match_numbers = @lotto & @draw_numbers
    
    @match_count = @match_numbers.count
    
    if @match_count == 6
      @result = '1등'
    elsif (@match_count == 5) && (lotto.include?(@bonus_number))
      @result = '2등'
    elsif @match_count == 5
      @result = '3등'
    elsif @match_count == 4
      @result = '4등'
    elsif @match_count == 3
      @result = '5등'
    else
      @result = '꽝'
    end
  end
end