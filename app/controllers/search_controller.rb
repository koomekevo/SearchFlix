class SearchController < ApplicationController
  def search
    @films = if params[:term].nil?
               []
             else
               Film.search params[:term]
             end
  end
end