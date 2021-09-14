import Combine
import OneKit
import SwiftUI

struct RootView: View {
    @EnvironmentObject var state: AppState

    @ViewBuilder
    var flightView: some View {
        switch state.flight {
        case let .success(flight): FlightView(flight: FlightViewModel(flight))
        case .failure: FlightView(flight: FlightViewModel(United.Sample))
        case .none: ProgressView()
        }
    }

    var body: some View {
        flightView
            .animation(.easeIn)
            .frame(width: 525, height: 375, alignment: .center)
    }
}
