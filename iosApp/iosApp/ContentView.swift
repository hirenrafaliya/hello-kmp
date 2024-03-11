import SwiftUI
import Shared

struct ContentView: View {
    @State private var showContent = false
    var body: some View {
            NavigationStack {
                List(Greeting().getNames(), id: \.self) { name in
                    Text(name)
                }
                    .navigationTitle("Better rest")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
