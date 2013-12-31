require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AliasPlaceChurchesController do

  # This should return the minimal set of attributes required to create a valid
  # AliasPlaceChurch. As you add validations to AliasPlaceChurch, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AliasPlaceChurchesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all alias_place_churches as @alias_place_churches" do
      alias_place_church = AliasPlaceChurch.create! valid_attributes
      get :index, {}, valid_session
      assigns(:alias_place_churches).should eq([alias_place_church])
    end
  end

  describe "GET show" do
    it "assigns the requested alias_place_church as @alias_place_church" do
      alias_place_church = AliasPlaceChurch.create! valid_attributes
      get :show, {:id => alias_place_church.to_param}, valid_session
      assigns(:alias_place_church).should eq(alias_place_church)
    end
  end

  describe "GET new" do
    it "assigns a new alias_place_church as @alias_place_church" do
      get :new, {}, valid_session
      assigns(:alias_place_church).should be_a_new(AliasPlaceChurch)
    end
  end

  describe "GET edit" do
    it "assigns the requested alias_place_church as @alias_place_church" do
      alias_place_church = AliasPlaceChurch.create! valid_attributes
      get :edit, {:id => alias_place_church.to_param}, valid_session
      assigns(:alias_place_church).should eq(alias_place_church)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AliasPlaceChurch" do
        expect {
          post :create, {:alias_place_church => valid_attributes}, valid_session
        }.to change(AliasPlaceChurch, :count).by(1)
      end

      it "assigns a newly created alias_place_church as @alias_place_church" do
        post :create, {:alias_place_church => valid_attributes}, valid_session
        assigns(:alias_place_church).should be_a(AliasPlaceChurch)
        assigns(:alias_place_church).should be_persisted
      end

      it "redirects to the created alias_place_church" do
        post :create, {:alias_place_church => valid_attributes}, valid_session
        response.should redirect_to(AliasPlaceChurch.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved alias_place_church as @alias_place_church" do
        # Trigger the behavior that occurs when invalid params are submitted
        AliasPlaceChurch.any_instance.stub(:save).and_return(false)
        post :create, {:alias_place_church => {  }}, valid_session
        assigns(:alias_place_church).should be_a_new(AliasPlaceChurch)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AliasPlaceChurch.any_instance.stub(:save).and_return(false)
        post :create, {:alias_place_church => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested alias_place_church" do
        alias_place_church = AliasPlaceChurch.create! valid_attributes
        # Assuming there are no other alias_place_churches in the database, this
        # specifies that the AliasPlaceChurch created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AliasPlaceChurch.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => alias_place_church.to_param, :alias_place_church => { "these" => "params" }}, valid_session
      end

      it "assigns the requested alias_place_church as @alias_place_church" do
        alias_place_church = AliasPlaceChurch.create! valid_attributes
        put :update, {:id => alias_place_church.to_param, :alias_place_church => valid_attributes}, valid_session
        assigns(:alias_place_church).should eq(alias_place_church)
      end

      it "redirects to the alias_place_church" do
        alias_place_church = AliasPlaceChurch.create! valid_attributes
        put :update, {:id => alias_place_church.to_param, :alias_place_church => valid_attributes}, valid_session
        response.should redirect_to(alias_place_church)
      end
    end

    describe "with invalid params" do
      it "assigns the alias_place_church as @alias_place_church" do
        alias_place_church = AliasPlaceChurch.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AliasPlaceChurch.any_instance.stub(:save).and_return(false)
        put :update, {:id => alias_place_church.to_param, :alias_place_church => {  }}, valid_session
        assigns(:alias_place_church).should eq(alias_place_church)
      end

      it "re-renders the 'edit' template" do
        alias_place_church = AliasPlaceChurch.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AliasPlaceChurch.any_instance.stub(:save).and_return(false)
        put :update, {:id => alias_place_church.to_param, :alias_place_church => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested alias_place_church" do
      alias_place_church = AliasPlaceChurch.create! valid_attributes
      expect {
        delete :destroy, {:id => alias_place_church.to_param}, valid_session
      }.to change(AliasPlaceChurch, :count).by(-1)
    end

    it "redirects to the alias_place_churches list" do
      alias_place_church = AliasPlaceChurch.create! valid_attributes
      delete :destroy, {:id => alias_place_church.to_param}, valid_session
      response.should redirect_to(alias_place_churches_url)
    end
  end

end
