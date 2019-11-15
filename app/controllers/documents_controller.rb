class DocumentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @documents = current_user.documents
    end

    def new
        @document = Document.new
    end

    def create
        @document = Document.new(document_params)
        @document.user_id = current_user.id
        @document.save
        redirect_to documents_path
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
            redirect_to @document
         else
            render 'edit'
        end
    end

    def destroy
        @document = Document.find(params[:id])
        @document.destroy
     
        redirect_to documents_path
    end

    private
    def document_params
        params.require(:document).permit(:title, :description)
    end
end
