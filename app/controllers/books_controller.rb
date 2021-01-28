class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show                      #will render app/views/books/show.html.haml by default
    id = params[:id]            #retrieve books ID from URI route
    @book = Book.find(id)       #look up book by unique ID
  end

  # def create
  #   params.require(:book)
  #   permitted = params[:book].permit(:title,:genre,:description,:ISBN_number,:publish_date)
  #   @book = Book.create!(permitted)
  #   flash[:notice] = "#{@book.title} was successully created."
  #   redirect_to books_path
  # end

  def create
    params.require(:book)
    permitted = params[:book].permit(:title,:genre,:description,:ISBN_number,:publish_date)
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "#{@book.title} was successully created."
      redirect_to books_path
    else
      render 'new' # note, new template can access @movie's field values!
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  # def update
  #   @book = Book.find params[:id]
  #   params.require(:book)
  #   permitted = params[:book].permit(:title,:genre,:description,:ISBN_number,:publish_date)
  #   @book.update_attributes!(permitted)
  #   flash[:notice] = "#{@book.title} was successfully updated."
  #   redirect_to book_path(@book)
  # end

  def update
    @book = Book.find params[:id]
    params.require(:book)
    permitted = params[:book].permit(:title,:genre,:description,:ISBN_number,:publish_date)
    if @book.update_attributes!(permitted)
      flash[:notice] = "#{@book.title} was successfully updated."
      redirect_to book_path(@book)
    else
      render 'edit' #note, 'edit' template can access @movie's field values!
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "#{@book.title} was successfully deleted."
    redirect_to book_path(@book)
  end
end
