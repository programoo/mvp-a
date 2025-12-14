class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i[show edit update destroy]
  before_action :set_writing, except: %i[sort]

  def index
    @chapters = Chapter.all
  end

  # chapters_controller.rb
  def show
    @previous_chapter = @chapter.writing.chapters
                                .where("position < ?", @chapter.position)
                                .order(position: :desc)
                                .first

    @next_chapter = @chapter.writing.chapters
                            .where("position > ?", @chapter.position)
                            .order(position: :asc)
                            .first
  end

  def new
    @chapter = Chapter.new(writing_id: params[:writing_id])
  end

  def edit
  end

  def sort
    params[:order].each_with_index do |id, index|
      Chapter.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  def create
    @chapter = Chapter.new(chapter_params)

    if @chapter.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to writerview_writing_url(@chapter.writing) }
      end
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html do
          redirect_to writerview_writing_url(@chapter.writing), notice: "Chapter was successfully updated.",
                                                                status: :see_other
        end
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1 or /chapters/1.json
  def destroy
    @chapter.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to chapters_path, notice: "Chapter was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_writing
    @writing = Writing.find(params[:writing_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_chapter
    @chapter = Chapter.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def chapter_params
    params.expect(chapter: %i[title description content writing_id])
  end
end
