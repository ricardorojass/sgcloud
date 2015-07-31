class VersionsController < ApplicationController
  before_action :set_document, only: [:new, :create, :update, :destroy]

  def new
    @version = Version.new
  end

  def create
    @version = @document.versions.build(versions_params)
    if @version.save
      redirect_to @document
    else
      render :new
    end
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def version_params
      params.require(:version).permit(:number, :uploaded_file)
    end
end
