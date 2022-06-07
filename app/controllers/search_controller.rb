class SearchController < ApplicationController
  def search
    if params[:term].nil?
      @films = []
    else
      term = params[:term]
      @films = Film.search term, fields: [:text], highlight: true
    end
  end
end
