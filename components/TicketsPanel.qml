import QtQuick 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.3

import "../imports" as ComponentsConstants

import com.dgb.authentificator 1.0
import com.dgb.ticketModel 1.0

Panel
{
    color: ComponentsConstants.Constants.ticketsPanelColor
    TicketModel
    {
        id: ticketsModel
    }

    Connections
    {
        target: Authentificator
        function onTicketsDataRecieveSuccess() {
            console.log("Tickets data recieved")
        }
    }


    Component
    {
        id: ticketsDelegate
        Ticket {}
    }

    ListView
    {
        id:view

        spacing: 15
        anchors.fill: parent

        clip: true
        model: ticketsModel
        delegate: ticketsDelegate
    }
}
