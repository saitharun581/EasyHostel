# Generated by Django 3.2.7 on 2022-07-25 07:16

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='UserHostelBookingModel',
            fields=[
                ('booking_id', models.AutoField(primary_key=True, serialize=False)),
                ('hostel_id', models.IntegerField(null=True)),
                ('user_id', models.IntegerField(null=True)),
                ('fullname', models.CharField(max_length=100)),
                ('profilepic', models.ImageField(null=True, upload_to='images/')),
                ('fathername', models.CharField(max_length=100)),
                ('phone_no', models.CharField(max_length=100)),
                ('aadhar_no', models.CharField(max_length=100)),
                ('aadharpic', models.ImageField(null=True, upload_to='images/')),
                ('address', models.TextField(max_length=500)),
                ('status', models.CharField(max_length=100, null=True)),
                ('email', models.CharField(max_length=100, null=True)),
            ],
            options={
                'db_table': 'User_hostel_booking',
            },
        ),
        migrations.CreateModel(
            name='UserProfileModel',
            fields=[
                ('profile_id', models.AutoField(primary_key=True, serialize=False)),
                ('user_id', models.IntegerField(null=True)),
                ('Full_name', models.CharField(max_length=100)),
                ('aadhar', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=100)),
                ('phone_no', models.CharField(max_length=100)),
                ('location', models.CharField(max_length=100)),
                ('image', models.ImageField(null=True, upload_to='images/')),
            ],
            options={
                'db_table': 'user_profile',
            },
        ),
        migrations.CreateModel(
            name='UserRegisterModel',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(max_length=100)),
                ('last_name', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'User_details',
            },
        ),
        migrations.CreateModel(
            name='UserSendFeedbackModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Booking_id', models.IntegerField(null=True)),
                ('Hostel_id', models.IntegerField(null=True)),
                ('Hostel_name', models.CharField(max_length=100, null=True)),
                ('Hostel_owner_name', models.CharField(max_length=100, null=True)),
                ('Hostel_location', models.CharField(max_length=100, null=True)),
                ('Name', models.CharField(max_length=100)),
                ('Feedback', models.TextField(max_length=500)),
            ],
            options={
                'db_table': 'User_feedback',
            },
        ),
    ]
