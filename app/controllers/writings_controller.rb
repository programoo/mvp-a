class WritingsController < ApplicationController
  before_action :set_writing, only: %i[ show edit update destroy writerview readerview ]
  before_action :authorized_writer, only: %i[ edit update destroy writerview]

  def welcome
    @writings = Writing.all.limit(5)
  end

  def index
    @writings = current_user.writings
  end

  def show
  end

  def writerview
  end

  def readerview
  end

  def new
    @writing = Writing.new
  end

  def edit
  end

  def create
    @writing = Writing.new(writing_params)

    respond_to do |format|
      if @writing.save
        format.html { redirect_to writerview_writing_url(@writing), notice: "Writing was successfully created." }
        format.json { render :show, status: :created, location: @writing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @writing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
      binding.pry
      respond_to do |format|
         if @writing.update(writing_params)
           format.html { redirect_to writerview_writing_url(@writing), notice: "Writing was successfully updated.", status: :see_other }
           format.json { render :show, status: :ok, location: @writing }
         else
           format.html { render :edit, status: :unprocessable_entity }
           format.json { render json: @writing.errors, status: :unprocessable_entity }
         end
       end
  end

  def destroy
    @writing.destroy!

    respond_to do |format|
            format.html { redirect_to writings_path, notice: "Writing was successfully destroyed.", status: :see_other }
            format.json { head :no_content }
    end
  end

  def authorized_writer
    begin
      @writing = current_user.writings.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to writings_path, alert: "You are not authorized to access this writing."
    end
  end

  private
    def set_writing
      @writing = Writing.find(params.expect(:id))
    end

    def writing_params
      params.expect(writing: [ :title, :content, :cover, :user_id, :statue ])
    end
end
