require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

    before(:all) do
        @profile_1 = Profile.create(name: 'nithin', base_url: 'base_url1', auth_type: 'auth_type1', default_user_name: 'nithin', default_password: '12345')
        @profile_2 = Profile.create(name: 'raj', base_url: 'base_url2', auth_type: 'auth_type3', default_user_name: 'raj', default_password: '5678')
    end

        it '#index' do
            get :index
            expect(response.status).to eql(200)
            expect(response).to render_template(:index)
        end
    

        it '#new' do
            get :new
            expect(response.status).to eql(200)
            expect(response).to render_template(:new)
        end

        it '#show' do
            get :show, id: @profile_1[:id]
            expect(response.status).to eql(200)
            expect(response).to render_template(:show)
        end


        it '#edit' do
            get :edit, id: @profile_1[:id]
            expect(response.status).to eql(200)
            expect(response).to render_template(:edit)
        end


        describe '#create' do
            before(:all) do
                @profile_params = {name: 'name', base_url: 'base_url', auth_type: 'auth_type', default_user_name: 'default_user_name', default_password: 'default_password'}
            end

            it 'creates profiles' do
               expect{ post :create, profile: @profile_params }.to change{Profile.all.size}.by(1)
            end

            it "redirect on success" do
                post :create, profile: @profile_params
                expect(response).not_to have_http_status(200)
                expect(response.status).to eql(302)
                expect(response).to redirect_to(profiles_path)
            end
    
            it "render :new on fail" do
                allow_any_instance_of(Profile).to receive(:save).and_return(false)
                post :create, profile: @profile_params
                expect(response).not_to have_http_status(302)
                expect(response).to render_template(:new)
            end

        end

    
        describe "#destroy" do
            before(:each) do
                @profile_3 = @profile_2 
            end

            it "destroy record" do
                expect{ delete :destroy, id: @profile_3[:id] }.to change{Profile.all.count}.by(-1)
            end 

            it "redirect_to index after destroy" do
                delete :destroy, id: @profile_3[:id]
                expect(response.status).to eql(302)
                expect(response).to redirect_to(profiles_path)
            end
        end
        

        describe "#update" do
            before(:all) do
                @profile_params = {name: 'alan', base_url: 'base_url2', auth_type: 'auth_type3', default_user_name: 'raj', default_password: '5678'}
            end

            it "changes record" do 
                post :update, profile: @profile_params, id: @profile_1[:id]
                expect(Profile.find(@profile_1[:id])[:name]).to eq("alan")
            end

            it "redirect on success" do
                post :update, profile: @profile_params, id: @profile_1[:id]
                expect(response).not_to have_http_status(200)
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(profiles_path)
            end
    
            it "render :edit on fail" do
                allow_any_instance_of(Profile).to receive(:save).and_return(false)
                post :update, profile: @profile_params, id: @profile_1[:id]
                expect(response).not_to have_http_status(302)
                expect(response).to render_template(:edit)
            end

        end   
        
        
end
