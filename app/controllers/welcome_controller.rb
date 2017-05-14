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

    @volunteers_by_ward = {}
    @volunteers_by_ward['48'] = TableEvent.for_ward(48).during(Time.now.all_month).flat_map(&:attendees).flat_map(&:volunteer_id).uniq.length
    @volunteers_by_ward['49'] = TableEvent.for_ward(49).during(Time.now.all_month).flat_map(&:attendees).flat_map(&:volunteer_id).uniq.length
  end
end

