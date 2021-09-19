import Foundation

public struct Lufthansa: Codable {
    let decompression: Bool
    let weightOnWheels: Bool
    let allDoorClosed: Bool
    let paState: Bool
    let groundSpeed: Int
    let timeToDestination: Int
    let windSpeed: Int
    let mach: Int
    let trueHeading: Int
    let gmt: Int
    let outsideAirTemp: Int
    let headWindSpeed: Int
    let date: Int
    let distanceToDestination: Int
    let altitude: Int
    let presentPositionLatitude: Int
    let presentPositionLongitude: Int
    let destinationLatitude: Int
    let destinationLongitude: Int
    let destinationId: String
    let departureId: String
    let flightNumber: String
    let destinationBaggadeId: String
    let departureBaggageId: String
    let airframeTailNumber: String
    let flightPhase: Int
    let gmtOffsetDeparture: Float
    let gmtOffsetDestination: Float
    let routeId: Int
    let timeAtOrigin: Int
    let timeAtDestination: String
    let distanceFromOrigin: Int
    let distanceTraveled: Int
    let estimatedArrivalTime: Int
    let timeAtTakeOff: Int
    let departureLatitude: Int
    let departureLongitude: Int
    let departureIATA: String
    let departureTimeScheduled: Int
    let arrivalIATA: String
    let windDirection: Int
    let mediaDate: Int
    let listingVersion: Int
    let disclaimer: String

    enum CodingKeys: String, CodingKey {
        case decompression = "td_id_decompression"
        case weightOnWheels = "td_id_weight_on_wheels"
        case allDoorClosed = "td_id_all_doors_closed"
        case paState = "td_id_x2_pa_state"
        case groundSpeed = "td_id_fltdata_ground_speed"
        case timeToDestination = "td_id_fltdata_time_to_destination"
        case windSpeed = "td_id_fltdata_wind_speed"
        case mach = "td_id_fltdata_mach"
        case trueHeading = "td_id_fltdata_true_heading"
        case gmt = "td_id_fltdata_gmt"
        case outsideAirTemp = "td_id_fltdata_outside_air_temp"
        case headWindSpeed = "td_id_fltdata_head_wind_speed"
        case date = "td_id_fltdata_date"
        case distanceToDestination = "td_id_fltdata_distance_to_destination"
        case altitude = "td_id_fltdata_altitude"
        case presentPositionLatitude = "td_id_fltdata_present_position_latitude"
        case presentPositionLongitude = "td_id_fltdata_present_position_longitude"
        case destinationLatitude = "td_id_fltdata_destination_latitude"
        case destinationLongitude = "td_id_fltdata_destination_longitude"
        case destinationId = "td_id_fltdata_destination_id"
        case departureId = "td_id_fltdata_departure_id"
        case flightNumber = "td_id_fltdata_flight_number"
        case destinationBaggadeId = "td_id_fltdata_destination_baggage_id"
        case departureBaggageId = "td_id_fltdata_departure_baggage_id"
        case airframeTailNumber = "td_id_airframe_tail_number"
        case flightPhase = "td_id_flight_phase"
        case gmtOffsetDeparture = "td_id_gmt_offset_departure"
        case gmtOffsetDestination = "td_id_gmt_offset_destination"
        case routeId = "td_id_route_id"
        case timeAtOrigin = "td_id_fltdata_time_at_origin"
        case timeAtDestination = "td_id_fltdata_time_at_destination"
        case distanceFromOrigin = "td_id_fltdata_distance_from_origin"
        case distanceTraveled = "td_id_fltdata_distance_traveled"
        case estimatedArrivalTime = "td_id_fltdata_estimated_arrival_time"
        case timeAtTakeOff = "td_id_fltdata_time_at_takeoff"
        case departureLatitude = "td_id_fltdata_departure_latitude"
        case departureLongitude = "td_id_fltdata_departure_longitude"
        case departureIATA = "td_id_pdi_fltdata_departure_iata"
        case departureTimeScheduled = "td_id_pdi_fltdata_departure_time_scheduled"
        case arrivalIATA = "td_id_pdi_fltdata_arrival_iata"
        case windDirection = "td_id_fltdata_wind_direction"
        case mediaDate = "td_id_media_date"
        case listingVersion = "td_id_extv_channel_listing_version"
        case disclaimer = "disclaimer"
    }
}

extension Lufthansa: Endpoint {
    static let Endpoint = URL(string: "http://services.inflightpanasonic.aero/inflight/services/flightdata/v1/flightdata")!
}
