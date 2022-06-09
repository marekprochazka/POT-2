from django.urls import path

from core.views.profile_picture import ProfilePictureView
from core.views.type_default_avatar import TypeDefaultAvatarListView

app_name = 'core'

urlpatterns = [
    path('profile/picture', ProfilePictureView.as_view(), name='profile_picture'),
    path('defaults/avatars', TypeDefaultAvatarListView.as_view(), name='default_avatars')
]
