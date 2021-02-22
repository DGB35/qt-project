import QtQuick 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "imports" as ComponentsConstants
import "components" as Components

Rectangle
{
    Components.Header
    {
       anchors.top: parent.anchors.top
       height: parent.height * ComponentsConstants.Constants.headerHeigth
       width: parent.width
       color: ComponentsConstants.Constants.projectsPanelColor
    }

    SplitView
    {
         id: splitView
         anchors.topMargin: parent.height * ComponentsConstants.Constants.headerHeigth
         anchors.fill: parent

         Components.ProjectsPanel
         {
            id: projectsPanel
            SplitView.preferredWidth: 300
            SplitView.minimumWidth: 250
            SplitView.maximumWidth: 400
            color: ComponentsConstants.Constants.projectsPanelColor
         }

         Components.TicketsPanel
         {
            id: ticketsPanel
            SplitView.preferredWidth: 620
            SplitView.minimumWidth: 500
            color: ComponentsConstants.Constants.ticketsPanelColor
         }

         Components.Panel
         {
            id: panel
            SplitView.minimumWidth: 250
            color: ComponentsConstants.Constants.projectsPanelColor
         }

         handle: Rectangle {
             implicitWidth: 4
             implicitHeight: 4
             color: ComponentsConstants.Constants.projectsPanelColor
         }
    }
}
