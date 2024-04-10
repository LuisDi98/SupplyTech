import pyrfc

class SAPProvider:
    def __init__(self, username, password):
        self.username = username
        self.password = password
        self.conn = None

    def connect(self):
        params = {
            'user': self.username,
            'passwd': self.password,
            'ashost': 'your_sap_host',
            'sysnr': 'your_sap_sysnr',
            'client': 'your_sap_client',
            'lang': 'EN'
        }

        self.conn = pyrfc.Connection(**params)
        return self.conn.alive

    def disconnect(self):
        if self.conn:
            self.conn.close()

    def get_connection(self):
        return self.conn

