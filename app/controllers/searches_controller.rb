class SearchesController < ApplicationController
  def search
    @mode = params[:search_mode]
  
    if @mode == "word_match"
      @word = params[:word]
      @rooms = Room.looks_word(@word)
    else
      @area = params[:area]
      @rooms = Room.looks_area(@area)
    end
    render "searches/search_result"
  end
end
