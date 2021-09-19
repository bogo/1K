import Foundation

public extension United {
    struct FlightDetails: Codable {
        public let actualDepartureTime: String
        public let actualDepartureTimeLocal: String
        public let airSpeedKPH: String
        public let airSpeedMPH: String
        public let airTemperatureC: String
        public let airTemperatureF: String
        public let aircraftModel: String
        public let altitudeFt: String
        public let altitudeMeters: String
        public let arrivalConcourse: String
        public let arrivalGate: String
        public let arrivalTerminal: String
        public let departureConcourse: String
        public let departureGate: String
        public let departureTerminal: String
        public let destinationAirportCode: String
        public let destinationCity: String
        public let destinationState: String
        public let equipmentCode: String
        public let estimatedArrivalTime: String
        public let estimatedArrivalTimeLocal: String
        public let estimatedDepartureTimeLocal: String
        public let flightDurationMinutes: Int
        public let flightMapPath: String
        public let flightNumber: String
        public let flightStatus: String
        public let groundSpeedKPH: String
        public let groundSpeedMPH: String
        public let isFake: Bool
        public let noseNumber: String
        public let originAirportCode: String
        public let originCity: String
        public let originState: String
        public let scheduledArrivalTime: String
        public let scheduledArrivalTimeLocal: String
        public let scheduledDepartureTime: String
        public let scheduledDepartureTimeLocal: String
        public let tailNumber: String?
        public let timeRemainingToDestination: Int
        public let windDirection: String
    }
}
