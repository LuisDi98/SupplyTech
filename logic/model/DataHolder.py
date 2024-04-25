from PySide6.QtCore import QObject, Signal, Property

class DataHolder(QObject):
    listaChanged = Signal()

    def __init__(self, lista):
        """
        Constructor de la clase DataHolder
        self._lista: lista de datos
        self._index: indice de la lista
        self._showMap: variable booleana para mostrar el mapa
        Signal: Señal que se emite cuando se cambia el indice
        Signal: Señal que se emite cuando se cambia el valor de showMap
        Property: Propiedad de la lista
        """
        QObject.__init__(self)
        self._lista = lista
        self._index = 0
        self._showMap = False


    def getLista(self):
        return self._lista
    
    """
    Implementar un metodo setShowMap para el siguiente QML:
    onClicked: {
        var index = dataHolder.getLista.indexOf(modelData)
        dataHolder.setIndex(index)
        dataHolder.setShowMap(true)
                }
    """
    
    def getIndex(self):
        return self._index
    
    def getShowMap(self):
        """
        Retorna el valor de la variable showMap 
        """
        return self._showMap

    def setIndex(self, index):
        self._index = index
        self.indexChanged.emit()

    def setShowMap(self, showMap):
        self._showMap = showMap
        self.showMapChanged.emit()

    def setLista(self, lista):
        self._lista = lista
        self.listaChanged.emit()

    indexChanged = Signal()
    showMapChanged = Signal()
    lista = Property(list, getLista, notify=listaChanged)
