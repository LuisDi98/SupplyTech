# This Python file uses the following encoding: utf-8
import pandas as pd

class GPSManager:
    def __init__(self):
        print("GPS Manager creating....")
        self.coords = list()

    def loadClientsCoords(self, facturacion_df, coordenadas_df):
        print("load Clients Coords running...")


