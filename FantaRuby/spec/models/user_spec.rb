require "rails_helper"

describe User, :type => :model do


    it "Create User" do
        user=User.new(:id => 1,:email => "user@user.it", :password => "ciaociao", :favourite_team => 'Milan', :username => "user")
        expect(user).to be_valid
    end


    it { should validate_uniqueness_of(:username)}


end
