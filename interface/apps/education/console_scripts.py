import requests
import pprint
from simple_print import sprint
from education.models import Snippet, Topic


def ping_api():
    # docker exec abc-interface-prod python run.py education.console_scripts "ping_api()"
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

def topics():
    # docker exec abc-interface-prod python run.py education.console_scripts "topics()"
    headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer Jw8J5KWXMa3ZRBTqbYyy',
    }
    params = {
        'limit': '100',
        'offset': '1',
    }

    response = requests.get('https://pythoncraft.org/api/menu2', params=params, headers=headers)

    data = response.json()
    for d in data["items"]:
        if d["menu1"] == 1:
            pprint.pprint(d)
            topic = Topic()
            topic.name = d["name_ru"]
            topic.description = ""
            topic.save()
            print(topic.id)


def articles():
    # docker exec abc-interface-prod python run.py education.console_scripts "articles()"
    headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer Jw8J5KWXMa3ZRBTqbYyy',
    }
    params = {
        'limit': '100',
        'offset': '1',
    }

    response_menu2 = requests.get('https://pythoncraft.org/api/menu2', params=params, headers=headers)
    data_menu2 = response_menu2.json()

    response_article = requests.get('https://pythoncraft.org/api/article', params=params, headers=headers)
    data_article = response_article.json()

    for menu2 in data_menu2["items"]:
        pprint.pprint(menu2["name_ru"])
        try:
            topic = Topic.objects.get(name=menu2["name_ru"])
            print(topic)
        except Exception as e:
            continue
        for article in data_article["items"]:
            if article["menu2"] == menu2["id"]:
                snippet = Snippet()
                snippet.name = article["name_ru"]
                snippet.description = article["text_ru"]
                snippet.example = article["code_ru"]
                snippet.topic = topic
                snippet.save()
                print(snippet.id)
    return 
