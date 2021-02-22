import QtQuick 2.3
import QtQuick.Layouts 1.3

import "imports" as ComponentsConstants
import "components" as Components

import com.dgb.authentificator 1.0

Rectangle
{
    id: centralPanel
    signal loginCompleted()

    color: ComponentsConstants.Constants.menuColor

    ColumnLayout
    {
        spacing: 12

        Image
        {
            id: image

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 100
            Layout.preferredHeight: 50
            fillMode: Image.PreserveAspectFit
            source: ComponentsConstants.Constants.qImagePath
        }

        Components.InputText
        {
            id: loginField

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            placeholderText: "<i>Login</i>"

            onAccepted: passwordField.focus = true
        }

        Components.InputText
        {
            id: passwordField

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            echoMode: TextInput.Password
            placeholderText: "<i>Password</i>"

            onAccepted: loginButton.focus = true
        }

        Components.LoginButton
        {
            id: loginButton

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth + 2
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            function activate()
            {
                console.log("Token request sended")
                Authentificator.getToken(loginField.text, passwordField.text)
            }

            Keys.onReturnPressed: loginButton.activate()
            Keys.onEnterPressed: loginButton.activate()

            onClicked: loginButton.activate()

            Connections
            {
                target: Authentificator
                function onTokenRecieveSuccess() {
                    centralPanel.loginCompleted()
                }
                function onTokenRecieveFailture() {
                    errorText.visible = true
                }
            }
        }

        Text
        {
            id: forgotPassword

            Layout.alignment: Qt.AlignCenter
            text: "Forgot password?"
            color: ComponentsConstants.Constants.inputTextBg

            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    Qt.openUrlExternally("https://google.com")
                    forgotPassword.color = ComponentsConstants.Constants.forgotPasswordPressedBg
                }
                onCanceled: forgotPassword.color = ComponentsConstants.Constants.forgotPasswordBgr
            }
        }

        Text
        {
            id: errorText

            Layout.alignment: Qt.AlignCenter
            visible: false
            text: "Wrong login or password"
            color: "red"
        }
    }

}

