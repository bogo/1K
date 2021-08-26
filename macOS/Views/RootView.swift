import Combine
import OneKit
import SwiftUI

struct RootView: View {
    var flight: Result<United, Error>?

    @ViewBuilder
    var flightView: some View {
        switch flight {
        case let .success(flight): FlightView(flight: flight)
        case .failure: FlightView(flight: .Sample)
        case .none: ProgressView()
        }
    }

    var body: some View {
        flightView
            .animation(.easeIn)
            .frame(width: 525, height: 375, alignment: .center)
    }
}
