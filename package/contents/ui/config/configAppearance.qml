import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import org.kde.kirigami 2.15 as Kirigami
import org.kde.kquickcontrolsaddons 2.0 as KQuickAddons
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras

ColumnLayout {
    property alias cfg_scale: scale.value
    property alias cfg_transparency: transparency.checked
    property alias cfg_showKDEConnect: showKDEConnect.checked
    property alias cfg_showNightColor: showNightColor.checked
    property alias cfg_showColorSwitcher: showColorSwitcher.checked
    property alias cfg_showVolume: showVolume.checked
    property alias cfg_showBrightness: showBrightness.checked
    property alias cfg_showMediaPlayer: showMediaPlayer.checked
    property alias cfg_showCmd1: showCmd1.checked
    property alias cfg_showCmd2: showCmd2.checked
    property alias cfg_showPercentage: showPercentage.checked
    property alias cfg_mainIconName: mainIconName.icon.name
    property alias cfg_cmdIcon1: cmdIcon1.icon.name
    property alias cfg_cmdRun1: cmdRun1.text
    property alias cfg_cmdTitle1: cmdTitle1.text
    property alias cfg_cmdIcon2: cmdIcon2.icon.name
    property alias cfg_cmdRun2: cmdRun2.text
    property alias cfg_cmdTitle2: cmdTitle2.text

    property int numChecked: showKDEConnect.checked + showColorSwitcher.checked + showNightColor.checked + showCmd1.checked + showCmd2.checked
    property int maxNum: 2

    // Used to select icons
    KQuickAddons.IconDialog {
        id: iconDialog
        property var iconObj
        onIconNameChanged: iconObj.name = iconName
    }

    Kirigami.FormLayout {
        Button {
            id: mainIconName
            Kirigami.FormData.label: i18n("Icon:")
            icon.width: PlasmaCore.Units.iconSizes.medium
            icon.height: icon.width
            onClicked: {
                iconDialog.open()
                iconDialog.iconObj= mainIconName.icon
            }
        }

        SpinBox {
            id: scale
            Kirigami.FormData.label: i18n("Echelle:")
            from: 0; to: 1000
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        CheckBox {
            id: showPercentage
            Kirigami.FormData.label: i18n("General:")
            text: i18n("Afficher le pourcentage de volume/luminosité")
        }
        CheckBox {
            id: transparency
            text: i18n("Activer la transparence")
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        CheckBox {
            id: showKDEConnect
            Kirigami.FormData.label: i18n("Afficher les raccourcis rapides :")
            text: i18n('KDE Connect')
            enabled: !checked && numChecked < maxNum || checked
        }
        CheckBox {
            id: showNightColor
            text: i18n('Mode Nuit')
            enabled: !checked && numChecked < maxNum || checked
        }
        CheckBox {
            id: showColorSwitcher
            text: i18n('Changement de thème')
            enabled: !checked && numChecked < maxNum || checked
        }
        CheckBox {
            id: showCmd1
            text: i18n('Commande custom 1')
            enabled: !checked && numChecked < maxNum || checked
        }
        Kirigami.FormLayout {
            visible: showCmd1.checked
            TextField {
                id: cmdTitle1
                Kirigami.FormData.label: i18n("Nom :")
            }
            TextField {
                id: cmdRun1
                Kirigami.FormData.label: i18n("Commande :")
            }
            Button {
                id: cmdIcon1
                Kirigami.FormData.label: i18n("Icone :")
                icon.width: PlasmaCore.Units.iconSizes.medium
                icon.height: icon.width
                onClicked: {
                    iconDialog.open()
                    iconDialog.iconObj= cmdIcon1.icon
                }
            }
        }
        CheckBox {
            id: showCmd2
            text: i18n('Commande custom 2')
            enabled: !checked && numChecked < maxNum || checked
        }
        Kirigami.FormLayout {
            visible: showCmd2.checked
            TextField {
                id: cmdTitle2
                Kirigami.FormData.label: i18n("Nom :")
            }
            TextField {
                id: cmdRun2
                Kirigami.FormData.label: i18n("Commande :")
            }
            Button {
                id: cmdIcon2
                Kirigami.FormData.label: i18n("Icone :")
                icon.width: PlasmaCore.Units.iconSizes.medium
                icon.height: icon.width
                onClicked: {
                    iconDialog.open()
                    iconDialog.iconObj= cmdIcon2.icon
                }
            }
        }
        Label {
            text: i18n("Seules 2 options peuvent co-exister.")
            font: PlasmaCore.Theme.smallestFont
            color: PlasmaCore.Theme.neutralTextColor
            Layout.fillWidth: true
            wrapMode: Text.Wrap
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        CheckBox {
            id: showVolume
            Kirigami.FormData.label: i18n("Afficher les autres composants :")
            text: i18n('Contrôle du volume')
        }
        CheckBox {
            id: showBrightness
            text: i18n('Contrôle de la luminosité')
        }
        CheckBox {
            id: showMediaPlayer
            text: i18n('Lecteur multimédia')
        }
    }

    Item {
        Layout.fillHeight: true
    }
}
