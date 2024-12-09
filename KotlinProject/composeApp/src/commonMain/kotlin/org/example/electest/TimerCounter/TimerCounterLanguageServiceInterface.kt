package org.example.electest.TimerCounter

interface TimerCounterLanguageServiceInterface {

    suspend fun getHoursStr(hours: Int): String
    suspend fun getMinutesStr(minutes: Int): String
    suspend fun getMinutesSStr(minutes: Int): String
    suspend fun getSecondsSStr(seconds: Int): String
}