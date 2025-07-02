from django.shortcuts import render, redirect
from ventasApp.models import Categoria , Cliente, Producto, Unidad, CabeceraVenta, Tipo, Parametro, DetalleVenta
from django.utils.dateparse import parse_date
from django.db.models import Q, F
from .forms import CategoriaForm, ClienteForm, ProductoForm, UnidadForm
from django.contrib import messages
from django.core.paginator import Paginator
from django.db import transaction
from django.http import JsonResponse
from datetime import date

# Create your views here.  

#CATEGORIA

def listarcategoria(request):  
    queryset=request.GET.get("buscar", "")     
    categoria=Categoria.objects.filter(estado=True)     
    if queryset:  
        categoria=Categoria.objects.filter(Q(descripcion__icontains=queryset),estado=True).distinct()     

    paginator = Paginator(categoria, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    context={'categoria':page_obj, 'buscar': queryset}     
    return render(request,"categoria/listar.html",context)  

def agregarcategoria(request):     
    if request.method=="POST":  
        form=CategoriaForm(request.POST)         
        if form.is_valid():  
            form.save()             
            messages.success(request, 'Categoría agregada correctamente')
            return redirect("listarcategoria")    
    else:  
        form=CategoriaForm()  

    context={'form':form}     
    return render(request,"categoria/agregar.html",context)  

def editarcategoria(request,id):  
    categoria=Categoria.objects.get(idcategoria=id)     
    if request.method=="POST":  
        form=CategoriaForm(request.POST,instance=categoria)         
        if form.is_valid():              
            form.save()          
            messages.success(request, 'Categoría editada correctamente')   
            return redirect("listarcategoria")     
    else:  
        form=CategoriaForm(instance=categoria)  
    
    context={"form":form}     
    return render(request,"categoria/editar.html",context)  

def eliminarcategoria(request,id):  
    categoria=Categoria.objects.get(idcategoria=id)     
    descripcion = categoria.descripcion 

    #productos = Producto.objects.filter(categoria=categoria)
    #for producto in productos:
      #  producto.estado = False
       # producto.save()

    categoria.estado=False     
    categoria.save()      
    messages.success(request, 'Categoría eliminada correctamente')
    return redirect("listarcategoria")  


#CLIENTE

def listarcliente(request):  
    queryset=request.GET.get("buscar", "")   
    cliente=Cliente.objects.filter(estado=True)     
    if queryset:  
        cliente=Cliente.objects.filter(Q(nombres__icontains=queryset),estado=True).distinct()    
        
    paginator = Paginator(cliente, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context={'cliente':page_obj, 'buscar': queryset}     
    return render(request,"cliente/listar.html",context)  

def agregarcliente(request):     
    if request.method=="POST":  
        form=ClienteForm(request.POST)         
        if form.is_valid():  
            form.save()             
            messages.success(request, 'Cliente agregado correctamente')
            return redirect("listarcliente")    
    else:  
        form=ClienteForm()  

    context={'form':form}     
    return render(request,"cliente/agregar.html",context)  

def editarcliente(request,id):  
    cliente=Cliente.objects.get(idcliente=id)     
    if request.method=="POST":  
        form=ClienteForm(request.POST,instance=cliente)         
        if form.is_valid():              
            form.save()          
            messages.success(request, 'Cliente editado correctamente')   
            return redirect("listarcliente")     
    else:  
        form=ClienteForm(instance=cliente)  
    
    context={"form":form}     
    return render(request,"cliente/editar.html",context)  

def eliminarcliente(request,id):  
    cliente=Cliente.objects.get(idcliente=id)     
    nombres = cliente.nombres 
    apellidos = cliente.apellidos
    cliente.estado=False     
    cliente.save()       
    messages.success(request, 'Cliente eliminado correctamente')
    return redirect("listarcliente")  


#UNIDAD

def listarunidad(request):   
    queryset=request.GET.get("buscar", "")   
    unidad=Unidad.objects.filter(estado=True)     
    if queryset:  
        unidad=Unidad.objects.filter(Q(descripcion__icontains=queryset),estado=True).distinct()     

    paginator = Paginator(unidad, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context={'unidad':page_obj, 'buscar': queryset}     
    return render(request,"unidad/listar.html",context) 

def agregarunidad(request):     
    if request.method=="POST":  
        form=UnidadForm(request.POST)         
        if form.is_valid():  
            form.save()             
            messages.success(request, 'Unidad agregada correctamente')
            return redirect("listarunidad")    
    else:  
        form=UnidadForm()  

    context={'form':form}     
    return render(request,"unidad/agregar.html",context)  

def editarunidad(request,id):  
    unidad=Unidad.objects.get(idunidad=id)     
    if request.method=="POST":  
        form=UnidadForm(request.POST,instance=unidad)         
        if form.is_valid():              
            form.save()          
            messages.success(request, 'unidad editada correctamente')   
            return redirect("listarunidad")     
    else:  
        form=UnidadForm(instance=unidad)  
    
    context={"form":form}     
    return render(request,"unidad/editar.html",context)  

def eliminarunidad(request,id):  
    unidad=Unidad.objects.get(idunidad=id)    
    descripcion = unidad.descripcion 
    unidad.estado=False     
    unidad.save()       
    messages.success(request, 'Unidad eliminada correctamente')
    return redirect("listarunidad")  

#PRODUCTO

def listarproducto(request):  
    queryset=request.GET.get("buscar", "")   
    producto=Producto.objects.filter(estado=True)     
    if queryset:  
        producto=Producto.objects.filter(Q(descripcion__icontains=queryset),estado=True).distinct()     

    paginator = Paginator(producto, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context={'producto':page_obj, 'buscar': queryset}     
    return render(request,"producto/listar.html",context)  

def agregarproducto(request):
    if request.method=="POST":  
        form=ProductoForm(request.POST)         
        if form.is_valid():  
            form.save()             
            messages.success(request, 'Producto agregado correctamente')
            return redirect("listarproducto")    
    else:  
        form=ProductoForm() 
        form.fields['categoria'].queryset = Categoria.objects.filter(estado=1)
        form.fields['unidad'].queryset = Unidad.objects.filter(estado=1) 
    context={'form':form}     
    return render(request,"producto/agregar.html",context) 

def editarproducto(request,id):
    producto=Producto.objects.get(idproducto=id)     
    if request.method=="POST":  
        form=ProductoForm(request.POST,instance=producto)         
        if form.is_valid():              
            form.save()          
            messages.success(request, 'Producto editado correctamente')   
            return redirect("listarproducto")     
    else:  
        form=ProductoForm(instance=producto)  
        form.fields['categoria'].queryset = Categoria.objects.filter(estado=1)
        form.fields['unidad'].queryset = Unidad.objects.filter(estado=1)
    context={"form":form}     
    return render(request,"producto/editar.html",context) 

def eliminarproducto(request,id):   
    producto=Producto.objects.get(idproducto=id)     
    descripcion = producto.descripcion
    producto.estado=False     
    producto.save()       
    messages.success(request, 'Producto eliminado correctamente')
    return redirect("listarproducto")  


#VENTA

def listarventa(request):  
    queryset=request.GET.get("buscar", "")   
    venta=CabeceraVenta.objects.filter(estado=True)     
    if queryset:  
        venta=CabeceraVenta.objects.filter(Q(tipo__descripcion__icontains=queryset),estado=True).distinct()     

    paginator = Paginator(venta, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context={'venta':page_obj, 'buscar': queryset}     
    return render(request,"venta/listar.html",context)  

@transaction.atomic
def agregarventa(request):
    if request.method == "POST":
        try:
            with transaction.atomic():
                # VALIDACIONES INICIALES
                if not request.POST.get("idcliente"):
                    messages.error(request, "Debe seleccionar un cliente")
                    return redirect("agregarventa")
                
                if not request.POST.get("seltipo"):
                    messages.error(request, "Debe seleccionar un tipo de documento")
                    return redirect("agregarventa")
                
                # Validar que hay productos
                ids = request.POST.getlist("cod_producto[]")
                if not ids:
                    messages.error(request, "Debe agregar al menos un producto")
                    return redirect("agregarventa")

                # Cliente
                idcliente_raw = request.POST["idcliente"]
                cliente_id = idcliente_raw.split("_")[0]
                cliente = Cliente.objects.get(pk=cliente_id)

                # Cabecera
                venta = CabeceraVenta()
                venta.cliente = cliente
                venta.nrodoc = request.POST["nrodoc"]
                idtipo= request.POST["seltipo"]
                venta.tipo_id = idtipo

                # Fecha
                fecha_str = request.POST["fecha"]
                venta.fecha_venta = parse_date("-".join(fecha_str.split("/")[::-1]))
                venta.estado = True

                total_raw = request.POST["total"]
                total = float(total_raw.replace(",", ""))

                # Totales según tipo
                if request.POST["seltipo"] == "2":
                    venta.total = total
                    venta.subtotal = 0
                    venta.igv = 0
                else:
                    venta.total = total
                    venta.subtotal = round(total / 1.18, 2)
                    venta.igv = round(total - venta.subtotal, 2)

                venta.save()

                # Detalles
                #en las validaciones iniciales obtiene los productos
                cantidades = request.POST.getlist("cantidad[]")
                precios = request.POST.getlist("pventa[]")

                if len(ids) != len(cantidades) or len(ids) != len(precios):
                    raise Exception("Error en los datos de productos")

                for i in range(len(ids)):
                    try:
                        idproducto = int(ids[i])
                        cantidad = float(cantidades[i])
                        precio = float(precios[i])

                        producto = Producto.objects.get(pk=idproducto)
                        if producto.stock < cantidad:
                            raise Exception(f"Stock insuficiente para {producto.descripcion}")

                        detalle = DetalleVenta()
                        detalle.venta = venta
                        detalle.producto = producto
                        detalle.cantidad = cantidad
                        detalle.precio = precio
                        detalle.save()

                        # Actualizar stock
                        Producto.objects.filter(pk=idproducto).update(
                            stock=F("stock") - cantidad
                        )

                    except ValueError:
                        raise Exception(f"Datos inválidos en producto {i+1}")

                # Actualizar número de serie y numeración

                parametro = Parametro.objects.get(tipo_id=idtipo)
                numeracion_actual = parametro.numeracion
                
                nuevo_numero = int(numeracion_actual) + 1
                nueva_numeracion = f"{nuevo_numero:05d}"
                
                parametro.numeracion = nueva_numeracion
                parametro.save()

                # Mensaje éxito
                messages.success(request, "Venta registrada correctamente.")
                return redirect("listarventa")

        except Exception as e:
            transaction.set_rollback(True)
            messages.error(request, f"Ocurrió un error al registrar la venta: {str(e)}")
            return redirect("listarventa")
    else:
        clientes = Cliente.objects.filter(estado=1)
        productos = Producto.objects.filter(estado=1)
        tipos = Tipo.objects.filter(estado=1)
        parametros = Parametro.objects.all()  # o el que corresponda
        context = {
            "clientes": clientes,
            "productos": productos,
            "tipos": tipos,
            "parametros": parametros,
            "fecha_actual": date.today().strftime("%d/%m/%Y"),
        }
        return render(request, "venta/agregar.html", context)

def eliminarventa(request, id):   
    try:
        venta = CabeceraVenta.objects.get(pk=id)    

        detalles = DetalleVenta.objects.filter(venta=venta)
        for detalle in detalles:
            Producto.objects.filter(pk=detalle.producto_id).update(
                stock=F('stock') + detalle.cantidad
            )
        venta.estado = False     
        venta.save()       
        messages.success(request, 'Venta eliminada correctamente.')
        return redirect("listarventa")
    except Exception as e:
        messages.error(request, f'Ocurrió un error: {str(e)}')
        return redirect("listarventa")

def ProductoCodigo(request, producto_id):
    producto = (
        Producto.objects
        .filter(estado=True, idproducto=producto_id)
        .values(
            'idproducto',
            'descripcion',
            'unidad__descripcion',
            'precio',
            'stock'
        )
        .first()
    )
    return JsonResponse([{
        "idproducto": producto["idproducto"],
        "unidad": producto["unidad__descripcion"],
        "descripcion": producto["descripcion"],
        "precio": producto["precio"],
        "stock": producto["stock"]
    }], safe=False)


def PorTipo(request, tipo_id):
    parametro = (
        Parametro.objects.filter(tipo__idtipo=tipo_id).values(
            'tipo__idtipo',
            'tipo__descripcion',
            'serie',
            'numeracion'
        ).first()
    )
    return JsonResponse([{
        "idtipo" : parametro["tipo__idtipo"],
        "descripcion": parametro["tipo__descripcion"],
        "serie": parametro["serie"],
        "numeracion": parametro["numeracion"]
    }], safe=False)