# Generated by Django 3.2.7 on 2025-03-01 13:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('files', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='uploadtable',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('images', models.CharField(max_length=150)),
                ('result', models.CharField(max_length=150)),
                ('user_id', models.CharField(max_length=150)),
            ],
        ),
    ]
