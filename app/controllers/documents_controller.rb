class DocumentsController < ApplicationController
    before_action :authenticate_user!
end
