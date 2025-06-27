from django.db import models

class Cliente(models.Model):
    idcliente = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=40)
    apellidos = models.CharField(max_length=40)
    direccion = models.CharField(max_length=50)
    email = models.EmailField()
    telefono = models.CharField(max_length=15)
    estado = models.BooleanField(default=True)
    def __str__(self):
        return self.nombres
    
class Categoria(models.Model):
    idcategoria = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=30, unique=True)
    estado = models.BooleanField(default=True)
    
    def __str__(self):
        return str(self.descripcion)
    
    class Meta:
        verbose_name = "Categoría"          
        verbose_name_plural = "Categorías"   
        ordering = ['descripcion']           
    
class Unidad(models.Model):
    idunidad = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=30, unique=True)
    estado = models.BooleanField(default=True)
    
    def __str__(self):
        return str(self.descripcion)


class Producto(models.Model):
    idproducto = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=40, unique=True)
    categoria = models.ForeignKey(
        Categoria,
        on_delete=models.CASCADE,
        db_column='idcategoria'
    )
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cantidad = models.IntegerField()
    unidad = models.ForeignKey(
        Unidad,
        on_delete=models.CASCADE,
        db_column='idunidad'
    )
    estado = models.BooleanField(default=True)
    
    def __str__(self):
        return str(self.descripcion)