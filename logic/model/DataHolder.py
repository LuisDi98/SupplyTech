from PySide6.QtCore import QObject, Signal, Property

class DataHolder(QObject):
    listaChanged = Signal()

    def __init__(self, lista):
        QObject.__init__(self)
        self._lista = lista

    def getLista(self):
        return self._lista

    lista = Property(list, getLista, notify=listaChanged)
