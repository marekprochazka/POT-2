from django.urls import path

from my_auth.views.login import LoginView
from my_auth.views.logout import LogoutView
from my_auth.views.register import RegisterView

app_name = 'my_auth'

urlpatterns = [
    path('login', LoginView.as_view(), name='login'),
    path('register', RegisterView.as_view(), name='register'),
    path('logout', LogoutView.as_view(), name='logout')

]