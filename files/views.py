from django.http import HttpResponse
from django.shortcuts import render
from .models import *
from django.shortcuts import redirect
from  django.core.files.storage import FileSystemStorage
from django.conf import settings
import random
import pycurl
from urllib.parse import urlencode
import os
from tensorflow.keras import backend as k
from ML import test1
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

import chatbot


def chat(request):
    return render(request,'html/chat.html')



def feedback(request):
    return render(request,'html/feedback.html')

@csrf_exempt
def get_bot_response(request):
    if request.method == 'GET':
        message = request.GET.get('message', '')  # Get the 'message' parameter from the query string
        bot_response=chatbot.talk(message,'chatbot_model')[0]
        print("user_response:",message)
        print("bot_response:",bot_response)
        # TODO: Process the 'message' and generate the bot's response
        #bot_response = "Hello, I am a bot. You sent: " + message  # Replace this with your actual bot response logic
        
        response_data = {
            'response': bot_response,
        }
        
        return JsonResponse(response_data)
    else:
        return JsonResponse({'error': 'Invalid request method'}, status=400)




def sends_mail(mail,msg):

	crl = pycurl.Curl()
	crl.setopt(crl.URL, 'https://alc-training.in/gateway.php')
	data = {'email': mail,'msg':msg}
	pf = urlencode(data)

	# Sets request method to POST,
	# Content-Type header to application/x-www-form-urlencoded
	# and data to send in request body.
	crl.setopt(crl.POSTFIELDS, pf)
	crl.perform()
	crl.close()


def first(request):
    return render(request,'html/index.html')

def about(request):
    return render(request,'html/about.html')

def howitworks(request):
    return render(request, 'html/howitworks.html')

def securitytips(request):
    return render(request,'html/securitytips.html')

def faq(request):
    return render(request,'faq.html')

def contactsupport(request):
    return render(request,'html/contactsupport.html')
    
def index(request):
    return render(request,'html/index.html')
def regist(request):
    if request.method=="POST":
        a=request.POST.get('name')
        b=request.POST.get('phone')
        c=request.POST.get('email')
        d=request.POST.get('password')
        f=request.POST.get('category')
        request.session['userdata']=(a,b,c,d,f)
        sell=password_images.objects.filter(category=f)
        return render(request,'html/viewimage.html',{'res':sell})
        #
        #e=register(name=a,phone=b,email=c,password=d,category=f)
        #e.save()
    return render(request,'html/register.html',{'msg':'register successfully'})


def register_image_authentication(request):
    if request.method=="POST":
        post_data = request.POST

        print("POST Data:",post_data)
        image_ids=[key for key, value in post_data.items()][1:-1]
        print("image_ids:",image_ids)

        """ # Loop through the POST values
        for key, value in post_data.items():
            # Do something with each key-value pair
            print(key, value)
            """
        user_data=request.session['userdata']
        print("data:",request.session['userdata'])
        e=register(name=user_data[0],phone=user_data[1],email=user_data[2],password=user_data[3],image_category=user_data[4],image_ids=str(image_ids))
        e.save()
    #print(f)  
    return render(request,'html/index.html')

def reg(request):
    sel= list(set([i.category for i in password_images.objects.all()]))
    print(sel)
    return render(request,'html/register.html',{'res':sel})

def logint(request):
    email=request.POST.get('email')
    password=request.POST.get('password')
    otp=request.POST.get('otp')
    if email=='admin@gmail.com' and password=='admin':
        request.session['admindetails']=email
        request.session['admin'] = 'admin'
        return render(request,'html/index.html')
    elif register.objects.filter(email=email,password=password).exists():
        userdetails=register.objects.get(email=email,password=password)
        
        otp = random.randint(1000, 9999)
        print(otp)
        request.session['otp']=otp
        sends_mail(email,"Your otp is " + str(otp))
        
        return render(request,'html/otp.html',{'email':email})
        request.session['uid']=userdetails.id

        #request.session['uid']=userdetails.id
        #return render(request,'index.html')
    else:
        return render(request,'html/login.html')
        
   
def otp_verification(request,email):
    if request.method == 'POST':
        otp = request.POST.get('otp')
        otp1 = request.session.get('otp')

        if str(otp) == str(otp1):
            userdetails=register.objects.get(email=email)
            #request.session['uid']=userdetails.id
            category=userdetails.image_category
            request.session['image_ids']=userdetails.image_ids
            request.session['usr_email']=userdetails.email
            sell=password_images.objects.filter(category=category)
            return render(request, 'html/addimage.html',{'res':sell})
       
        else:
            return  redirect(logint)

    return render(request,'html/index.html')

