from django.contrib.auth.models import User
from django.db import models
from django.db.models import signals
from django.utils.translation import gettext_lazy as _
import autopep8


class Topic(models.Model):
    user_profile = models.ForeignKey("user_profile.UserProfile", blank=True, null=True, on_delete=models.SET_NULL)
    name = models.CharField(max_length=50)
    description = models.TextField("Description", max_length=10000)
    creation_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name}"


class Snippet(models.Model):
    COMPLEXITY_TYPES = (
     ('easy', 'Easy'),
     ('medium', 'Medium'),
     ('hard', 'Hard'))
    user_profile = models.ForeignKey("user_profile.UserProfile", blank=True, null=True, on_delete=models.CASCADE)
    topic = models.ForeignKey("education.Topic", null=True, on_delete=models.SET_NULL)
    name = models.CharField("Title", max_length=100)
    description = models.TextField("Description", max_length=10000)
    complexity = models.CharField(max_length=50, choices=COMPLEXITY_TYPES)
    example = models.TextField("Example", default="", max_length=10000)
    creation_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ["id"]

    @classmethod
    def question_autopep8(
        cls,
        sender,
        instance,
        created,
        *args,
        **kwargs
    ):    
     
        signals.post_save.disconnect(Snippet.question_autopep8, sender=Snippet)
        instance.example = autopep8.fix_code(instance.example)
        instance.save()
        signals.post_save.connect(Snippet.question_autopep8, sender=Snippet)

signals.post_save.connect(Snippet.question_autopep8, sender=Snippet)