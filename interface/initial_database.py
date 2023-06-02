import os
from django.contrib.auth.models import User
from education.models import Topic, Snippet
from user_profile.models import UserProfile
from mixer.backend.django import Mixer
import requests


def ping_api():
    # docker exec abc-service-abc-interface-1 python run.py initial_database "ping_api()"
    headers = {
        'accept': '*/*',
        'Authorization': 'Bearer Jw8J5KWXMa3ZRBTqbYyy',
        'Content-Type': 'application/json',
    }

    json_data = {
        'ping': 'test',
    }

    response = requests.post('https://pythoncraft.org/api/ping', headers=headers, json=json_data)
    print(response)


def clear() -> None:
    # python run.py initial_database "clear()"
    User.objects.all().delete()
    UserProfile.objects.all().delete()
    Topic.objects.all().delete()
    Snippet.objects.all().delete()
    print("Clear_database -> complete")


def prepare() -> None:
    # python run.py initial_database "prepare()"
    mixer = Mixer(commit=False)

    username = "abc"
    password = "abc"
    exist = False

    try:
        superuser = User.objects.create_superuser(username=f"{username}@abc.abc", email=f"{username}@abc.abc", password=password)
        superuser.save()
        superuser_profile = UserProfile()
        superuser_profile.user = superuser
        superuser_profile.name = username
        superuser_profile.password_recovery_key = 'abc'
        superuser_profile.save()
    except Exception as e:
        # superuser exist
        print(e)
        exist = True
    else:
        print("Fill_database -> already filled")