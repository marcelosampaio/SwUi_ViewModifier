//
//  SwUi_ViewModifierApp.swift
//  SwUi_ViewModifier
//
//  Created by Marcelo Sampaio on 15/08/22.
//

import SwiftUI

@main
struct SwUi_ViewModifierApp: App {
    @State var connected = Reachability.standard.isConnected
    var body: some Scene {
        WindowGroup {
            if connected {
                ContentView()
                    .onAppear(perform: Reachability.standard.startMonitoring)
            } else {
                ReachabilityView()
                    .onAppear(perform: Reachability.standard.startMonitoring)
            }
            
        }
    }
}
