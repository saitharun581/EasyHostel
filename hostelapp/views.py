from django.shortcuts import get_object_or_404, render,redirect
from django.core.files import File
from django.contrib import messages
from hostelapp.serializer import AddHosteldetailosSerializer
from hostelapp.models import AddHosteldetailosModel, HostelOwnerProfileModel, HostelOwnerRegisterModel
from userapp.models import UserRegisterModel, UserSendFeedbackModel,UserHostelBookingModel
from django.core.mail import EmailMultiAlternatives
from EasyHostel.settings import DEFAULT_FROM_EMAIL
from django.contrib import messages 
import requests 
# Create your views here.
def hostel_owner_registration(request):
    if request.method == "POST":
        Fname=request.POST.get("Fname")
        Lname=request.POST.get("Lname")
        Email=request.POST.get("Email")
        Password=request.POST.get("Password")
        if HostelOwnerRegisterModel.objects.filter(email=Email).exists():
            messages.error(request,'Email Already Exists....')
        else:
           HostelOwnerRegisterModel.objects.create(first_name=Fname,last_name=Lname,email=Email,password=Password)
           messages.success(request, "registered successfully")        
    return render(request,'main/hostel-owner-registration.html')

def hostel_owner_login(request):
     if request.method == "POST":
        Email=request.POST.get("email")
        Password=request.POST.get("password")
        try:
            check=HostelOwnerRegisterModel.objects.get(email=Email,password=Password)
            request.session['user_id']=check.user_id
            messages.success(request,"successfully login")

           
            return redirect("hostel-home")
        except:
            messages.error(request,"invalid login")

     return render(request,'main/hostel-owner-login.html')

def hostel_home(request):
    user_id=request.session['user_id']
    k=UserSendFeedbackModel.objects.filter(Hostel_id=user_id).count()
    l=UserHostelBookingModel.objects.filter(hostel_id=user_id).count()
    r=HostelOwnerProfileModel.objects.filter(user_id=user_id)
    b=UserRegisterModel.objects.all().count()
    return render(request,'admin/hostel-home.html',{'r':r,'k':k,'l':l,'b':b})

def hostel_add_profile(request):
    user_id=request.session['user_id']
    if request.method == "POST":
        full_name=request.POST.get("Fname")
        mobile=request.POST.get("mobile")
        address=request.POST.get("address")
        HostelOwnerProfileModel.objects.create(user_id=user_id,full_name=full_name,mobile=mobile,address=address)
        
    return render(request,'admin/hostel-add-profile.html')

def hostel_edit_profile(request):
    user_id=request.session['user_id']
    w=HostelOwnerProfileModel.objects.filter(user_id=user_id)
    if request.method=="POST":
        obj=get_object_or_404(HostelOwnerProfileModel,user_id=user_id)
        obj.full_name=request.POST.get("Fname")
        obj.mobile=request.POST.get("mobile")
        obj.address=request.POST.get("address")
        obj.save()
    return render(request,'admin/hostel-edit-profile.html',{'w':w})

def my_hostel_booking(request):
    hostel=request.session['user_id']
    r=UserHostelBookingModel.objects.filter(hostel_id=hostel) 
    return render(request,'admin/my-hostel-booking.html',{'r':r})

def my_hostel_booking_details(request,id):
    k=UserHostelBookingModel.objects.filter(booking_id=id)
    return render(request,'admin/my-hostel-booking-details.html',{'k':k})

def my_hostel_feedback(request):
    hostel=request.session['user_id']
    h=UserSendFeedbackModel.objects.filter(Hostel_id=hostel)
    return render(request,'admin/my-hostel-feedback.html',{'h':h})

