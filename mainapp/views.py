from django.shortcuts import render,redirect

# Create your views here.

def main_home(request):
    return render(request,'main/main-home.html')

def main_about(request):
    return render(request,'main/main-about.html')

def main_contact(request):
    return render(request,'main/main-contact.html')

def main_services(request):
    return render(request,'main/main-services.html')
