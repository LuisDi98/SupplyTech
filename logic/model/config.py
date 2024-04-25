# This Python file uses the following encoding: utf-8


class Config(object):

    def __new__(cls):
        if not hasattr(cls, 'instance'):
          cls.instance = super(Config, cls).__new__(cls)
        return cls.instance

    def setConfig(self, configObj):
        self.config = configObj
