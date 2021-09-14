import Combine
import Foundation

public typealias FlightResult = Result<Lufthansa, Error>

func fetchFlightInformation<T: Codable>() -> AnyPublisher<T, Error> {
    URLSession.shared.dataTaskPublisher(for: United.Endpoint)
        .map(\.data)
        .decode(type: T.self, decoder: JSONDecoder())
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
