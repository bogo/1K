import SwiftUI
import OneKit

struct ContentView: View {
    @State var flight: FlightResult?

    @ViewBuilder
    var flightView: some View {
        switch flight {
        case let .success(flight): Text("\(flight.flightTimeRemaining)")
        case .failure: Text("Fail!")
        case .none: Text("-:--")
        }
    }

    var body: some View {
        VStack {
            flightView
        }
        .onReceive(fetchFlightInformation(every: 10.0)) { flight = $0 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
