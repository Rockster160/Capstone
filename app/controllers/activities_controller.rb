class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order('created_at_desc')
  end
end
