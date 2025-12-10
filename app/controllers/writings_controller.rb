class WritingsController < ApplicationController
  before_action :set_writing, only: %i[ show edit update destroy preview ]

  def welcome
    @writings = Writing.all.limit(5)
  end

  def index
    @writings = current_user.writings
  end

  def show
  end

  def preview
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
        format.html { redirect_to preview_writing_url(@writing), notice: "Writing was successfully created." }
        format.json { render :show, status: :created, location: @writing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @writing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @writing.update(writing_params)
        format.html { redirect_to preview_writing_url(@writing), notice: "Writing was successfully updated.", status: :see_other }
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

  private
    def set_writing
      @writing = Writing.find(params.expect(:id))
    end

    def writing_params
      params.expect(writing: [ :title, :content, :cover, :user_id ])
    end
end
