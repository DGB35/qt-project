pragma Singleton
import QtQuick 2.6

QtObject
{
    readonly property real elementsWidth: 180
    readonly property real elementsHeight: 30

    readonly property string qImagePath: "../images/Q.png"

    readonly property color inputTextBg: "#8dadd6"
    readonly property color forgotPasswordBg: "#8dadd6"
    readonly property color forgotPasswordPressedBg: "#00aefe"

    readonly property color menuColor: "#4b7eb7"
    readonly property color loginButtonColor: "#2a609e"
    readonly property color loginButtonPressedColor: "#00376f"

    readonly property color ticketsPanelColor: "#0e1621"
    readonly property color projectsPanelColor: "#17212b"
    readonly property color textColor: "#f5f5f5"
    readonly property color projectSelectedlColor:"#2b5278"

    readonly property real  headerHeigth: 0.03
}
