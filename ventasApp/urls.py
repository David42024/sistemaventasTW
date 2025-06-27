from .views import listarcategoria, agregarcategoria, editarcategoria, eliminarcategoria
from .views import listarcliente, agregarcliente, editarcliente, eliminarcliente
from .views import listarunidad, agregarunidad, editarunidad, eliminarunidad
from .views import listarproducto, agregarproducto, editarproducto, eliminarproducto

from django.urls import path

urlpatterns = [
#Categoria

    path('listacategoria/',listarcategoria,name="listarcategoria"), 
    path('agregarcategoria/',agregarcategoria ,name="agregarcategoria"),
    path('editarcategoria/<int:id>/',editarcategoria ,name="editarcategoria"),
    path('eliminarcategoria/<int:id>/',eliminarcategoria, name="eliminarcategoria"),

    #Cliente

    path('listarcliente/',listarcliente,name="listarcliente"),  
    path('agregarcliente/',agregarcliente ,name="agregarcliente"),
    path('editarcliente/<int:id>/',editarcliente ,name="editarcliente"),
    path('eliminarcliente/<int:id>/',eliminarcliente ,name="eliminarcliente"),


    #Unidad

    path('listarunidad/',listarunidad,name="listarunidad"), 
    path('agregarunidad/',agregarunidad ,name="agregarunidad"), 
    path('editarunidad/<int:id>/',editarunidad ,name="editarunidad"),
    path('eliminarunidad/<int:id>/',eliminarunidad ,name="eliminarunidad"),
    #Producto

    path('listarproducto/',listarproducto,name="listarproducto"),
    path('agregarproducto/',agregarproducto ,name="agregarproducto"),
    path('editarproducto/<int:id>/',editarproducto ,name="editarproducto"),
    path('eliminarproducto/<int:id>/',eliminarproducto, name="eliminarproducto"),
]