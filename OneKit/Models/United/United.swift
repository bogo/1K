import Foundation

public struct United: Codable {
    public let flifo: FlightDetails
    public let host: String
}

public extension United {
    var flightMap: URL { URL(string: host + flifo.flightMapPath)! }
    var flightTimeRemaining: String { TimeInterval(flifo.timeRemainingToDestination * 60).asString() }
}

extension United {
    static let Endpoint = URL(string: "https://www.unitedwifi.com/portal/r/getAllSessionData")!
}

public extension United {
    static var Sample: United {
        let bundle = Bundle(for: Dummy.self)
        let url = bundle.url(forResource: "united-sample", withExtension: "json")!
        return try! JSONDecoder().decode(United.self, from: try! Data(contentsOf: url))
    }
}
