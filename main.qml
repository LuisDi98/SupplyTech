import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.3
import "ui/SideBar"
import "ui/NavBar"
import "ui/CentralPane"

Window {
    width: 1600
    height: 900
    visible: true
    //@disable-check M16
    title: qsTr("SupplyTech Puratos")

    CentralPane {
        id: centralPane
    }

    SideBar {
        id: sidebar
    }

    NavBar {
        id: navbar
    }
}
