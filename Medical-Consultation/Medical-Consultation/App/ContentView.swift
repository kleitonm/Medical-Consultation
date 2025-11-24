//
//  ContentView.swift
//  Medical-Consultation
//
//  Created by Kleiton Mendes on 06/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "house") }
                )
            }
            
            NavigationStack {
                MyAppointmentsView()
            }
            .tabItem {
                Label(
                    title: { Text("Minhas consultas") },
                    icon: { Image(systemName: "calendar") }
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
