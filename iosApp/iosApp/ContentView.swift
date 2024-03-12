import SwiftUI
import Shared

struct ContentView: View {
    @State private var showContent = ""
    @State private var viewModel = ChatRoomViewModel()
    var body: some View {
            NavigationStack {
                Text("Hello \(viewModel.messages.count) \(showContent)")
                Button("Button title") {
                    showContent = viewModel.messages.first ?? "nil"
                }

                    .navigationTitle("Better rest")
            }.task {
                await viewModel.activate()

            }
    }
}

class ChatRoomViewModel: ObservableObject {
    let chatRoom = ChatRoom()

    @Published
    private(set) var messages: [String] = []

    @MainActor
    func activate() async {
        Task.detached {
            try? await self.chatRoom.add()
        }
        for await messages in chatRoom.messages {
            // No type cast (eg `it as! [String]`) is needed because the generic type is preserved.
            self.messages = messages
            print(messages)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
