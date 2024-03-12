import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.update

class Greeting {
    private val platform = getPlatform()

    fun greet(): String {
        return "Hello, ${platform.name}"
    }

    fun getNames() = platform.names
    private val _messages = MutableStateFlow(emptyList<String>())
    val messages: StateFlow<List<String>> = _messages

    suspend fun getPlayers(): Unit {
        _messages.emit(listOf("Virat"))
    }
}

class ChatRoom {
    private val _messages = MutableStateFlow(emptyList<String>())
    val messages: StateFlow<List<String>> = _messages

    suspend fun add() {
        for(i in 0..50) {
            _messages.update { listOf(i.toString()) }
            delay(50)
        }
    }
}