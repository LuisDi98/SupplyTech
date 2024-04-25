import QtQuick

import QtLocation 5.15
import QtPositioning 5.15

Item {

    Plugin {
            id: mapPlugin
            name: "osm"
            PluginParameter {
                name: "osm.mapping.custom.host"
                value: "https://tite.openstreetmap.org/"
            }
        }

    Map {
        id: map

        property MapCircle circle

        Component.onCompleted: {
            console.log("\n\nCreating circle onCompleted:\n")
            circle = Qt.createQmlObject('import QtLocation; MapCircle {}', parent)
            console.log("\n\nCreated:\n")
            circle.center = QtPositioning.coordinate(9.8534, -83.9511)
            circle.radius = 50.0
            circle.color = 'black'
            circle.border.width = 2
            map.addMapItem(circle)

            console.log("\n\nCreated:\n")
        }

        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(9.8611, -83.9304) // Centered at San Jose
        zoomLevel: 15
        activeMapType: map.supportedMapTypes[map.supportedMapTypes.lenght - 1]

        // Create the route line between the markers' coordinates and print the distance
        MapPolyline {
            line.color: "blue"
            line.width: 3
            path: [
                QtPositioning.coordinate(9.8534, -83.9511),
                QtPositioning.coordinate(9.8611, -83.9304),
                QtPositioning.coordinate(9.8642, -83.9128)
            ]
        }

        //print the distance between the markers
        Text {
            text: "Distance: " + QtPositioning.coordinate(9.8534, -83.9511).distanceTo(QtPositioning.coordinate(9.8611, -83.9304)) + " meters"
            color: "black"
            font.pointSize: 16
            x: 10
            y: 10
        }



        MapQuickItem {
            coordinate: QtPositioning.coordinate(9.8534, -83.9511)
            anchorPoint.x: marker.width / 2
            anchorPoint.y: marker.height
            sourceItem: Item {
                id: marker
                width: 300
                height: 200
                Rectangle {
                    anchors.fill: parent
                    color: "white"
                    border.color: "black"
                    border.width: 1

                    radius: 15
                    Text {
                        font.pointSize: 16
                        anchors.centerIn: parent
                        text: "Puratos Costa Rica"
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: marker.visible = true
                onExited: marker.visible = false
            }
        }

        MapQuickItem {
            coordinate: QtPositioning.coordinate(9.8611, -83.9304)
            anchorPoint.x: marker2.width / 2
            anchorPoint.y: marker2.height
            sourceItem: Item {
                id: marker2
                width: 300
                height: 200
                Rectangle {
                    anchors.fill: parent
                    color: "white"
                    border.color: "black"
                    border.width: 1

                    radius: 15
                    Text {
                        font.pointSize: 16
                        anchors.centerIn: parent
                        text: "AutoMercado\nFacturado: 589000\nCosto Promedio: 8403.5\nCosto de entrega: 1850"
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: marker2.visible = true
                onExited: marker2.visible = false
            }
        }

        MapQuickItem {
            coordinate: QtPositioning.coordinate(9.8642, -83.9128)
            anchorPoint.x: marker3.width / 2
            anchorPoint.y: marker3.height
            sourceItem: Item {
                id: marker3
                width: 300
                height: 200
                Rectangle {
                    anchors.fill: parent
                    color: "white"
                    border.color: "black"
                    border.width: 1
                    radius: 15
                    Text {
                        font.pointSize: 16
                        anchors.centerIn: parent
                        text: "Basilica Los Angeles\nFacturado: 58000\nCosto Promedio: 4403.5\nCosto de entrega: 2050"
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: marker3.visible = true
                onExited: marker3.visible = false
            }
        }

        

        PinchHandler {
            id: pinch
            target: null
            onActiveChanged: if (active) {
                map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
            }
            onScaleChanged: (delta) => {
                map.zoomLevel += Math.log2(delta)
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            onRotationChanged: (delta) => {
                map.bearing -= delta
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            grabPermissions: PointerHandler.TakeOverForbidden
        }
        WheelHandler {
            id: wheel
            // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
            // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
            // and we don't yet distinguish mice and trackpads on Wayland either
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                             ? PointerDevice.Mouse | PointerDevice.TouchPad
                             : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
        }
        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
        }
        Shortcut {
            enabled: map.zoomLevel < map.maximumZoomLevel
            sequence: StandardKey.ZoomIn
            onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
        }
        Shortcut {
            enabled: map.zoomLevel > map.minimumZoomLevel
            sequence: StandardKey.ZoomOut
            onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
        }

    }
}
