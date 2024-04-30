# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from logic.model.DataHolder import DataHolder as Store
from logic.provider.ExcelProvider.ExcelProvider import ExcelProvider as DataLoader
from logic.GPSManager import GPSManager
from logic.PickingManager import PickingManager

#from logic.provider.SAPProvider.SAPProvider import SAPProvider
"""
def testSAP():

    #SAP testing, connects to SAP and shows a ping result to assure the connection.

    username = "A"
    password = "ABC123"
    sap_provider = SAPProvider(username, password)
    connected = sap_provider.connect()
    if connected:
        print("Connected to SAP.")
        # Use the connection for further SAP operations
        conn = sap_provider.get_connection()
        # For example, execute an RFC call
        result = conn.call("RFC_PING")
        print("RFC Ping Result:", result)
    else:
        print("Failed to connect to SAP.")

print("Testing de SAP")
testSAP()
"""



def testExcel():

    #Excel Testing, just prints out an excel table loaded from a path


    excel_provider = DataLoader()
    #facturas = excel_provider.load("testData/Facturación 09-01-2024.XLSX")
    coordenadas, hojas = excel_provider.readAllSheets("testData/Coordenadas_clientes_por_ruta.xlsx")
    print(coordenadas)
    print(hojas)

    for hoja in hojas:
        print("\n\nPara la hoja: ", hoja)
        print(coordenadas[hoja])

# Driver
if __name__ == "__main__":
    #testSAP()
    lista = [
        ["Ruta 1", ["Dato 1", "Dato 2"]],
        ["Ruta 2", ["Dato 3", "Dato 4"]]
    ]
    store = Store(lista)
    gpsManager = GPSManager()
    pickingManager = PickingManager()

    #testExcel()
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("store", store)
    engine.rootContext().setContextProperty("gpsManager", gpsManager)
    engine.rootContext().setContextProperty("pickingManager", pickingManager)
    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
