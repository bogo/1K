import Combine
import OneKit
import SwiftUI

struct RootView: View {
    @EnvironmentObject var state: AppState

    @ViewBuilder
    var flightView: some View {
        switch state.flight {
        case let .success(flight): FlightView(flight: flight)
        case .failure: FlightView(flight: .Sample)
        case .none: ProgressView()
        }
    }

    var body: some View {
        flightView
            .frame(width: 525, height: 375, alignment: .center)
    }
}
