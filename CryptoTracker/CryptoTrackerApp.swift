import SwiftUI

@main
struct CryptoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }

                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }

                WalletView()  // Přidáme WalletView jako novou kartu
                    .tabItem {
                        Label("Wallet", systemImage: "wallet.pass.fill")
                    }
            }
        }
    }
}

