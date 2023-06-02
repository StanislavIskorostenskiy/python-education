from django.urls import re_path, path
from api_drf.views import TopicList, SnippetList

from . import views

#app_name = "education"

urlpatterns = [  
    path("topics/", TopicList.as_view(), name="topics"),
    path("snippets/", SnippetList.as_view(), name="snippets"),
]