def login_image_authentication(request):
    if request.method=="POST":
        post_data = request.POST

        print("POST Data:",post_data)
        image_ids=[key for key, value in post_data.items()][1:-1]
        org_image_ids=eval(request.session['image_ids'])
        email=request.session['usr_email']
        print("image_ids:",image_ids)
        print("org_image_ids:",org_image_ids)

        flg=1
        for i,j in zip(image_ids,org_image_ids):
            print("data",i,j)
            if i!=j:
                flg=0
                break
        print("auth:",flg)
        if flg==1:
            userdetails=register.objects.get(email=email)
            request.session['uid']=userdetails.id
            return render(request,'html/index.html')
        return render(request,'html/index.html',{'imgstatus':'Wrong image choosed'})
              
    return render(request,'html/viewimage.html')

def update(request,id):
    user=register.objects.get(id=id)
    return render(request,'html/update.html',{'result':user})

def addupdate(request,id):
    if request.method=="POST":
        a=request.POST.get('name')
        b=request.POST.get('email')
        c=request.POST.get('phone')
        d=request.POST.get('password')
       
        ins=register(name=a,email=b,phone=c,password=d,id=id)
        ins.save()
    return redirect(prof)


def logout(request):
    session_keys=list(request.session.keys())
    for key in session_keys:
        del request.session[key]
    return redirect(index)


def show(request):
    a=register.objects.all()
    return render(request,'html/show.html',{'res':a})

    
def add_file(request):
    if request.method=="POST":
        a=request.POST.get('name')
       
        ima1=request.FILES['ima']
        fs= FileSystemStorage()
        im=fs.save(ima1.name,ima1)
        r=images(name=a,image=im)
        r.save()
    return render(request,'html/add_file.html')

def receive_file(request):
    a=password_images.objects.all()
    return render(request,'html/receive_file.html',{'res':a})

def addfeedback(request):
    if request.method=="POST":
        a=request.POST.get('message')
        r=feedtable(message=a)
        r.save()
    return render(request,'html/feedback.html',{'msg':'message successfully'})


def files(request):
    if request.method=="POST":
        category=request.POST.get('category')
        myfile=request.FILES['image']
        fs=FileSystemStorage()
        filename=fs.save(myfile.name,myfile)
        upd=password_images(category=category,image=filename)
        upd.save()
    return render(request,'html/addfilesss.html')    
    
    
    
    
def prof(request):
    temp=request.session['uid']
    pro=register.objects.get(id=temp)
    return render(request,'html/profile.html',{'result':pro})


def upload2(request):
    return render(request,'html/upload2.html')
    
def addupload(request):
    if request.method == "POST":
        myfile=request.FILES['file'] 
        fs=FileSystemStorage()
        filename=fs.save(myfile.name,myfile)
        try:
            os.remove(os.path.join(settings.MEDIA_ROOT,'input/test/test.csv'))
        except:
            pass
        fs=FileSystemStorage(location=os.path.join(settings.MEDIA_ROOT,'input/test/'))  
        fs.save("test.csv", myfile) 
        fs=FileSystemStorage()
        fs.save(myfile.name,myfile) 
        k.clear_session()

        result=test1.predict()
        ins=uploadtable(images=filename,user_id=request.session['uid'],result=result)
        ins.save()
    return render(request,'html/upload2.html',{'result':result})

def upload22(request):
    return render(request,'html/upload22.html')
    
def addupload2(request):
    if request.method == "POST":
        myfile=request.FILES['file'] 
        fs=FileSystemStorage()
        filename=fs.save(myfile.name,myfile)
        try:
            os.remove(os.path.join(settings.MEDIA_ROOT,'input/test/test.csv'))
        except:
            pass
        fs=FileSystemStorage(location=os.path.join(settings.MEDIA_ROOT,'input/test/'))  
        fs.save("test.csv", myfile) 
        fs=FileSystemStorage()
        fs.save(myfile.name,myfile) 
        k.clear_session()

        result=test1.predict()
        ins=uploadtable(images=filename,user_id=request.session['uid'],result=result)
        ins.save()
    return render(request,'html/upload22.html',{'result':result})
    
    
def viewfeedback(request):
    users=feedtable.objects.all()
    return render(request, 'html/viewfeedback.html',{'result': users})
