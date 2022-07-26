from rest_framework import serializers 


class AddHosteldetailosSerializer(serializers.Serializer):
    hostel_id=serializers.IntegerField()
    hostelname=serializers.CharField(max_length=100)
    hostelownername=serializers.CharField(max_length=100)
    contact=serializers.IntegerField()
    email=serializers.CharField(max_length=100)
    hostel_location=serializers.CharField(max_length=500)
    hostel_description=serializers.CharField(max_length=500)
    wifi=serializers.CharField(max_length=100)
    water=serializers.CharField(max_length=100)
    beds=serializers.CharField(max_length=100)
    image1=serializers.ImageField()
    image2=serializers.ImageField()
    image3=serializers.ImageField()
    image4=serializers.ImageField()
    price=serializers.CharField(max_length=100)
    rooms=serializers.CharField(max_length=100)
    staff=serializers.CharField(max_length=100)
    users=serializers.CharField(max_length=100)
    status=serializers.CharField(max_length=100)