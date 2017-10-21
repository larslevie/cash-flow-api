class HealthChecksController < ApplicationController
  def show
    db_healthy? ? head(:ok) : head(:internal_server_error)
  end

  private

  def db_healthy?
    ActiveRecord::Base.connection.select_value("select 1") == 1
  end
end
