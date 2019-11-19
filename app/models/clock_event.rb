class ClockEvent < ApplicationRecord
    belongs_to :teacher

    scope :current_clock_event, -> {
        where(:clock_out => nil).last
    }
    scope :complete, -> {
        where.not(:clock_out => nil)
    }

    scope :incomplete, -> {
        where(:clock_out => nil)
    }
end
