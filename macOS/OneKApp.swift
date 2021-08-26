import AppKit
import Combine
import OneKit
import SwiftUI

@main
struct OneKApp: App {
    @State var flight: Result<United, Error>?
    private var publisher = fetchFlightInformation(every: 30.0)
    private var statusItem: NSStatusItem?

    init() {
        setupStatusBar()
    }

    mutating func setupStatusBar() {
        let menu = with(NSMenu()) {
            $0.addItem(with(NSMenuItem()) {
                let rootView = RootView(flight: flight)
                $0.view = with(NSHostingView(rootView: rootView)) {
                    $0.frame = NSRect(x: 0, y: 0, width: 525, height: 325)
                }
            })
        }

        // StatusItem is stored as a class property.
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
            .onReceive(publisher) {
                ((self.statusItem?.menu?.items.first?.view as! NSHostingView<RootView>).rootView).flight = $0
                self.statusItem?.button?.title = title(with: try? $0.get().flightTimeRemaining)
            }
            .hidden()
        }
    }
}
