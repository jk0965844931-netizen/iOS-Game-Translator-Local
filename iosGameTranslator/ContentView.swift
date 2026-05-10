import SwiftUI

@main
struct iOSGameTranslatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("🎮 Game Translator")
                .font(.largeTitle)
                .bold()
            Text("Local AI Translation")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
