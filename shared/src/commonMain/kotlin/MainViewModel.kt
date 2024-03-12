import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update

class MainViewModel {
    private val _counter = MutableStateFlow("0")
    val counter: StateFlow<String> = _counter
    
    suspend fun increase() {
        _counter.update { it.toInt().inc().toString() }
    }
}