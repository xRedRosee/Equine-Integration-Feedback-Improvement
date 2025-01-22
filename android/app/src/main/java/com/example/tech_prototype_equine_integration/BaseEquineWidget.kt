package com.example.tech_prototype_equine_integration

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.os.Bundle
import android.widget.RemoteViews

abstract class BaseEquineWidget : AppWidgetProvider() {

    private var defaultProgressValue: Int = 2
    private var defaultTargetValue: Int = 7
    private var defaultHorseName: String = "Horse"
    private var defaultTopScore: Int = 5
    private var defaultIntensityLevel: String = "high"
    private var isSucces: Boolean = true
    private var defaultHorseFeeling: String = "happy"

    data class WidgetData(
        val progressValue: Int,
        val intensityLevel: String,
        val maxValue: Int,
        val horseName: String,
        val topScore: Int,
        val horseFeeling: String
    )

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        val sharedPreferences = context.getSharedPreferences("WidgetPrefs", Context.MODE_PRIVATE)
        val widgetData = loadWidgetData(sharedPreferences)

        for (appWidgetId in appWidgetIds) {
            val options = appWidgetManager.getAppWidgetOptions(appWidgetId)
            val layoutId = getLayoutId(isSucces, options.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH, 0))
            val views = RemoteViews(context.packageName, layoutId)

            updateViews(context, views, widgetData)
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }

    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: Bundle
    ) {
        super.onAppWidgetOptionsChanged(context, appWidgetManager, appWidgetId, newOptions)
        val sharedPreferences = context.getSharedPreferences("WidgetPrefs", Context.MODE_PRIVATE)
        val widgetData = loadWidgetData(sharedPreferences)

        val layoutId = getLayoutId(isSucces, newOptions.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH, 0))
        val views = RemoteViews(context.packageName, layoutId)

        updateViews(context, views, widgetData)
        appWidgetManager.updateAppWidget(appWidgetId, views)
    }

    protected open fun loadWidgetData(sharedPreferences: android.content.SharedPreferences): WidgetData {
        return WidgetData(
            progressValue = sharedPreferences.getInt("progressValue", defaultProgressValue),
            intensityLevel = sharedPreferences.getString("intensityLevel", defaultIntensityLevel) ?: defaultIntensityLevel,
            maxValue = sharedPreferences.getInt("maxValue", defaultTargetValue),
            horseName = sharedPreferences.getString("horseName", defaultHorseName) ?: defaultHorseName,
            topScore = sharedPreferences.getInt("topScore", defaultTopScore),
            horseFeeling = sharedPreferences.getString("horseFeeling", defaultHorseFeeling) ?: defaultHorseFeeling,
        )
    }

    protected abstract fun getLayoutId(isSucces: Boolean, minWidth: Int): Int

    protected open fun updateViews(context: Context, views: RemoteViews, data: WidgetData) {
        val intensityDetails = getIntensityDetails(context, data.intensityLevel)
        views.setImageViewResource(R.id.intensity_icon, intensityDetails.icon)
        views.setTextViewText(R.id.training_intensity_text, intensityDetails.text)
        val horseFeelingIcon = getHorseFeeling(defaultHorseFeeling)
        
        views.setImageViewResource(R.id.feeling_icon, horseFeelingIcon)
        views.setProgressBar(R.id.circularProgressBar, data.maxValue, data.progressValue, false)
        views.setTextViewText(R.id.weekly_progress_count, "${data.progressValue}/${data.maxValue}")
        views.setTextViewText(R.id.horse_name, data.horseName)
        views.setTextViewText(R.id.topPercentage, "Top ${data.topScore}%")
    }

    private fun getIntensityDetails(context: Context, intensityLevel: String): IntensityDetails {
        return when (intensityLevel) {
            "low" -> IntensityDetails("Low intensity. Lower change of injuries.", R.color.yellow, R.drawable.intensity_low)
            "medium" -> IntensityDetails("Medium intensity. Moderate change of injuries.", R.color.orange, R.drawable.intensity_medium)
            "high" -> IntensityDetails("High intensity. High change of injuries", R.color.red, R.drawable.intensity_high)
            else -> IntensityDetails("Unknown intensity", R.color.black, R.drawable.intensity_none)
        }
    }
    private fun getHorseFeeling(horseFeeling: String): Int {
        return when (horseFeeling) {
            "happy" -> R.drawable.smiley_happy
            "angry" -> R.drawable.smiley_angry
            else -> R.drawable.smiley_happy
        }
    }


    data class HorseFeelingDetails(val text: String, val color: Int, val icon: Int)
    data class IntensityDetails(val text: String, val color: Int, val icon: Int)
}
