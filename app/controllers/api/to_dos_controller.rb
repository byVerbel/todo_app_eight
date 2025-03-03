class Api::ToDosController < ApplicationController
  before_action :set_to_do, only: %i[ show update update_completed destroy ]

  # GET /to_dos
  def index
    @to_dos = ToDo.order(created_at: :desc)

    render json: @to_dos
  end

  # GET /to_dos/1
  def show
    render json: @to_do
  end

  # POST /to_dos
  def create
    @to_do = ToDo.new(to_do_params)

    if @to_do.save
      render json: @to_do, status: :created
    else
      render json: @to_do.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /to_dos/1
  def update
    if @to_do.update(to_do_params)
      render json: @to_do
    else
      render json: @to_do.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /to_dos/1
  def update_completed
    if @to_do.update(completed: params[:completed])
      render json: @to_do
    else
      render json: @to_do.errors, status: :unprocessable_entity
    end
  end

  # DELETE /to_dos/1
  def destroy
    @to_do.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do
      @to_do = ToDo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def to_do_params
      params.expect(to_do: [ :name, :completed ])
    end
end
