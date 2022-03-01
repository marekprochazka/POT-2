from rest_framework.generics import ListAPIView
from rest_framework.permissions import IsAuthenticated

from core.models import TypeDefaultAvatar
from core.serializers.type_default_avatar_serializer import TypeDefaultAvatarSerializer
from core.views.base import BaseAPIView


class TypeDefaultAvatarListView(BaseAPIView, ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = TypeDefaultAvatarSerializer
    queryset = TypeDefaultAvatar.objects.all()
