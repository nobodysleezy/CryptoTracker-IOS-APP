import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // Ukládáme stav přepínače

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Theme")) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                    .onChange(of: isDarkMode) { newValue in                        // Měníme téma aplikace na základě přepínače
                        UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}


