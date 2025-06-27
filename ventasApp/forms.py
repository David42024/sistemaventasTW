from django import forms 
from django.forms import fields 
from .models import Categoria , Cliente, Producto, Unidad
class CategoriaForm(forms.ModelForm):  
    class Meta:   
        model=Categoria         
        fields=['descripcion','estado']  

class ClienteForm(forms.ModelForm):
    class Meta:
        model=Cliente
        fields = ['nombres', 'apellidos', 'direccion', 'email', 'telefono', 'estado']

class ProductoForm(forms.ModelForm):
    class Meta:
        model=Producto
        fields = ['descripcion', 'categoria', 'precio', 'cantidad', 'unidad', 'estado']

class UnidadForm(forms.ModelForm):
    class Meta:
        model=Unidad
        fields = ['descripcion', 'estado']

        