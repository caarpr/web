class WelcomeController < ApplicationController
  def index
    @wards = TableLocation.pluck("distinct ward")

    @postcards_by_ward = {}
    @wards.each do |ward|
      @postcards_by_ward[ward] = [0, TableEvent.for_ward(ward).during(Time.now.all_month).sum(:postcards_collected)]
    end

    @new_volunteers_by_ward = {}
    @wards.each do |ward|
      @new_volunteers_by_ward[ward] = [0, TableEvent.for_ward(ward).during(Time.now.all_month).sum(:volunteers_collected)]
    end
  end
end

