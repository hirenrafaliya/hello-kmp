import SwiftUI
import Shared

struct ContentView: View {
    @State private var showContent = ""
    @ObservedObject private var viewModel = MainScreenModel()
    var body: some View {
            NavigationStack {
                List(viewModel.counter, id: \.self) { val in
                    Text("Counter -> \(val)")
                }
                    .animation(.easeInOut(duration: 1000), value: viewModel.counter)
                Button("Increase Counter") {
                    viewModel.increase()
                }

                    .navigationTitle("Better rest")
            }.task {
                await viewModel.collect()
            }
    }
}

@MainActor
class MainScreenModel: ObservableObject {
    let viewModel = MainViewModel()

    @Published
    var counter: [String] = [" -- "]

    @MainActor
    func collect() async {
        Task {
            for await counter in viewModel.counter {
                self.counter.append(counter)
            }
        }
    }

    func increase() {
        Task {
            try? await viewModel.increase()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
