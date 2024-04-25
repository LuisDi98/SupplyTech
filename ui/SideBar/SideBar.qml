import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    width: 188.33
    height: parent.height
    color: "#FFE6DF"

    ColumnLayout {
        y: 145
        anchors.left: parent.left
        anchors.right: parent.right
        height: 400
        spacing: 25

        Button {
            Layout.alignment: Qt.AlignHCenter
            text: "\nRutas"

            icon.source: "./../../assets/icons8-carretera-64.png"
            icon.width: 64
            icon.height: 64

            background: Rectangle {
                id: button1
                implicitWidth: 158.33
                implicitHeight: 122
                border.width: 1
                radius: 15
            }

            onClicked: {
                button1.color = "#F0052F"
                button1.opacity = 0.15
                console.info("button clicked")
            }

            onHoveredChanged: {

            }
        }

        Button {
            Layout.alignment: Qt.AlignHCenter
            text: "\nClientes"
            icon.source: "./../../assets/customer_icon.png"
            icon.width: 64
            icon.height: 64

            background: Rectangle {
                implicitWidth: 158.33
                implicitHeight: 122
                opacity: enabled ? 1 : 0.3
                border.color: control.down ? "#F0052F" : "#900000"
                border.width: 1
                radius: 15
            }
        }

        Button {
            Layout.alignment: Qt.AlignHCenter
            text: "\nConfiguraciones"
            icon.source: "./../../assets/icons8-ajustes-50.png"
            icon.width: 64
            icon.height: 64

            background: Rectangle {
                implicitWidth: 158.33
                implicitHeight: 122
                opacity: enabled ? 1 : 0.3
                border.color: control.down ? "#F0052F" : "#900000"
                border.width: 1
                radius: 15
            }
        }

    }
}
