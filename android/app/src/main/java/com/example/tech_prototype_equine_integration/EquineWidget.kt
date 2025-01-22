package com.example.tech_prototype_equine_integration


class EquineWidget : BaseEquineWidget() {
    override fun getLayoutId(isSucces: Boolean, minWidth: Int): Int {
        return if (isSucces) {
            if (minWidth < 300) R.layout.equine_integration_widget_succes else R.layout.equine_integration_widget_succes_large
        } else {
            if (minWidth < 300) R.layout.equine_integration_widget_error else R.layout.equine_integration_widget_error_large
        }
    }
}