def add_hostel_details(request):
    
    if request.method=="POST" and "hostelimage1" in request.FILES and "hostelimage2" in request.FILES and "hostelimage2" in request.FILES and request.FILES["hostelimage4"]:
        hostel_name=request.POST.get("hostelname")
        hostel_owner_name=request.POST.get("hostelownername")
        contact=request.POST.get("contact")
        email=request.POST.get("email")
        hostel_location=request.POST.get("hostellocation")
        hostel_discription=request.POST.get("hosteldesc")
        wifi=request.POST.get("wifi")
        water=request.POST.get("water")
        beds=request.POST.get("beds")
        image1=request.FILES["hostelimage1"]
        image2=request.FILES["hostelimage2"]
        image3=request.FILES["hostelimage3"]
        image4=request.FILES["hostelimage4"]
        price=request.POST.get("price")
        rooms=request.POST.get("totalrooms")
        staff=request.POST.get("staff")
        users=request.POST.get("users")
        AddHosteldetailosModel.objects.create(hostelname=hostel_name,hostelownername=hostel_owner_name,contact=contact,email=email,hostel_location=hostel_location,hostel_description=hostel_discription,wifi=wifi,water=water,beds=beds,image1=image1,image2=image2,image3=image3,image4=image4,price=price,rooms=rooms,staff=staff,users=users)

    return render(request,'admin/add-hostel-details.html')

def hostel_view_accept(request,id):
    print(id)
    print("hi")
    obj=get_object_or_404(UserHostelBookingModel,booking_id=id)
    obj.status="Accepted"
    obj.save()
    #sms code
    mobile=obj.phone_no
    url = "https://www.fast2sms.com/dev/bulkV2"
            # create a dictionary
    my_data = {
            # Your default Sender ID
            'sender_id': 'FSTSMS',            
            # Put your message here!
            'message': str(obj.fullname)+' '+'your Booking has been Accepted by Hostel management',
            'route': 'p',            
            # You can send sms to multiple numbers
            # separated by comma.
            'numbers': mobile,   
        }
            # create a dictionary
    headers = {
            'authorization': 'rgpeKA0SUBNjnHyLTtlc9JYh6XVZdab3FsIo8kMqx7PiWfuvGEYkoyfH7zth14eBDjnO6lQTbNsxwJKZ',
            'Content-Type': "application/x-www-form-urlencoded",
            'Cache-Control': "no-cache"
        }
            # make a post request
    response = requests.request("POST",
                                    url,
                                    data = my_data,
                                    headers = headers)
            # print the send message
    print(response.text)
    # email.code
    html_content=str(obj.fullname)+' '+'your Booking has been Accepted by Hostel management'

        # html_content='<br> <p> Your Application Regarding <strong>'+str(obj.ServiceCategory)+'</strong> is <strong>'+str(obj.status)+' </p>'
    from_mail=DEFAULT_FROM_EMAIL
    to_mail=[obj.email]
    msg= EmailMultiAlternatives("Booking Status",html_content,from_mail,to_mail)
    msg.attach_alternative(html_content,"text/html")
    try:
        msg.send()
    except Exception as e:
        print('error:',e)
        return redirect("/")
    
    return redirect("my-hostel-booking")

def hostel_view_reject(request,id):
    obj=get_object_or_404(UserHostelBookingModel,booking_id=id)
    obj.status="rejected"
    obj.save()
    #sms code
    mobile=obj.phone_no
    url = "https://www.fast2sms.com/dev/bulkV2"
            # create a dictionary
    my_data = {
            # Your default Sender ID
            'sender_id': 'FSTSMS',            
            # Put your message here!
            'message': str(obj.fullname)+' '+'your Booking has been Accepted by Hostel management',
            'route': 'p',            
            # You can send sms to multiple numbers
            # separated by comma.
            'numbers': mobile,   
        }
            # create a dictionary
    headers = {
            'authorization': 'rgpeKA0SUBNjnHyLTtlc9JYh6XVZdab3FsIo8kMqx7PiWfuvGEYkoyfH7zth14eBDjnO6lQTbNsxwJKZ',
            'Content-Type': "application/x-www-form-urlencoded",
            'Cache-Control': "no-cache"
        }
            # make a post request
    response = requests.request("POST",
                                    url,
                                    data = my_data,
                                    headers = headers)
            # print the send message
    print(response.text)
    # email.code
    html_content=str(obj.fullname)+' '+'your Booking has been Rejected by Hostel management'

        # html_content='<br> <p> Your Application Regarding <strong>'+str(obj.ServiceCategory)+'</strong> is <strong>'+str(obj.status)+' </p>'
    from_mail=DEFAULT_FROM_EMAIL
    to_mail=[obj.email]
    msg= EmailMultiAlternatives("Booking Status",html_content,from_mail,to_mail)
    msg.attach_alternative(html_content,"text/html")
    try:
        msg.send()
    except Exception as e:
        print('error:',e)
        return redirect("/")
    
    return redirect("my-hostel-booking")