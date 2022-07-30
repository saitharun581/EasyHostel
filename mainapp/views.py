from django.shortcuts import get_object_or_404, render,redirect,HttpResponse
from hostelapp.models import AddHosteldetailosModel
from django.contrib import messages
from hostelapp.serializer import AddHosteldetailosSerializer
from rest_framework.renderers import JSONRenderer
import json
from userapp.models import UserHostelBookingModel, UserProfileModel, UserRegisterModel,UserSendFeedbackModel


# Create your views here.

def main_home(request):
    return render(request,'main/main-home.html')

def main_about(request):
    return render(request,'main/main-about.html')

def main_contact(request):
    return render(request,'main/main-contact.html')

def main_services(request):
    return render(request,'main/main-services.html')

def main_api(request):
    
    return render(request,'main/main-api.html')

def main_json(request):
    hostel=AddHosteldetailosModel.objects.all()
    serialize=AddHosteldetailosSerializer(hostel,many=True)
    json_data=JSONRenderer().render(serialize.data)
    
    return HttpResponse(json_data,content_type='application/json')