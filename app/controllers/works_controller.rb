class WorksController < ApplicationController

  def index
   @works = Work.all
  end

  def show
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "#{@work.title.capitalize} was successfully added!"
      redirect_to work_path(@work.id)
      return
    else
      flash.now[:error] = "#{@work.title.capitalize} was NOT successfully added!"
      render :edit, status: :bad_request
      return
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
  end

  def update
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return
    elsif @work.update(work_params)
      flash[:success] = "#{@work.title.capitalize} was successfully updated!"
      redirect_to works_path 
      return
    else 
      flash.now[:error] = "#{@work.title.capitalize} was NOT successfully updated!"
      render :edit, status: :bad_request 
      return
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
    @work.destroy
    redirect_to works_path
    return
  end

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
