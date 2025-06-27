from django.shortcuts import render, redirect
from ventasApp.models import Categoria , Cliente, Producto, Unidad
from django.db.models import Q 
from .forms import CategoriaForm, ClienteForm, ProductoForm, UnidadForm
from django.contrib import messages
from django.core.paginator import Paginator

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
    context={"form":form}     
    return render(request,"producto/editar.html",context) 

def eliminarproducto(request,id):   
    producto=Producto.objects.get(idproducto=id)     
    descripcion = producto.descripcion
    producto.estado=False     
    producto.save()       
    messages.success(request, 'Producto eliminado correctamente')
    return redirect("listarproducto")  