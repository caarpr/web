class WelcomeController < ApplicationController
  def index
    @wards = TableLocation.pluck("distinct ward")

    t0 = TableEvent.minimum(:starts_at).beginning_of_month

    @labels = []
    loop_until_now(t0) do |t|
      @labels << t.strftime("%B")
    end

    @postcards_by_ward = {}
    @wards.each do |ward|
      @postcards_by_ward[ward] = []
      loop_until_now(t0) do |t|
        @postcards_by_ward[ward] << TableEvent.for_ward(ward).during(t.all_month).sum(:postcards_collected)
      end
    end

    @new_volunteers_by_ward = {}
    @wards.each do |ward|
      @new_volunteers_by_ward[ward] = []
      loop_until_now(t0) do |t|
        @new_volunteers_by_ward[ward] << TableEvent.for_ward(ward).during(t.all_month).sum(:volunteers_collected)
      end
    end

    @table_staff_by_ward = {}
    @wards.each do |ward|
      @table_staff_by_ward[ward] = []
      loop_until_now(t0) do |t|
        @table_staff_by_ward[ward] << TableEvent.for_ward(ward).during(t.all_month).flat_map(&:attendees).flat_map(&:volunteer_id).uniq.length
      end
    end
  end

  def loop_until_now(start_time)
    t = start_time.beginning_of_month
    while t < Time.now
      yield t
      t += 1.month
    end
  end
end

