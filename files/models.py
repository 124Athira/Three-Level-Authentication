from django.db import models
from django import forms

class register(models.Model):
    name = models.CharField(max_length=150)
    phone = models.CharField(max_length=150)
    email = models.CharField(max_length=150)
    password = models.CharField(max_length=150)
    image_category = models.CharField(max_length=150)
    image_ids = models.CharField(max_length=150)
    
class images(models.Model):
    name = models.CharField(max_length=150)
    image = models.CharField(max_length=150)


class feedtable(models.Model):
    message = models.CharField(max_length=150)
    



class password_images(models.Model):
    category = models.CharField(max_length=150)
    image = models.CharField(max_length=150)

class uploadtable(models.Model):
    images=models.CharField(max_length=150) 
    result=models.CharField(max_length=150) 
    user_id=models.CharField(max_length=150) 

        