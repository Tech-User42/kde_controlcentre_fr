import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: i18n("Apparence")
        icon: "preferences-desktop-color"
        source: "config/configAppearance.qml"
    }
    ConfigCategory {
        name: i18n("Comportement")
        icon: "preferences-desktop"
        source: "config/configBehaviour.qml"
    }
    ConfigCategory {
        name: i18n("Thèmes")
        icon: "color-picker"
        source: "config/configColorscheme.qml"
        visible: Plasmoid.configuration.showColorSwitcher
    }
    ConfigCategory {
        name: i18n("Support")
        icon: "face-angel"
        source: "config/configSupport.qml"
    }
}
