require_relative './appointment.rb'
require_relative './patient.rb'

class Doctor

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        Appointment.new(patient, date, self)
    end

    def appointments 
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def patients
        appointments.map(&:patient)
    end
end