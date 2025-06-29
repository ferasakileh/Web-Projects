class PresentationsController < ApplicationController
  include SessionsHelper
  # added these to check student vs instructor
  before_action :require_login
  #before_action :require_instructor, only: [:new, :create, :edit, :update, :destroy]

  def index
    @presentations= Presentation.all
  end

  def show
    @presentation=Presentation.find_by_id(params['id'])

    #debugger
    if @presentation.nil?
      flash[:alert] = 'Presentation not found.'
      redirect_to presentation_path
    end
  end

  def new
    @presentation= Presentation.new
  end

  def create
    #@presentation=Presentation.new(presentation_params)
    @presentation = current_user.presentations.new(presentation_params) 

    if @presentation.save
      flash[:success]= 'Success!'
      redirect_to presentation_path(@presentation), notice: 'Presentation was successfully created.'
    else
      flash[:error] = "Error saving presentation: #{@presentation.errors.full_messages.join(', ')}"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @presentation=Presentation.find(params[:id])
  end

  def update
    @presentation=Presentation.find(params[:id])

    if @presentation.update(presentation_params)
      redirect_to @presentation, notice: 'Presentation was successfully updated'
    else
      render 'edit', status: :unprocessable_entity
    end

  end

  def destroy
    @presentation=Presentation.find(params[:id])   #find prez by ID
    @presentation.destroy     #delete prez
    #redirect to presentations lsit with a success message
    redirect_to presentations_path, notice: 'Presentation was successfully deleted'
  end
  private 

  # def set_event
  #   @event= Event.find(params[:event_id]) # look for event
  # end
  # 
  # def set_event
  #   @event = Event.find(params[:event_id])  # This line uses params[:event_id] to find the event
  # rescue ActiveRecord::RecordNotFound
  #   flash[:alert] = "Event not found."
  #   redirect_to events_path
  # end

  def presentation_params
    params.require(:presentation).permit(:title, :date, :description, :presenter_name, :file, :event_id)
  end

  # Ensure the user is logged in
  def require_login
    unless logged_in?
      flash[:alert] = "You must log in to access this section."
      redirect_to login_url
    end
  end

  # Ensure the user is an logged in & instructor
  # def require_instructor
  #   unless instructor_user?
  #     flash[:alert] = "You need to be an instructor"
  #     redirect_to presentations_path
  #   end
  # end


  def evaluations
    @presentation = Presentation.find(params[:id])
    
    # Get evaluations for this presentation
    if @presentation
      evaluations = @presentation.evaluations.includes(:user).map do |evaluation|
        {
          user: evaluation.user.name,  # assuming user has a 'name' attribute
          comments: evaluation.comments,
          score: evaluation.rating
        }
      end
      render json: evaluations
    else
      render json: [], status: :not_found
    end
  end


end