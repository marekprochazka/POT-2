from django.urls import path

from core.views.profile_picture import ProfilePictureView

app_name = 'core'

urlpatterns = [
    path('profile/picture', ProfilePictureView.as_view(), name='profile_picture')
]
