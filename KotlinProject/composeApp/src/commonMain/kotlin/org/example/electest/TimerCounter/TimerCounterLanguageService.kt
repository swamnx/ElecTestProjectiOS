package org.example.electest.TimerCounter

import kotlinproject.composeapp.generated.resources.Res
import kotlinproject.composeapp.generated.resources.timer_hours
import kotlinproject.composeapp.generated.resources.timer_minutes
import kotlinproject.composeapp.generated.resources.timer_minutes_short
import kotlinproject.composeapp.generated.resources.timer_seconds_short
import org.jetbrains.compose.resources.getPluralString
import org.jetbrains.compose.resources.getString

class TimerCounterLanguageService: TimerCounterLanguageServiceInterface {

    override suspend fun getHoursStr(hours: Int): String {
        return getPluralString(Res.plurals.timer_hours, hours, hours)
    }

    override suspend fun getMinutesStr(minutes: Int): String {
        return getPluralString(Res.plurals.timer_minutes, minutes, minutes)
    }

    override suspend fun getMinutesSStr(minutes: Int): String {
        return getString(Res.string.timer_minutes_short, minutes)
    }

    override suspend  fun getSecondsSStr(seconds: Int): String {
        return getString(Res.string.timer_seconds_short, seconds)
    }
}