import QtQuick 2.3
import QtQuick.Layouts 1.3

import "../imports" as ComponentsConstants


Rectangle
{
    color: ComponentsConstants.Constants.menuColor

    ColumnLayout
    {
        spacing: 12

        Image
        {
            Layout.preferredWidth: 100
            Layout.preferredHeight: 50
            fillMode: Image.PreserveAspectFit
            source: ComponentsConstants.Constants.qImagePath
            Layout.alignment: Qt.AlignCenter
        }

        InputText
        {
            id: loginField

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            placeholderText: "<i>Login</i>"
        }

        InputText
        {
            id: passwordField

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            echoMode: TextInput.Password
            placeholderText: "<i>Password</i>"
        }

        ButtonLogin
        {
            id: submit

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth + 2
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            onClicked: {
                let result = loginButton.loginButtonClick(loginField.text, passwordField.text)
                console.debug(result)
                if(!result)
                {
                    errorText.visible = true
                }
                else
                {
                    stackView.replace(mainComponent)
                }

            }
        }

        Text
        {
            id: forgotPassword

            Layout.alignment: Qt.AlignCenter
            text: "Forgot password?"
            color: ComponentsConstants.Constants.inputTextBg
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

