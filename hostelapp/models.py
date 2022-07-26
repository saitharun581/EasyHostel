from django.db import models

# Create your models here.
class HostelOwnerRegisterModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    first_name=models.CharField(max_length=100)
    last_name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    
    class Meta:
        db_table="Hostel_owner_details"
        
class HostelOwnerProfileModel(models.Model):
    prof_id=models.AutoField(primary_key=True)
    user_id=models.IntegerField(null=True)
    full_name=models.CharField(max_length=100)
    mobile=models.BigIntegerField()
    address=models.TextField(max_length=500)
    
    class Meta:
        db_table="hostel_owner_profile"
    
    
    
class AddHosteldetailosModel(models.Model):
    hostel_id=models.AutoField(primary_key=True)
    hostelname=models.CharField(max_length=100)
    hostelownername=models.CharField(max_length=100)
    contact=models.BigIntegerField(null=True)
    email=models.CharField(max_length=100,null=True)
    hostel_location=models.TextField(max_length=500)
    hostel_description=models.TextField(max_length=500,null=True)
    wifi=models.CharField(max_length=100)
    water=models.CharField(max_length=100)
    beds=models.CharField(max_length=100)
    image1=models.ImageField(upload_to="images/",null=True)
    image2=models.ImageField(upload_to="images/",null=True)
    image3=models.ImageField(upload_to="images/",null=True)
    image4=models.ImageField(upload_to="images/",null=True)
    price=models.CharField(max_length=100)
    rooms=models.CharField(max_length=100)
    staff=models.CharField(max_length=100)
    users=models.CharField(max_length=100)
    status=models.CharField(max_length=100,null=True)
    
    class Meta:
        db_table="add_hostel_details"
    

    
