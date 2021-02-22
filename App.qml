import QtQuick 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "imports" as ComponentsConstants

Window
{
    visible: true
    width: 1240; height: 720
    title: qsTr("App")
    color: ComponentsConstants.Constants.menuColor

    minimumHeight: 400
    minimumWidth: 400
}
