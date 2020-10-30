require_relative './doctor.rb'
require_relative './appointment.rb'

class Patient

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select {|appointments| appointments.patient == self}
    end

    def doctors
        appointments.map(&:doctor)
    end

end