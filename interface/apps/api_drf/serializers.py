from education.models import Topic, Snippet
from rest_framework import serializers


class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        fields = ['id', 'name', 'user_profile', 'description', 'creation_date']

class SnippetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Snippet
        fields = ['id', 'name', 'description', 'topic_id', 'user_profile', 'complexity', 'example', 'question', 'answer', 'creation_date']
