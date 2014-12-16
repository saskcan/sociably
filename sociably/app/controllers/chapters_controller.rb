class ChaptersController < ApplicationController

	before_action :get_book
	before_action :get_chapter, only: [:show, :update, :destroy]

	# GET books/1/chapters
  # GET books/1/chapters.json
  def index
  	@chapters = @book.chapters
  	@chapter = @book.chapters.build()
  end

  # GET books/1/chapter/1
  # GET books/1/chapter/1.json
  def show
	end

	# POST books/1/chapters
	# POST books/1/chapters.json
	def create
		@chapter = Chapter.new(chapter_params)
		@chapter.book = @book

		respond_to do |format|
			if @chapter.save
				format.html { redirect_to book_chapter_path(@book, @chapter), notice: 'Chapter was created successfully' }
				format.json { render action: 'show', status: :created, location: @chapter }
			else
				format.html { render action: 'new' }
				format.json { render json: @chapter.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /books/1/chapters/1
  # PATCH/PUT /books/1/chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to book_chapters_path(@book), notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1/chapters/1
  # DELETE /books/1/chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to book_chapters_url(@book) }
      format.json { head :no_content }
    end
  end

  private
  def get_book
  	@book = Book.find(params[:book_id])
  end

  def get_chapter
  	@chapter = Chapter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def chapter_params
    params.require(:chapter).permit(:title)
  end

end