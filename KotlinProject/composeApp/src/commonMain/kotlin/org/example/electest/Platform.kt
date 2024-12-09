package org.example.electest

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform