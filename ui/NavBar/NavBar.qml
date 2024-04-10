import QtQuick 2.15

Rectangle {
    width: parent.width
    height: 95
    color: "#FFE6DF"

    Rectangle {
        width: parent.parent.width
        height: 1
        y: parent.height
        color: "black"

    }


    Image {
        source: "../../assets/puratosLogo.png"
        width: 75
        height: 75
        x: (parent.width / 2) - 75
        y: (parent.height / 2) - 32.5
    }

    Text {
        text: qsTr("SupplyTech")
        font.family: "Roboto bold"

        font.pixelSize: 48
        color: "#F0052F"
        x: (parent.width / 2)
        y: (parent.height / 2) - (font.pixelSize / 2)
    }

}
