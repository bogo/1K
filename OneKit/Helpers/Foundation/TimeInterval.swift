import Foundation

extension TimeInterval {
    private static let formatter = with(DateComponentsFormatter()) {
        $0.allowedUnits = [.hour, .minute]
        $0.unitsStyle = .positional
        $0.zeroFormattingBehavior = .dropLeading
    }

    /// - Returns: a representation of the time interval as hh:mm:ss
    func asString() -> String {
        guard let formattedString = TimeInterval.formatter.string(from: self) else { return "-:--" }
        return formattedString
    }
}
