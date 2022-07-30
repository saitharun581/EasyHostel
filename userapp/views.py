from django.shortcuts import get_object_or_404, render,redirect
from hostelapp.models import AddHosteldetailosModel
from django.contrib import messages
from hostelapp.serializer import AddHosteldetailosSerializer
from rest_framework.renderers import JSONRenderer
import json
from userapp.models import UserHostelBookingModel, UserProfileModel, UserRegisterModel,UserSendFeedbackModel

# Create your views here.
def user_login(request):
    if request.method == "POST":
        Email=request.POST.get("email")
        Password=request.POST.get("password")
        try:
            check=UserRegisterModel.objects.get(email=Email,password=Password)
            request.session['user_id']=check.user_id
            messages.success(request,"successfully login")

           
            return redirect("user-home")
        except:
            messages.error(request,"invalid login")

    return render(request,'main/user-login.html')

def user_register(request):
    if request.method == "POST":
        Fname=request.POST.get("Fname")
        Lname=request.POST.get("Lname")
        Email=request.POST.get("Email")
        Password=request.POST.get("Password")
        if UserRegisterModel.objects.filter(email=Email).exists():
            messages.error(request,'Email Already Exists....')
        else:
           UserRegisterModel.objects.create(first_name=Fname,last_name=Lname,email=Email,password=Password)
           messages.success(request, "registered successfully")

    return render(request,'main/user-registration.html')

def user_home(request):
    return render(request,'main/user-home.html')

def user_book_hostel(request,id):
    w=AddHosteldetailosModel.objects.filter(hostel_id=id)
    v=AddHosteldetailosModel.objects.get(hostel_id=id)
    hostel_id=v.hostel_id
    user_id=request.session['user_id']
   
    if request.method == "POST" and  request.FILES['profile'] and  request.FILES['aadhar']:
        Fullname=request.POST.get("fullname")
        profilepic=request.FILES['profile']
        fathername=request.POST.get("Fname")
        phone_no=request.POST.get("mobile")
        aadhar_no=request.POST.get("aadhar-no")
        aadharpic=request.FILES['aadhar']
        address=request.POST.get("address")
        email=request.POST.get("email")
        UserHostelBookingModel.objects.create(hostel_id=hostel_id,user_id=user_id,fullname=Fullname,profilepic=profilepic,fathername=fathername,phone_no=phone_no,aadhar_no=aadhar_no,aadharpic=aadharpic,address=address,email=email)
        
    return render(request,'main/user-book-hostel.html',{'w':w})

def user_edit_myprofile(request):
    user_id=request.session['user_id']
    r=UserProfileModel.objects.filter(user_id=user_id)
    if request.method=="POST":
        obj=get_object_or_404(UserProfileModel,user_id=user_id)
        obj.Full_name=request.POST.get("fullname")
        obj.aadhar=request.POST.get("aadhar")
        obj.email=request.POST.get("email")
        obj.phone_no=request.POST.get("phno")
        obj.location=request.POST.get("location")
        obj.save()
    return render(request,'main/user-edit-myprofile.html',{'r':r})

def user_myprofile(request):
    user_id= request.session['user_id']
    if request.method == "POST" and request.FILES["image"]:
        full_name=request.POST.get("fullname")
        mobile=request.POST.get("phno")
        aadhar=request.POST.get("aadhar")
        email=request.POST.get("email")    
        image=request.FILES["image"]
        address=request.POST.get("location")
        UserProfileModel.objects.create(user_id=user_id,Full_name=full_name,phone_no=mobile,aadhar=aadhar,email=email,image=image,location=address)
    return render(request,'main/user-myprofile.html')

def user_search_hostel(request):
    hostel=AddHosteldetailosModel.objects.all()
    serialize=AddHosteldetailosSerializer(hostel,many=True)
    json_data=JSONRenderer().render(serialize.data)
    r=json.loads(json_data)
    for i in r:
        print(i["image1"])
    
    return render(request,'main/user-search-hostel.html',{'w':r})

def user_view_feedback(request,id):
    print(id)
    r=UserSendFeedbackModel.objects.filter(Hostel_id=id)
    print(r)
    print("demo")
    return render(request,'main/user-view-feedback.html',{'k':r})

def user_my_bookings(request):
    user_id=request.session['user_id']
    w=UserHostelBookingModel.objects.filter(user_id=user_id)
    
    return render(request,'main/user-my-bookings.html',{'w':w})

def user_explore_hostel(request,id):
    w=AddHosteldetailosModel.objects.filter(hostel_id=id)
    return render(request,'main/user-explore-hostel.html',{'w':w})

def user_send_feedback(request,id):
    r=UserHostelBookingModel.objects.filter(booking_id=id)
    h=UserHostelBookingModel.objects.get(booking_id=id)
 
    hostel_id=h.hostel_id
    l=AddHosteldetailosModel.objects.get(hostel_id=hostel_id)
    print(hostel_id)
    hostel_name=l.hostelname
    hostel_owner_name=l.hostelownername
    hostel_location=l.hostel_location
    if request.method=="POST":
        booking_id=id
        hostel_id=hostel_id
        hostel_name=hostel_name
        hostel_owner_name=hostel_owner_name
        hostel_location= hostel_location
        name=request.POST.get("Fname")
        feedback=request.POST.get("feedback")
        UserSendFeedbackModel.objects.create(Booking_id=booking_id,Hostel_id=hostel_id,Hostel_name=hostel_name,Hostel_owner_name=hostel_owner_name,Hostel_location=hostel_location,Name=name,Feedback=feedback)
    
    return render(request,'main/user-send-feedback.html',{'r':r})







