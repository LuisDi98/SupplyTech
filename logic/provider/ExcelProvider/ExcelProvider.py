import pandas as pd

class ExcelProvider:

    def __init__(self):
        pass

    def load(self, filename):
        if not self.__validate_excel(filename):
            raise ValueError("Invalid Excel file")

        df = pd.read_excel(filename)
        print(df)
        return df

    def __validate_excel(self, filename):
        # Add your validation logic here
        return True  # Placeholder for now


