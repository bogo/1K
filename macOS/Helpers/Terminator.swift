import Foundation
import AppKit

class Terminator {
    @objc static func quitApp() {
        NSApp.terminate(nil)
    }
}
