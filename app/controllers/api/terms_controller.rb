class Api::TermsController < ApplicationController
  respond_to :json

  def index
    if ids = params[:ids]
      @terms = Term.where(:id => ids)
    elsif params[:search]
      @terms = Term.where("name like ?", "%#{params[:search]}%")
    else
      @terms = Term.all
    end

    render json: @terms
  end

  # GET api/terms/1
  def show
    @term = Term.find(params[:id])

    render json: @term
  end

  # POST api/terms
  def create
    @term = Term.new(params[:term])

    if @term.save
      render json: @term, status: :created
    else
      render json: @term.errors, status: :unprocessable_entity
    end
  end

  # PUT api/terms/1
  def update
    @term = Term.find(params[:id])

    if @term.update_attributes(params[:term])
      render json: @term
    else
      render json: @term.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/terms/1
  def destroy
    @term = Term.find(params[:id])
    @term.destroy
    render json: head, status: :no_content
  end

end
