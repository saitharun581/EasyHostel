from django.shortcuts import get_object_or_404, render,redirect
from hostelapp.models import AddHosteldetailosModel, HostelOwnerRegisterModel
from django.contrib import messages
from django.core.mail import EmailMultiAlternatives
from EasyHostel.settings import DEFAULT_FROM_EMAIL
import requests  

from userapp.models import UserHostelBookingModel, UserRegisterModel, UserSendFeedbackModel

# Create your views here.
def admin_login(request):
    if request.method=="POST":
        email=request.POST.get("email")
        password=request.POST.get("password")

        if email == "admin" and password == "admin":
            messages.success(request,"successfully login")

            return redirect("admin-home")
        else:
            messages.error(request,"invalid login")


    return render(request,'main/admin-login.html')

def admin_home(request):
    w=HostelOwnerRegisterModel.objects.count()
    r=UserRegisterModel.objects.count()
    k=UserHostelBookingModel.objects.count()
    l=UserSendFeedbackModel.objects.count()
    c=UserSendFeedbackModel.objects.all()
    return render(request,'admin/admin-home.html',{'w':w,'r':r,'k':k,'l':l,'c':c})

def admin_hostel_bookings(request):
    w=UserHostelBookingModel.objects.all()
    r=AddHosteldetailosModel.objects.all()
    return render(request,'admin/admin-hostel-bookings.html',{'w':w,'r':r})

def admin_hostel_owners_profile(request):
    w=AddHosteldetailosModel.objects.all()
    return render(request,'admin/admin-hostel-owners-profile.html',{'w':w})

def admin_hostel_owners_profile_details(request,id):
    hostel_id=id
    w=AddHosteldetailosModel.objects.filter(hostel_id=hostel_id)
    return render(request,'admin/admin-hostel-owner-profile-details.html',{'w':w})

def admin_view_hostels(request):
    r=AddHosteldetailosModel.objects.all()
    return render(request,'admin/admin-view-hostels.html',{'r':r})

def admin_view_hostel_details(request):
    return render(request,'admin/admin-view-hostel-details.html')

def admin_view_feedbacks(request):
    w=UserSendFeedbackModel.objects.all()
    return render(request,'admin/admin-view-feedbacks.html',{'w':w})

def admin_view_users(request):
    r=UserRegisterModel.objects.all()
    return render(request,'admin/admin-view-users.html',{'r':r})

def admin_view_accept(request,id):
    print("a")
    
    obj=get_object_or_404(AddHosteldetailosModel,hostel_id=id)
    obj.status="Accepted"
    obj.save()

    # email.code
    html_content=str(obj.hostelownername)+'your'+str(obj.hostelname)+'hostel has been Accepted by Easy Hostel Admin'

        # html_content='<br> <p> Your Application Regarding <strong>'+str(obj.ServiceCategory)+'</strong> is <strong>'+str(obj.status)+' </p>'
    from_mail=DEFAULT_FROM_EMAIL
    to_mail=[obj.email]
    print(to_mail)
    msg= EmailMultiAlternatives("Hostel Acceptance Status",html_content,from_mail,to_mail)
    msg.attach_alternative(html_content,"text/html")
    try:
        msg.send()
    except Exception as e:
        print('error:',e)
        return redirect("admin-hostel-owners-profile")
    
    return redirect("admin-hostel-owners-profile")

def admin_view_reject(request,id):
    obj=get_object_or_404(AddHosteldetailosModel,hostel_id=id)
    obj.status="Rejected"
    obj.save()

    # email.code
    html_content=str(obj.hostelownername)+'your'+str(obj.hostelname)+'hostel has been Rejected by Easy Hostel Admin'

        # html_content='<br> <p> Your Application Regarding <strong>'+str(obj.ServiceCategory)+'</strong> is <strong>'+str(obj.status)+' </p>'
    from_mail=DEFAULT_FROM_EMAIL
    to_mail=[obj.email]
    msg= EmailMultiAlternatives("Hostel Acceptance Status",html_content,from_mail,to_mail)
    msg.attach_alternative(html_content,"text/html")
    try:
        msg.send()
    except Exception as e:
        print('error:',e)
        return redirect("admin-hostel-owners-profile")
    
    return redirect("admin-hostel-owners-profile")






