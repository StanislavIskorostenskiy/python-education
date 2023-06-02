from django import forms
from education.models import Topic, Snippet


class TopicForm(forms.ModelForm):
    class Meta:
        model = Topic
        fields = ['name', 'description']

class SnippetForm(forms.ModelForm):
    class Meta:
        model = Snippet
        fields = ["name", "description", "complexity", "example"]