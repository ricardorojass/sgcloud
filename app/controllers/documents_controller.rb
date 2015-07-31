class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all
  end

  def show
  end

  def new
    @document = Document.new
    @document.build_category
    @document.build_current_version
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    version = Version.new(uploaded_file:params[:uploaded_file])
    version.assign_number_last_version
    @document.current_version = version
    if @document.save
      redirect_to @document,
      notice: 'Document was successfully created.'
    else
      render :new
    end
  end

  def update
    if @document.update(document_params)
      redirect_to @document,
      notice: 'Document was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
      redirect_to documents_url,
      notice: 'Document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:code, :version, :origin, :title,
                                       :description, :location, :category_id)
    end
end
