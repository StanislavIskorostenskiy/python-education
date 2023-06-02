from django.urls import re_path, path

from . import views

app_name = "education"

urlpatterns = [  
    re_path(r"^topics/$", views.topics, name="topics"),
    path("topic/view/<int:topic_id>/", views.topic_view, name="topic_view"),
    path("topic/view/create-topic/", views.create_topic, name="create_topic"),
    path("topic/view/<int:topic_id>/create-snippet/", views.create_snippet, name="create_snippet"),
    path("snippet/view/<int:snippet_id>/", views.snippet_view, name="snippet_view")
]
