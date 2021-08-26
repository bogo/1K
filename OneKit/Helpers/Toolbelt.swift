import Foundation

public func with<T>(_ object: T, _ configure: (inout T) -> Void) -> T {
    var object = object
    configure(&object)
    return object
}
