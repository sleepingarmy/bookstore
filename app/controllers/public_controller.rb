class PublicController < ApplicationController

	def index
    @books = Book.all
	end
	
end