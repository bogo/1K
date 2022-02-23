import AppKit
import Combine
import OneKit
import SwiftUI

@main
struct OneKApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    let popover = NSPopover()
    lazy var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    private var contentViewController: NSViewController {
        let rootView = RootView().environmentObject(state)
        let viewController = NSHostingController(rootView: rootView)
        return viewController
    }

    private var state: AppState = .init()
    private var bag = Set<AnyCancellable>()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        configurePopover()
        configureStatusItem()
    }
    
    private func configurePopover() {
        popover.contentSize = NSSize(width: 525, height: 375)
        popover.behavior = .transient
        popover.contentViewController = contentViewController
    }
    
    private func configureStatusItem() {
        statusItem.button?.title = AppDelegate.title()
        statusItem.button?.action = #selector(togglePopover)
        
        state.$flight
            .sink { self.statusItem.button?.title = AppDelegate.title(with: try?  $0?.get().flightTimeRemaining) }
            .store(in: &bag)
    }

    static func title(with time: String? = nil) -> String { "✈ \(time ?? "-:--")" }
    
    @objc private func togglePopover() {
        guard let button = statusItem.button else {
            fatalError()
        }
        
        if popover.isShown {
            popover.performClose(button)
        } else {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }
    
}
