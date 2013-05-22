class Api::MembershipsController < ApplicationController
  respond_to :json

  def index
    if ids = params[:ids]
      @memberships = Membership.where(:id => ids)
    else
      @memberships = Membership.all
    end

    render json: @memberships
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @membership = Membership.find(params[:id])
    render json: @membership
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(params[:membership])
    if @membership.save
      render json: @membership, status: :created
    else
      render json: @membership.errors, status: :unprocessable_entity
    end
  end

  # PUT /memberships/1
  # PUT /memberships/1.json
  def update
    @membership = Membership.find(params[:id])

    if @membership.update_attributes(params[:membership])
      render json: @membership
    else
      render json: @membership.errors, status: :unprocessable_entity
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    render json: head , status: :no_content
  end

end