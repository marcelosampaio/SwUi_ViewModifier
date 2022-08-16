//
//  Reachability.swift
//  SwUi_ViewModifier
//
//  Created by Marcelo Sampaio on 15/08/22.
//

import SwiftUI
import Network

enum Context: Equatable {
    case none
    case login
    case register
}

struct Constants {
    static let reachabilityChanged = "reachabilityChanged"
    static let connected = "isConnected"
    static let monitor = "Monitor"
}

class Reachability: ObservableObject {
    static let standard = Reachability(isConnected: .constant(false))
    let monitor = NWPathMonitor()
    weak var notification = NotificationCenter.default
    @Binding var isConnected: Bool
    
    var context: Context?

    class var shared: Reachability {
        return standard
    }

    private init(isConnected: Binding<Bool>) {
        self._isConnected = isConnected
        self.monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                print("🌎 connected 👍")
//                self?.notification?.post(name: Notification.Name(Constants.reachabilityChanged),
//                                       object: nil,
//                                       userInfo: [Constants.connected: true])
                self?._isConnected = .constant(true)
                print("📣 isConnected? \(Reachability.standard.isConnected)")
            } else {
                print("🌎 disconnected ❌")
//                self?.notification?.post(name: Notification.Name(Constants.reachabilityChanged),
//                                       object: nil,
//                                       userInfo: [Constants.connected: false])
                self?._isConnected = .constant(false)
                print("📣 isConnected? \(Reachability.standard.isConnected)")
            }
        }
    }

    func startMonitoring() {
        let queue = DispatchQueue(label: Constants.monitor)
        monitor.start(queue: queue)
    }
}

