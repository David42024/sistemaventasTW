from django.shortcuts import redirect, render
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages 
from django.views import generic 
from django.contrib.auth.models import User


def acceder(request):
    if request.method == "POST":
        form = AuthenticationForm(request, data=request.POST)
        username = request.POST.get("username")
        password = request.POST.get("password")

        if not username or not password:
            messages.error(request, "Por favor, completa todos los campos.")
        elif not User.objects.filter(username=username).exists():
            messages.error(request, "El usuario no existe.")
        else:
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                messages.success(request, "¡Sesión Iniciada Correctamente :D!") 
                return redirect("home")
            else:
                messages.error(request, "La contraseña es incorrecta.")
    else:
        form = AuthenticationForm()
    
    return render(request, "login.html", {"form": form})

def homePage(request):
    context = {
    }
    return render(request, "bienvenido.html", context)

def salir(request):     
    logout(request)     
    messages.info(request,"Saliste exitosamente")     
    return redirect("login") 