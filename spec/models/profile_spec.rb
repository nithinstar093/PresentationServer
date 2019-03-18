require 'rails_helper'

RSpec.describe Profile, type: :model do
 
  before(:each) do
    @profile = Profile.create!(name: 'name',base_url: 'base_url',auth_type: 'auth_type',default_user_name: 'default_user_name',default_password: 'default_password')
  end

  
  describe "validations" do

    it "should not let a profile be created without name" do
      profile=Profile.create(base_url: 'base_url',auth_type: 'auth_type',default_user_name: 'default_user_name',default_password: 'default_password').save
      expect(profile).to eq(false)
    end

    it "should let a profile be created with name" do
      profile=Profile.create(name: 'name',base_url: 'base_url',auth_type: 'auth_type',default_user_name: 'default_user_name',default_password: 'default_password').save
      expect(profile).to eq(true)
    end
    

    it "should not let a profile be created without base_url" do
      profile=Profile.create(name: 'name',auth_type: 'auth_type',default_user_name: 'default_user_name',default_password: 'default_password').save
      expect(profile).to eq(false)
    end

    it "should let a profile be created with base_url" do
      profile=Profile.create(name: 'name',base_url: 'base_url',auth_type: 'auth_type',default_user_name: 'default_user_name',default_password: 'default_password').save
      expect(profile).to eq(true)
    end

    it "should not let a profile be created without auth_type" do
      profile=Profile.create(name: 'name',base_url: 'base_url',default_user_name: 'default_user_name',default_password: 'default_password').save
      expect(profile).to eq(false)
    end

    it "should let a profile be created with auth_type" do
      profile=Profile.create(name: 'name',base_url: 'base_url',auth_type: 'auth_type',default_user_name: 'default_user_name',default_password: 'default_password').save
      expect(profile).to eq(true)
    end

    it "should not let a profile be created without default_username" do
      profile=Profile.create(name: 'name',base_url: 'base_url',auth_type: 'auth_type',default_password: 'default_password').save
      expect(profile).to eq(false)
    end

    it "should let a profile be created with default_user_name" do
      profile=Profile.create(name:'name',base_url: 'base_url',auth_type: 'auth_type',default_user_name: 'default_user_name',default_password: 'default_password').save
      expect(profile).to eq(true)
    end

    it "should not let a profile be created without default_password" do
      profile=Profile.create(name: 'name',base_url: 'base_url',auth_type: 'auth_type',default_user_name: 'default_user_name').save
      expect(profile).to eq(false)
    end

    it "should let a profile be created with default_password" do
      profile=Profile.create(name: 'name',base_url: 'base_url',auth_type: 'auth_type',default_user_name: 'default_user_name',default_password: 'default_password').save
      expect(profile).to eq(true)
    end


  end
end
