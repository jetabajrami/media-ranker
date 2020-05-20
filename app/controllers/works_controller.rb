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
    @work.delete
    redirect_to works_path
    return
  end

  def upvote
    @work = Work.find_by(id: params[:id]) #First i find the work that we are voting fore
    if @work.nil? #if this vote is nil the work doesn't exist
      head :not_found
      return
    else #If this work exist
      @user = User.find_by(id: session[:user_id]) # i want to fine the user id that is currently Loged in
      if @user.nil? #if that user is not loged in will show the flash you have to log in first so to be able to vote
        flash[:notice] = "You have to log in first!"
        redirect_back(fallback_location: root_path) #will redirect to current path
        return
      end 
      #but if the user is alredy loged in
      @vote = Vote.find_by(user_id: @user.id, work_id: @work.id) #finding the vote
      if @vote.nil? #if that vote dident exist i will create a new vote
        vote_params = {
          work_id: @work.id,
          user_id: @user.id,
        }
        @vote = Vote.create(vote_params)
        #after the vote is created i will show this flash, that you vote succesfuly for work name
        flash[:success] = "You voted succesfuly for #{@work.title}"
        redirect_back(fallback_location: root_path) #redirect to same path
       return
      else #if the user is trying to vote fore same work will show the flash that you voteed alerdy for this work.
        flash[:notice] = "You alredy voted once!!!"
        redirect_back(fallback_location: root_path)
        return
      end
    end
  end

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end


