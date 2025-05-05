"""authentication URL Configuration

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
from . import views
from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('',views.first),
    path('index',views.index),
    path('reg/regist',views.regist),
    path('logint',views.logint),
    path('logout/',views.logout),
    path('show',views.show),
    path('add_file',views.add_file),
    path('reg/',views.reg),
    path('prof',views.prof),
    path('reg/register_image_authentication',views.register_image_authentication),
    path('otp_verification/login_image_authentication',views.login_image_authentication,name="login_image_authentication"),
    path('receive_file',views.receive_file),
    path('otp_verification/<str:email>',views.otp_verification,name='otp_verification'),
    path('files',views.files,name="files"),
    path('upload2/',views.upload2),
    path('upload2/addupload',views.addupload),
    path('update/<int:id>',views.update),
    path('update/addupdate/<int:id>',views.addupdate),
    path('feedback',views.feedback),
    path('addfeedback',views.addfeedback),
    path('viewfeedback',views.viewfeedback),
    path('about',views.about),
    path('howitworks/', views.howitworks),
    path('faq',views.faq),
    path('contactsupport',views.contactsupport),
    path('securitytips',views.securitytips),
    path('chat',views.chat, name="chat"),
    path('get_bot_response/', views.get_bot_response, name='get_bot_response'),
   
    path('upload22/',views.upload22),
    path('upload22/addupload2',views.addupload2),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
