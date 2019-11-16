require 'rails_helper'
require_relative '../support/devise'

RSpec.describe DocumentsController, type: :controller do
    let(:document) { FactoryBot.create(:document) }
    describe "Documents controller request specs" do
        let(:document) { FactoryBot.create(:document) }
        end
        login_user
        
        context 'GET #index' do
            it 'should return 200:OK' do
                get :index
                expect(response).to have_http_status(:success)
            end
        end
   
        context "POST #create" do
            it "creates a new document" do
                post :create , :params => { :document => {:title => "My Doc", :description => "My doc description", :attachment => "Live life"} }
                expect(response.content_type).to eq "text/html; charset=utf-8"
            end
        end

        context "DELETE #destroy" do
            it "deletes the document" do
                document = FactoryBot.create(:document)
                expect do
                    delete :destroy, params: {id: document.id }
                end.to change(Document, :count).by(-1)
            end
        end
    end
    
    describe 'PUT update' do
        before :each do
          @document = FactoryBot.create(:document,title: "Lawrence Smith")
        end

        context "valid attributes" do
        it "located the requested @document" do
            put :update, :id => @document.id, document: FactoryBot.attributes_for(:document)
            assigns(:document).should eq(@document)      
        end

        it "changes @document's attributes" do
            put :update, :id=> @document.id, document: FactoryBot.attributes_for(:document, title: "Larry Smith")
            @document.reload
            @document.title.should eq("Larry Smith")

        end

     end
end
