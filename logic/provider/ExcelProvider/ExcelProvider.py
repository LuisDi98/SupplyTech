import os.path
import pandas as pd

class ExcelProvider:

    def __init__(self):
        pass


    def readAllSheets(self, filename):
        if not os.path.isfile(filename):
            return None

        xls = pd.ExcelFile(filename)
        sheets = xls.sheet_names
        results = {}
        for sheet in sheets:
            results[sheet] = xls.parse(sheet)

        xls.close()

        return results, sheets

    def load(self, filename):
        if not self.__validate_excel(filename):
            raise ValueError("Invalid Excel file")

        df = pd.read_excel(filename)
        return df

    def __validate_excel(self, filename):
        # Add your validation logic here
        return True  # Placeholder for now


