class Api::OrganizationsController < ApplicationController
  respond_to :json
  before_filter :authorize, :only => [:create, :update]

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
    if @organization = current_user.create_organization(params[:organization][:name])
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

  private

  def authorize
    # We should actually check that the user has permission on the resource also
    if !current_user
      render status: 401
    end
  end

end