import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../GPS"


Rectangle {
    id: centralPane
    x: 190.33
    y: 95
    width: parent.width - 188.33
    height: parent.height - 95
    color: "#FFE6DF"

    property int selectedIndex: -1 // To store the index of the selected button

    GPS {
        id: mapView
        visible: selectedIndex !== -1 // Show only when a button is clicked
        anchors.fill: parent
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        visible: selectedIndex === -1 // Show only when no button is clicked

        GridLayout {
            id: gridLayout
            anchors.left: parent.left
            x: 25
            y: 25
            width: 800
            columns: 3
            rows: Math.ceil(dataHolder.lista.length / columns) // Use the length of the list directly
            columnSpacing: 50
            rowSpacing: 50

            Repeater {
                model: dataHolder.lista

                Rectangle {
                    width: 300
                    height: 200
                    color: "white"
                    radius: 10

                    ColumnLayout {
                        anchors.fill: parent

                        Text {
                            text: modelData[0]
                            font.bold: true
                            font.pointSize: 24
                            Layout.alignment: Qt.AlignHCenter
                        }

                        RowLayout {
                            spacing: 50
                            anchors.horizontalCenter: parent.horizontalCenter

                            Button {
                                icon.source: "./../../assets/eye_icon.png"
                                icon.width: 64
                                icon.height: 64
                                background: Rectangle {
                                    color: "white"
                                    border.width: 0.5
                                    radius: 15
                                }

                            }
                            Button {
                                icon.source: "./../../assets/icons8-gps-50.png"
                                icon.width: 64
                                icon.height: 64
                                background: Rectangle {
                                    color: "white"
                                    border.width: 0.5
                                    radius: 15
                                }
                                onClicked: {
                                    centralPane.selectedIndex = index; // Set the index of the selected button
                                    showMap(index); // Call showMap with the index
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    function showMap(indexButtonClicked) {
        console.log("index: ", indexButtonClicked)

        var data = dataHolder.lista[indexButtonClicked];
        mapView.load(data);
    }
}
