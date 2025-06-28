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
            # Cliente
            cliente_id = request.POST["cliente"].split("_")[0]
            cliente = Cliente.objects.get(pk=cliente_id)

            # Cabecera
            venta = CabeceraVenta()
            venta.cliente = cliente
            venta.nrodoc = request.POST["nrodoc"]
            venta.tipo_id = request.POST["tipo"]
            fecha_str = request.POST["fecha_venta"]
            venta.fechaventa = parse_date("-".join(fecha_str.split("/")[::-1]))
            venta.estado = True

            if request.POST["tipo"] == "2":
                venta.total = request.POST["total"]
                venta.subtotal = 0
                venta.igv = 0
            else:
                venta.total = 100
                venta.subtotal = 0
                venta.igv = 0

            venta.save()

            # Detalles
            ids = request.POST.getlist("cod_producto[]")
            cantidades = request.POST.getlist("cantidad[]")
            precios = request.POST.getlist("pventa[]")

            for i in range(len(ids)):
                detalle = DetalleVenta()
                detalle.venta = venta
                detalle.idproducto = ids[i]
                detalle.cantidad = cantidades[i]
                detalle.precio = precios[i]
                detalle.save()

                # Actualizar stock
                Producto.objects.filter(pk=ids[i]).update(stock=F("stock") - cantidades[i])

            # Podrías también actualizar numeración si quieres

            messages.success(request, "Venta registrada correctamente.")
            return redirect("listarventa")
        except Exception as e:
            transaction.set_rollback(True)
            messages.error(request, "Ocurrió un error al registrar la venta.")
            return redirect("agregarventa")

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
    venta = CabeceraVenta.objects.get(pk=id)     
    venta.estado = False     
    venta.save()       
    messages.success(request, 'Venta eliminada correctamente.')
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
        "precio": producto["precio"],
        "stock": producto["stock"]
    }], safe=False)

#Investigar q hace esto XD:

def PorTipo(request, tipo_id):
    parametro = (
        Parametro.objects.filter(tipo__idtipo=tipo_id).values(
            'numeracion'
        ).first()
    )
    return JsonResponse([{"numeracion": parametro["numeracion"]}], safe=False)