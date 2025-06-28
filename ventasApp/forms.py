from django import forms 
from django.forms import fields 
from .models import Categoria , Cliente, Producto, Unidad, CabeceraVenta
class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['descripcion', 'estado']

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ['ruc_dni', 'nombres', 'direccion', 'email', 'estado']

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = ['descripcion', 'categoria', 'precio', 'stock', 'unidad', 'estado']

class UnidadForm(forms.ModelForm):
    class Meta:
        model = Unidad
        fields = ['descripcion', 'estado']

class VentaForm(forms.ModelForm):
    class Meta:
        model = CabeceraVenta
        fields = ['fecha_venta', 'tipo', 'nrodoc', 'cliente']