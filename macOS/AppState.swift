import Foundation
import OneKit

class AppState: ObservableObject {
    @Published var flight: FlightResult?

    init() {
        fetchFlightInformation(every: 15.0)
            .map { Optional($0) }
            .subscribe(on: RunLoop.main)
            .print()
            .assign(to: &$flight)
    }
}
