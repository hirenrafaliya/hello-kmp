import platform.UIKit.UIDevice

class IOSPlatform: Platform {
    override val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
    override val names: List<String> = listOf("Virat", "Rohit", "Jasprit", "Mahendra")
}

actual fun getPlatform(): Platform = IOSPlatform()