class DocumentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @documents = Document.all
    end

    def new
        @document = Document.new
    end

    def create
        @document = Document.new(document_params)
        @document.save
        redirect_to documents_path
    end

    private
    def document_params
        params.require(:document).permit(:title, :description)
    end
end
