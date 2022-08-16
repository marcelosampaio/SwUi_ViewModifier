//
//  ContentView.swift
//  SwUi_ViewModifier
//
//  Created by Marcelo Sampaio on 15/08/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var reachability: Reachability = Reachability.standard.self
    var body: some View {
        if !reachability.isConnected {
            VStack {
                Text("❌ no internet connection")
            }
        } else {
            VStack {
                Image(systemName: "bus")
                    .resizable()
                    .frame(width:50, height:50)
                Text("Downtown Bus")
                    .borderedCaption()
                
                Button("Toggle reachability") {
                    print("Connection sstatus: \(Reachability.standard.isConnected)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
