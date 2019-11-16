# frozen_string_literal: true

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
    if @document.save
      flash[:notice] = 'Document was created!'
      redirect_to documents_path
    else
      render 'new'
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
      flash[:notice] = 'Document was updated!'
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    if @document.destroy
      flash[:notice] = 'Document was deleted!'
      redirect_to documents_path
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :description, :attachment)
  end
end
