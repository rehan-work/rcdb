require 'rails_helper'

RSpec.describe OpiatesController do

  before(:all) do
    opiate = Opiate.new
    opiate.primary_name = "Morphine"
    opiate.save
  end

  describe "GET index" do

    it "responds to a basic request" do
      get :index
      expect(response.response_code).to be 200
    end

    it "assigns an array of opiates" do
      get :index
      expect(assigns(:drugs).class).to be Array
    end

  end

  describe "GET show" do

    it "responds to a basic request" do
      get :show, :id => "Morphine"
    end

    it "assigns the drug variable, and the type is an opiate" do
      get :show, :id => "Morphine"
      expect(assigns(:drug).class).to be Opiate
    end

    it "creates an empty report for use in modal form" do
      get :show, :id => "Morphine"
      expect(assigns(:report).class).to be Report
    end

  end

end
