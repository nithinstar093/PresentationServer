#Controller for Profiles

class ProfilesController < ApplicationController

    def index
        @profiles = Profile.all
    end

    def new
        @profile = Profile.new
    end

    def show
        @profile = Profile.find(params[:id])
    end
    
    def create
        @profile = Profile.new(profile_params)
        
        if @profile.save
            redirect_to  profiles_path
        else
            render "new"
        end
    end

    def edit
        @profile = Profile.find(params[:id])
    end

    
    def update
       @profile = Profile.find(params[:id])
       
       if @profile.update_attributes(params.require(:profile).permit(:name, :base_url, :auth_type, :default_user_name, :default_password))
            redirect_to profiles_path
       else
            render "edit"
       end

    end
    
    def destroy
        @profile = Profile.find(params[:id])
        @profile.destroy
        redirect_to profiles_path
      end

    private

    def profile_params
        params.require(:profile).permit(:name, :base_url, :auth_type, :default_user_name, :default_password)
    end
    

end
