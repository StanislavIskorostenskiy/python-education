from api_drf.serializers import TopicSerializer, SnippetSerializer
from education.models import Topic, Snippet
from rest_framework.generics import GenericAPIView
from rest_framework.mixins import ListModelMixin, CreateModelMixin
from api_drf.service import StandardResultsSetPagination


class TopicList(GenericAPIView, ListModelMixin, CreateModelMixin):
    serializer_class = TopicSerializer
    pagination_class = StandardResultsSetPagination
    def get_queryset(self):
        queryset = Topic.objects.all()
        try:
            name = self.request.query_params.get("name")
        except Exception as ex:
            raise ex
        if name:
            queryset = Topic.objects.filter(name=name)
        return queryset
    
    def get(self, request):
        return self.list(request)
    
    def post(self, request):
        return self.create(request)

class SnippetList(GenericAPIView, ListModelMixin, CreateModelMixin):
    serializer_class = SnippetSerializer
    pagination_class = StandardResultsSetPagination
    def get_queryset(self):
        queryset = Snippet.objects.all()
        try:
            name = self.request.query_params.get("name")
        except Exception as ex:
            raise ex
        if name:
            queryset = Snippet.objects.filter(name=name)
        return queryset
    
    def get(self, request):
        return self.list(request)
    
    def post(self, request):
        return self.create(request)

