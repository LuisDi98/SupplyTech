import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

Rectangle {
    id: centralPane
    x: 190.33
    y: 95
    width: parent.width - 188.33
    height: parent.height - 95
    color: "#FFE6DF"


    ScrollView {
        anchors.fill: parent



        GridLayout {
            id: gridLayout
            anchors.left: centralPane.anchors.left
            x: 25
            y: 25

            width: 800
            columns: 3
            rows: Math.ceil(9 / columns) // Calculate the number of rows needed
            columnSpacing: 50 // Horizontal spacing between columns
            rowSpacing: 50 // Vertical spacing between rows

            Repeater {
                model: dataHolder.lista // Number of cards (rows x cols)

                Rectangle {
                    width: 300
                    height: 200
                    color: "lightblue"
                    radius: 15

                    ColumnLayout {
                        anchors.fill: parent

                        Text {
                            text: modelData[0]
                            font.bold: true
                            Layout.alignment: Qt.AlignHCenter
                        }

                        RowLayout {
                            spacing: 10 // Spacing between buttons
                            anchors.horizontalCenter: parent.horizontalCenter

                            Button {
                                text: "Button 1"
                            }
                            Button {
                                text: "Button 2"
                            }
                            Button {
                                text: "Button 3"
                            }
                        }
                    }
                }
            }
        }
    }


}
