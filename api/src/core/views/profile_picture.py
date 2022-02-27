from rest_framework import status
from rest_framework.response import Response

from core.serializers.person import ProfilePictureSerializer
from core.views.base import BaseAPIView


class ProfilePictureView(BaseAPIView):

    def get(self, request):
        if self.logged_person:
            serializer = ProfilePictureSerializer(self.logged_person)
            return Response(status=status.HTTP_200_OK, data=serializer.data)
        return Response(status=status.HTTP_401_UNAUTHORIZED, data='Login required')

    def post(self, request):
        if self.logged_person:
            picture = request.FILES.get('profile_picture')
            if picture:
                self.logged_person.update_data(profile_picture=picture)
                return Response(status=status.HTTP_201_CREATED)
            return Response(status=status.HTTP_400_BAD_REQUEST, data='No picture included')
        return Response(status=status.HTTP_401_UNAUTHORIZED, data='Login required')
