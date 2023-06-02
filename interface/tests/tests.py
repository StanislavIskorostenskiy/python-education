from django.test import Client
from education.models import Snippet, Topic
from interface.conftest import auto_login_user
from django.urls import reverse
import pytest
import settings
from settings import HOST
from settings import POSTGRES_DB
from settings import POSTGRES_HOST
from settings import POSTGRES_PASSWORD
from settings import POSTGRES_PORT
from settings import POSTGRES_USER


client = Client()


@pytest.mark.django_db
def test_topics_page(auto_login_user):
    """
    Тест проверяет наличие страници топиков и ожидает код ответа 200
    """
    #docker exec -i abc-interface-dev pytest tests/tests.py::test_topics_page -s -v
    client, user = auto_login_user()
    url = reverse("education:topics")
    response = client.get(url)
    assert response.status_code == 200


@pytest.mark.django_db
def test_create_topic(auto_login_user):
    """
    Тест создает топик и ожидает код ответа 200 при переходе по id созданного топика
    """
    #docker exec -i abc-interface-dev pytest tests/tests.py::test_create_topic -s -v
    client, user = auto_login_user()
    test_name = "test name"
    test_description = "test description"
    topic = Topic(name=test_name, description=test_description)
    topic.save()
    topic = Topic.objects.first()
    if topic:
        url = reverse("education:topic_view", args=[topic.id])
        response = client.get(url)
        assert response.status_code == 200


@pytest.mark.django_db
def test_create_snippet(auto_login_user):
    """
    Тест проверяет работоспособность функции создания сниппета и ожидает код ответа 200 при переходе по id созданного топика 
    и связность с моделью топика
    """
    #docker exec -i abc-interface-dev pytest tests/tests.py::test_create_snippet -s -v
    client, user = auto_login_user()
    topic = Topic(name="test_topic_name")
    topic.save()
    test_name = "test name"
    test_description = "test description"
    test_example = "test_example"
    snippet = Snippet(name=test_name, description=test_description, example=test_example, topic=topic)
    snippet.save()

    if snippet:
        url = reverse("education:snippet_view", args=[snippet.id])
        response = client.get(url)
        assert response.status_code == 200
        assert snippet.topic.id == topic.id


@pytest.mark.django_db
def test_topic_page(auto_login_user):
    """
    Тест работоспособность страницы создания топика и ожидает код ответа 200
    """
    #docker exec -i abc-interface-dev pytest tests/tests.py::test_topic_page -s -v
    client, user = auto_login_user()
    url = reverse('education:create_topic')
    res = client.get(url)
    assert res.status_code == 200


@pytest.mark.django_db
def test_user_edit_page(auto_login_user):
    """
    Тест на проверку работоспособности страницы просмотра профиля ожидает код ответа 200
    """
    #docker exec -i abc-interface-dev pytest tests/tests.py::test_user_edit_page -s -v
    client, user = auto_login_user()
    url = reverse("user_profile:edit_profile")
    response = client.get(url)
    print("hello world")
    assert response.status_code == 200





    

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              