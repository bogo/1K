import AppKit
import Combine
import OneKit
import SwiftUI

@main
struct OneKApp: App {
    @StateObject var state: AppState = .init()
    @State private var statusItem: NSStatusItem?

    func setupStatusBar() {
        let rootView = RootView()
            .environmentObject(state)

        let menu = with(NSMenu()) {
            $0.addItem(with(NSMenuItem()) {
                $0.view = with(NSHostingView(rootView: rootView)) {
                    $0.frame = NSRect(x: 0, y: 0, width: 525, height: 325)
                }
            })
            $0.addItem(
                withTitle: "Quit",
                action: #selector(Terminator.quitApp),
                keyEquivalent: "Q"
            ).target = Terminator.self
        }

        statusItem = with(NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)) {
            $0.menu = menu
            $0.button?.title = title()
        }
    }

    func title(with time: String? = nil) -> String { "✈ \(time ?? "-:--")" }

    var body: some Scene {
        WindowGroup {
            ZStack {
                EmptyView()
            }
            .hidden()
            .onAppear {
                setupStatusBar()
            }
            .onReceive(state.$flight) {
                statusItem?.button?.title = title(with: try? $0?.get().flightTimeRemaining)
            }
        }
    }
}
