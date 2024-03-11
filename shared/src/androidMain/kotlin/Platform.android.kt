import android.os.Build

class AndroidPlatform : Platform {
    override val name: String = "Android ${Build.VERSION.SDK_INT}"
    override val names: List<String> = listOf("Virat", "Rohit", "Jasprit")
}

actual fun getPlatform(): Platform = AndroidPlatform()