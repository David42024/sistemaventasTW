from seguridad.views import acceder,homePage,salir

from django.urls import path

from django.contrib.auth import views 


urlpatterns = [
    path('', acceder, name="login"),
    path('home/',homePage ,name="home"),
    path('logout/',salir,name="logout"),
]
