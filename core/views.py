from rest_framework.views import APIView
from rest_framework import response


class HelloWorld(APIView):

    def get(self, req):
        return response.Response("hello wold")
