interface Platform {
    val name: String
    val names: List<String>
}

expect fun getPlatform(): Platform