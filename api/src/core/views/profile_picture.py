from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from core.serializers.person import ProfilePictureSerializer
from core.views.base import BaseAPIView


class ProfilePictureView(BaseAPIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        serializer = ProfilePictureSerializer(self.logged_person)
        return Response(status=status.HTTP_200_OK, data=serializer.data)

    def post(self, request):
        picture = request.FILES.get('profile_picture')
        if picture:
            self.logged_person.update_data(profile_picture=picture)
            return Response(status=status.HTTP_201_CREATED)
        return Response(status=status.HTTP_400_BAD_REQUEST, data='No picture included')
