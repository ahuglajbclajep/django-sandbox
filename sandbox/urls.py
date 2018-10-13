"""
sandbox URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
https://docs.djangoproject.com/en/2.1/topics/http/urls/
"""

from django.urls import include, path

from polls.admin import admin_site

urlpatterns = [
    path('polls/', include('polls.urls')),
    path('admin/', admin_site.urls)
]
