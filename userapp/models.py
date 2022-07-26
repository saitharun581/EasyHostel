from asyncio.windows_events import NULL
from pyexpat import model
from django.db import models

# Create your models here.
class UserRegisterModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    first_name=models.CharField(max_length=100)
    last_name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    
    class Meta:
        db_table="User_details"
        
        
class UserProfileModel(models.Model):
    profile_id=models.AutoField(primary_key=True)
    user_id=models.IntegerField(null=True)
    Full_name=models.CharField(max_length=100)
    aadhar=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone_no=models.CharField(max_length=100)
    location=models.CharField(max_length=100)
    image=models.ImageField(upload_to="images/",null=True)
    
    class Meta:
        db_table="user_profile"
        

class UserHostelBookingModel(models.Model):
    booking_id=models.AutoField(primary_key=True)
    hostel_id=models.IntegerField(null=True)
    user_id=models.IntegerField(null=True)
    fullname=models.CharField(max_length=100)
    profilepic=models.ImageField(upload_to="images/",null=True)
    fathername=models.CharField(max_length=100)
    phone_no=models.CharField(max_length=100)
    aadhar_no=models.CharField(max_length=100)
    aadharpic=models.ImageField(upload_to="images/",null=True)
    address=models.TextField(max_length=500)
    status=models.CharField(max_length=100,null=True)
    email=models.CharField(max_length=100,null=True)
    
    class Meta:
        db_table="User_hostel_booking"
    
class UserSendFeedbackModel(models.Model):
    Booking_id=models.IntegerField(null=True)
    Hostel_id=models.IntegerField(null=True)
    Hostel_name=models.CharField(max_length=100,null=True)
    Hostel_owner_name=models.CharField(max_length=100,null=True)
    Hostel_location=models.CharField(max_length=100,null=True)
    
    Name=models.CharField(max_length=100)
    Feedback=models.TextField(max_length=500)
    
    class Meta:
        db_table="User_feedback"    


