//
//  SwUi_ViewModifierApp.swift
//  SwUi_ViewModifier
//
//  Created by Marcelo Sampaio on 15/08/22.
//

import SwiftUI

@main
struct SwUi_ViewModifierApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: Reachability.standard.startMonitoring)
        }
    }
}
