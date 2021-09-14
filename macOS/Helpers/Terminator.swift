import AppKit
import Foundation

class Terminator {
    @objc static func quitApp() {
        NSApp.terminate(nil)
    }
}
