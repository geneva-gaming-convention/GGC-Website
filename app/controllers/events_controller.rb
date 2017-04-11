class EventsController < ApplicationController
  before_action :must_be_logged
  before_action :must_be_ready_to_registration, only: [:show]

  def index
    @events = Event.all.where(visible: true)
  end

  def new
    @event = Event.new
  end

  def create

  end

  def show
    @event = Event.find_by(id: params["id"])
    if !@event
      render_404
    else
      @games = @event.get_all_played_games
    end
  end

  def edit

  end

  def update

  end

  def events_params
    params.require(:event).permit(:name, :shortname)
  end
end
