from django.db.models import F
from .models import Parametro, Producto

def actualizarNumero(tipo_id, numeracion2):
    try:
        Parametro.objects.filter(idtipo=tipo_id).update(numeracion=numeracion2)
        return True
    except Exception:
        return False
    


def actualizarStock(idproducto, cantidadquitada):
    updated = (
        Producto.objects
        .filter(idproducto=idproducto)
        .update(cantidad=F('stock') - cantidadquitada)
    )
    return updated

