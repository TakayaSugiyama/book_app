class BooksController < ApplicationController
  def index
    if params[:keyword]
      @items = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end
end
