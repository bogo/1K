import OneKit
import SwiftUI

struct FlightView: View {
    var flight: United = .Sample

    var body: some View {
        VStack(spacing: 15.0) {
            HStack {
                VStack(alignment: .leading, spacing: 3.0) {
                    Text("\(flight.flifo.originCity) to \(flight.flifo.destinationCity)")
                        .font(.title2)
                        .lineLimit(2)
                    Text("\(flight.flifo.flightStatus)")
                        .font(.headline)
                }

                Spacer()

                VStack {
                    Text("\(flight.flightTimeRemaining)")
                        .font(.title)
                    Text("left")
                        .font(.headline)
                }
            }

            RouteView(
                origin: flight.flifo.originAirportCode,
                destination: flight.flifo.destinationAirportCode,
                flightTimeLeft: flight.flifo.timeRemainingToDestination,
                flightTimeTotal: flight.flifo.flightDurationMinutes
            )

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Scheduled")
                        .bold()
                    Text(flight.flifo.scheduledDepartureTime)
                    Text("Actual")
                        .bold()
                    Text(flight.flifo.actualDepartureTime)
                    Text("Gate")
                        .bold()
                    Text(flight.flifo.departureGate)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("Scheduled")
                        .bold()
                    Text(flight.flifo.scheduledArrivalTime)
                    Text("Estimated")
                        .bold()
                    Text(flight.flifo.estimatedArrivalTime)
                    Text("Gate")
                        .bold()
                    Text(flight.flifo.arrivalGate)
                }
            }

            HStack {
                Text(flight.flifo.aircraftModel)
                Text("•")
                Text("UA " + flight.flifo.flightNumber)
                Text("•")
                Text("#" + flight.flifo.noseNumber)
            }

            HStack(alignment: .top, spacing: 20.0) {
                VStack {
                    Text("Wind speed")
                        .bold()
                    Text(flight.flifo.airSpeedMPH + " mph")
                    Text(flight.flifo.airSpeedKPH + " kmh")

                    Text(flight.flifo.windDirection)
                }
                Spacer()
                VStack {
                    Text("Ground speed")
                        .bold()

                    Text(flight.flifo.groundSpeedMPH + " mph")
                    Text(flight.flifo.groundSpeedKPH + " kmh")
                }
                Spacer()
                VStack {
                    Text("Outside temp")
                        .bold()

                    Text(flight.flifo.airTemperatureF + " ℉")
                    Text(flight.flifo.airTemperatureC + " ℃")
                }
                Spacer()
                VStack {
                    Text("Altitude")
                        .bold()

                    Text(flight.flifo.altitudeFt + " ft")
                    Text(flight.flifo.altitudeMeters + " m")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView(flight: .Sample)
            .previewLayout(.fixed(width: 525, height: 375))
    }
}
