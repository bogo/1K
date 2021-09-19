import Foundation

public protocol Endpoint: Codable {
    static var Endpoint: URL { get }
}
