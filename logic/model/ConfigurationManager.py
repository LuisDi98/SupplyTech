from PySide6.QtCore import QObject, Signal, Property

class ConfigurationManager(QObject):

    def ConfigurationManager(self, QObject):
        QObject.__init__(self)

    def __new__(cls):
        if not hasattr(cls, 'instance'):
          cls.instance = super(ConfigurationManager, cls).__new__(cls)
        return cls.instance

    def setConfig(self, configObj):
        self.config = configObj
