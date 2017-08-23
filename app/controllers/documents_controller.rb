class DocumentsController < ApplicationController
  def index
    search_query = params[:search].present? ? params[:search] : nil
    if search_query
      @documents = Document.search(search_query)
    else
      @documents = Document.all.order(created_at: :desc)
    end
    @results = @documents.count
  end

  def new
    @document = Document.new
    puts "bucket: #{ENV['AWS_S3_BUCKET_NAME']}"
  end

  def create
    #call class

    @document = current_user.documents.build(document_params)

    if @document.save
      flash[:notice] = "Document upload is complete!"
      puts "Success"
      redirect_to documents_path
    else
      flash[:alert] = "There was an error saving the document. Please try again."
      puts "There is an error"
      render :new
    end
  end

  def show
    @document = Document.find(params[:id])
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update(document_params)
      flash[:notice] = "Document Uploaded!"
      redirect_to @document
    else
      flash[:alert] = "There was an error saving the document. Please try again."
      render :edit
    end
  end

  def destroy
    @document = Document.find(params[:id])
    if @document.destroy
      flash[:notice] = "Document has been deleted!"
      redirect_to documents_path
    else
      flash[:notice] = "This document couldn't be deleted."
      redirect_to @document
    end
  end

  def autocomplete
    render json: Document.search(params[:query], {
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
  end

  private
  # Using a private method to encapsulate the permissible parameters
  def document_params
    params.require(:document).permit(:title, :description, :keywords, :document_file)
  end
end
