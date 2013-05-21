class Api::OrganizationsController < ApplicationController
  respond_to :json

  def index
    if ids = params[:ids]
      @organizations = Organization.where(:id => ids)
    elsif params[:search]
      @organizations = Organization.where("name like ?", "%#{params[:search]}%")
    else
      @organizations = Organization.all
    end

    render json: @organizations
  end

  # GET api/organizations/1
  def show
    @organization = Organization.find(params[:id])

    render json: @organization
  end

  # POST api/organizations
  def create
    @organization = Organization.new(params[:organization])

    if @organization.save
      render json: @organization, status: :created
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PUT api/organizations/1
  def update
    @organization = Organization.find(params[:id])

    if @organization.update_attributes(params[:organization])
      render json: @orgnanization
    else
      render json: @organization.errors, status: :unprocessable_entity 
    end
  end

  # DELETE api/organizations/1
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    render json: @organization, status: :no_content
  end

end