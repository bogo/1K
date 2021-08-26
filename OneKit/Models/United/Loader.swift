import Combine
import Foundation

public typealias FlightResult = Result<United, Error>

func fetchFlightInformation() -> AnyPublisher<United, Error> {
    URLSession.shared.dataTaskPublisher(for: United.Endpoint)
        .map(\.data)
        .decode(type: United.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}

public func fetchFlightInformation(every seconds: TimeInterval) -> AnyPublisher<FlightResult, Never> {
    Timer.publish(every: seconds, on: .main, in: .default)
        .autoconnect()
        .prepend(Date())
        .flatMap { _ in fetchFlightInformation() }
        .asResult()
        .eraseToAnyPublisher()
}
