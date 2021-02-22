import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

import "../imports" as ComponentsConstants

import com.dgb.authentificator 1.0
import com.dgb.projectModel 1.0

Panel
{
    ProjectModel
    {
        id: projectsModel
    }

    Component
    {
        id: projectsDelegate
        Project
        {
            MouseArea
            {
                id: area
                focus: true
                anchors.fill: parent
                onClicked: {
                    if(view.currentIndex !== model.index)
                        Authentificator.requestTiketsData(model.id)
                    view.currentIndex = model.index
                }
            }
        }
    }

    ListView
    {
        id: view
        anchors.fill: parent

        interactive: false
        clip: true
        currentIndex: -1
        highlightMoveDuration: 0
        highlight: Rectangle
        {
            anchors { left:parent.left; right: parent.right }
            color: ComponentsConstants.Constants.projectSelectedlColor
        }

        model: projectsModel
        delegate: projectsDelegate
    }
}


