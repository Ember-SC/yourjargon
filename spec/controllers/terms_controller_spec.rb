# require 'spec_helper'

# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to specify the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator.  If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails.  There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.
# #
# # Compared to earlier versions of this generator, there is very limited use of
# # stubs and message expectations in this spec.  Stubs are only used when there
# # is no simpler way to get a handle on the object needed for the example.
# # Message expectations are only used when there is no simpler way to specify
# # that an instance is receiving a specific message.

# describe Api::TermsController do

#   # This should return the minimal set of attributes required to create a valid
#   # Term. As you add validations to Term, be sure to
#   # update the return value of this method accordingly.
#   def valid_attributes
#     {}
#   end
  
#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # TermsController. Be sure to keep this updated too.
#   def valid_session
#     {}
#   end

#   describe "GET index" do
#     it "assigns all terms as @terms" do
#       term = Term.create! valid_attributes
#       get :index, {}, valid_session
#       assigns(:terms).should eq([term])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested term as @term" do
#       term = Term.create! valid_attributes
#       get :show, {:id => term.to_param}, valid_session
#       assigns(:term).should eq(term)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new Term" do
#         expect {
#           post :create, {:term => valid_attributes}, valid_session
#         }.to change(Term, :count).by(1)
#       end

#       it "assigns a newly created term as @term" do
#         post :create, {:term => valid_attributes}, valid_session
#         assigns(:term).should be_a(Term)
#         assigns(:term).should be_persisted
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved term as @term" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Term.any_instance.stub(:save).and_return(false)
#         post :create, {:term => {}}, valid_session
#         assigns(:term).should be_a_new(Term)
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested term" do
#         term = Term.create! valid_attributes
#         # Assuming there are no other terms in the database, this
#         # specifies that the Term created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         Term.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, {:id => term.to_param, :term => {'these' => 'params'}}, valid_session
#       end

#       it "assigns the requested term as @term" do
#         term = Term.create! valid_attributes
#         put :update, {:id => term.to_param, :term => valid_attributes}, valid_session
#         assigns(:term).should eq(term)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the term as @term" do
#         term = Term.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Term.any_instance.stub(:save).and_return(false)
#         put :update, {:id => term.to_param, :term => {}}, valid_session
#         assigns(:term).should eq(term)
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested term" do
#       term = Term.create! valid_attributes
#       expect {
#         delete :destroy, {:id => term.to_param}, valid_session
#       }.to change(Term, :count).by(-1)
#     end

#     it "redirects to the terms list" do
#       term = Term.create! valid_attributes
#       delete :destroy, {:id => term.to_param}, valid_session
#       response.should redirect_to(terms_url)
#     end
#   end

# end
