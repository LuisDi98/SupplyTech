import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    width: 188.33
    height: parent.height
    color: "#FFE6DF"

    ColumnLayout {
        y: 95
        anchors.left: parent.left
        anchors.right: parent.right
        height: 400
        spacing: 10

        Button {
            Layout.alignment: Qt.AlignHCenter
            text: "\nRutas"
            icon.source: "./../../assets/icons8-carretera-64.png"
            icon.width: 64
            icon.height: 64
        }

        Button {
            Layout.alignment: Qt.AlignHCenter
            text: "\nConfiguraciones"
            icon.source: "./../../assets/icons8-ajustes-50.png"
            icon.width: 64
            icon.height: 64
        }

    }
}
