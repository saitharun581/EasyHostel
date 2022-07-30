"""EasyHostel URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as main_views
from userapp import views as user_views
from adminapp import views as admin_views
from hostelapp import views as hostel_views
from django.conf.urls.static import static
from django.conf import settings



urlpatterns = [
    path('admin/', admin.site.urls),
    #main
    path('',main_views.main_home,name='home'),
    path('about',main_views.main_about,name='about'),
    path('contact',main_views.main_contact,name='contact'),
    path('services',main_views.main_services,name='services'),
    path('api',main_views.main_api,name='api'),
    path('json',main_views.main_json,name='json'),

    
    #admin
    path('admin-login',admin_views.admin_login,name='admin-login'),
    path('admin-home',admin_views.admin_home,name='admin-home'),
    path('admin-hostel-bookings',admin_views.admin_hostel_bookings,name='admin-hostel-bookings'),
    path('admin-hostel-owners-profile',admin_views.admin_hostel_owners_profile,name='admin-hostel-owners-profile'),
    path('admin-hostel-owners-profile-details/<int:id>/',admin_views.admin_hostel_owners_profile_details,name='admin-hostel-owners-profile-details'),
    path('admin-view-hostels',admin_views.admin_view_hostels,name='admin-view-hostels'),
    path('admin-view-hostel-details',admin_views.admin_view_hostel_details,name='admin-view-hostel-details'),
    path('admin-view-feedbacks',admin_views.admin_view_feedbacks,name='admin-view-feedbacks'),
    path('admin-view-users',admin_views.admin_view_users,name='admin-view-users'),

    # ADMIN accept or reject
    path('admin_view_accept/<int:id>/',admin_views.admin_view_accept,name='admin_view_accept'),
    path('admin_view_reject/<int:id>/',admin_views.admin_view_reject,name='admin_view_reject'),


    
    
    
    #user
    path('user-home',user_views.user_home,name='user-home'),
    path('user-register',user_views.user_register,name='user-register'),
    path('user-login',user_views.user_login,name='user-login'),
    path('user-book-hostel/<int:id>/',user_views.user_book_hostel,name='user-book-hostel'),
    path('user-edit-myprofile',user_views.user_edit_myprofile,name='user-edit-myprofile'),
    path('user-myprofile',user_views.user_myprofile,name='user-myprofile'),
    path('user-search-hostel',user_views.user_search_hostel,name='user-search-hostel'),
    path('user-view-feedback/<int:id>/',user_views.user_view_feedback,name='user-view-feedback'),
    path('user-send-feedback/<int:id>/',user_views.user_send_feedback,name='user-send-feedback'),

    path('user-my-bookings',user_views.user_my_bookings,name='user-my-bookings'),
    path('user-explore-hostel/<int:id>/',user_views.user_explore_hostel,name='user-explore-hostel'),
     
    #hostel
    #hostel registration not yet created
    path('hostel-owner-login',hostel_views.hostel_owner_login,name='hostel-owner-login'),
    path('hostel-owner-registration',hostel_views.hostel_owner_registration,name='hostel-owner-registration'),
    path('hostel-home',hostel_views.hostel_home,name='hostel-home'),
    path('hostel-add-profile',hostel_views.hostel_add_profile,name='hostel-add-profile'),
    path('hostel-edit-profile',hostel_views.hostel_edit_profile,name='hostel-edit-profile'),
    path('my-hostel-booking',hostel_views.my_hostel_booking,name='my-hostel-booking'),
    path('my-hostel-booking-details/<int:id>/',hostel_views.my_hostel_booking_details,name='my-hostel-booking-details'),
    path('my-hostel-feedback',hostel_views.my_hostel_feedback,name='my-hostel-feedback'),
    path('add-hostel-details',hostel_views.add_hostel_details,name='add-hostel-details'),
    
    # hostel booking accept or reject
    path('hostel_view_accept/<int:id>/',hostel_views.hostel_view_accept,name='hostel_view_accept'),
    path('hostel_view_reject/<int:id>/',hostel_views.hostel_view_reject,name='hostel_view_reject'),


 
]
urlpatterns+= static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)