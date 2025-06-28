from django.db import models

class Cliente(models.Model):
    idcliente = models.AutoField(primary_key=True)
    ruc_dni = models.CharField(max_length=11, unique=True)
    nombres = models.CharField(max_length=80)
    direccion = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    estado = models.BooleanField(default=True)
    def __str__(self):
        return self.nombres
    class Meta:
        db_table = 'clientes'
    
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
        db_table = 'categorias'           
    
class Unidad(models.Model):
    idunidad = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=30, unique=True)
    estado = models.BooleanField(default=True)
    
    class Meta:
        db_table = 'unidades'

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
    stock = models.IntegerField()
    unidad = models.ForeignKey(
        Unidad,
        on_delete=models.CASCADE,
        db_column='idunidad'
    )
    estado = models.BooleanField(default=True)
    
    class Meta:
        db_table = 'productos'

    def __str__(self):
        return str(self.descripcion)
    
class Tipo(models.Model):
    idtipo = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=20, unique=True)
    estado = models.BooleanField(default=True)
    class Meta:
        db_table = 'tipos'

class Parametro(models.Model):
    tipo = models.OneToOneField(
        Tipo,
        on_delete=models.CASCADE,
        db_column='idtipo',
        primary_key=True
    )
    numeracion = models.CharField(max_length=15, unique=True)
    serie = models.CharField(max_length=3)
    class Meta:
        db_table = 'parametros'


class CabeceraVenta(models.Model):
    idventa = models.AutoField(primary_key=True)
    cliente = models.ForeignKey(
        Cliente,
        on_delete=models.CASCADE,
        db_column='idcliente'
    )
    fecha_venta = models.DateField()
    tipo = models.ForeignKey(
        Tipo,
        on_delete=models.CASCADE,
        db_column='idtipo'
    )
    total = models.FloatField()
    subtotal = models.FloatField()
    igv = models.FloatField()
    nrodoc = models.CharField(max_length=12)
    estado = models.BooleanField(default=True)
    class Meta:
        db_table = 'cabeceraventas'

class DetalleVenta(models.Model):
    pk = models.CompositePrimaryKey("producto", "venta")
    venta = models.ForeignKey(
        CabeceraVenta,
        on_delete=models.CASCADE,
        db_column='idventa'
    )
    producto = models.ForeignKey(
        Producto,
        on_delete=models.CASCADE,
        db_column='idproducto'
    )
    precio = models.FloatField()
    cantidad = models.FloatField()

    class Meta:
        db_table = 'detalleventas'