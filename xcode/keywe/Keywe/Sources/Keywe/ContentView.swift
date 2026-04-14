import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "keyboard")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Welcome to Keywe")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
