# This Python file uses the following encoding: utf-8


class PickingManager:
    def __init__(self):
        self.routes = dict()
    
    def pickRoute(self, route):
        pass
    
    def filterProducts(self, criteria, data):
        return data.filter(criteria)

    def sortProducts(self, criteria, data):
        data.sort(criteria)

    def extractRoutes(self, data):
        for row in data:
            self.routes[row.route] = self.filterProducts(row.route, data)
        return self.routes

    def printRoutes(self):
        for route in self.routes.keys():
            print(self.routes[route])
