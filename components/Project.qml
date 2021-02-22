import QtQuick 2.9
import QtQuick.Controls 2.0

import "../imports" as ComponentsConstants

Rectangle
{
    id: bg

    width: parent.width
    height: 60
    color: "transparent"

    Row
    {
        anchors.fill: parent
        spacing: 10

        Image
        {
            horizontalAlignment: parent.horizontalCenter
            id: image
            source: icon
            width: 50
            height: 50
        }

        Column
        {
            TextComponent
            {
                id: title
                text: name
                font.pixelSize: 13
                font.bold: true
            }

            TextComponent
            {
                id: description
                text: name
                font.pixelSize: 11
            }
        }

    }



}
