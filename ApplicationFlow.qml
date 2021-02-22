import QtQuick 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "imports" as ComponentsConstants
import "components" as Components

StackView
{
    id: stackView
    anchors.fill: parent
    initialItem: loginComponent

    Component
    {
        id: loginComponent
        LoginWindow
        {
            anchors.centerIn: parent
            width: 182; height: 220

            onLoginCompleted: {
                stackView.replace(mainComponent)
            }
        }
    }

    Component
    {
        id: mainComponent
        MainWindow
        {
            id: mainWindow
        }
    }

}

