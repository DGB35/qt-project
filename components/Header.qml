import QtQuick 2.0

Rectangle
{
    TextComponent
    {
        anchors.fill: parent
        id: name
        text: qsTr("All projects")
        font.pixelSize: 16
        horizontalAlignment: Text.Center
    }
}
