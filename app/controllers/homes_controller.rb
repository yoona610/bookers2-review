class HomesController < ApplicationController
  def top
  end

  def about
  end

  def search
    @book = Book.new
    @books = Book.search(params[:keyword])
  end
end
