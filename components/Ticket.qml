import QtQuick 2.9
import QtQuick.Controls 2.0

import "../imports" as ComponentsConstants

Rectangle
{
    color: ComponentsConstants.Constants.ticketsPanelColor

    id: ticket
    width: parent.width * 0.9
    height: 60

    border.color: ComponentsConstants.Constants.projectsPanelColor
    border.width: 2
    radius: 10

    anchors.horizontalCenter: parent.horizontalCenter
    Column
    {
        anchors.fill: parent

        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 4
        clip: true

        TextComponent
        {
            id: title
            text: name
            font.pixelSize: 14
            font.bold: true
        }
        TextComponent
        {
            id: descr
            text: description
            font.pixelSize: 12
        }
        TextComponent
        {
            id: prior
            text: priority
            font.pixelSize: 12
        }
    }

    Popup
    {
        id: popup
        anchors.centerIn: parent
        width: 250
        height: 100

        Column
        {
            anchors.fill: parent
            TextEdit
            {
                id: edit
                text: title.text
                font.pixelSize: 12

                width: parent.width * 0.9

                selectByMouse: true
                wrapMode: Text.Wrap
            }

            Row
            {
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Button
                {
                    id: save
                    width: 50
                    height: 20
                    text: "Save"
                    onClicked: {
                        edit.text = edit.text.replace(/\n/g, " ")
                        edit.text = edit.text.trim()

                        if(edit.text.length > 0)
                            title.text = edit.text

                        popup.close()
                    }
                }
                Button
                {
                    id: cancel
                    width: 50
                    height: 20
                    text: "Cancel"

                    onClicked: {
                        popup.close()
                    }
                }
            }
        }
        onClosed: edit.text = title.text

        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: popup.open()
    }
}
