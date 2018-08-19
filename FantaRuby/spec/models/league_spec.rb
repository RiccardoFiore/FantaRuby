require "rails_helper"

describe League, :type => :model do

    it "Create League" do
        league=League.new(:name => "legas", :players => 2, :description => "Descrizione", :status => "Aperta", :president_id => 1)
        expect(league).to be_valid
    end


    it "is not valid without a name" do
        league=League.new(:name => nil)
        expect(league).to_not be_valid
    end

    it "is not valid without a players" do
        league=League.new(:name => "lega", :players => nil)
        expect(league).to_not be_valid
    end

    it "is not valid without a description" do
        league=League.new(:name => "lega", :players => 2, :description => nil)
        expect(league).to_not be_valid
    end
    it "is not valid without a status" do
        league=League.new(:name => "lega", :players => 2, :description => "descrizione", :status => nil)
        expect(league).to_not be_valid
    end

end
