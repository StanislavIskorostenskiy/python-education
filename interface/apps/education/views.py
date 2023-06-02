from django.shortcuts import render, reverse
from django.shortcuts import Http404
from django.utils.translation import gettext_lazy as _
from education.models import Topic, Snippet
from education.forms import TopicForm, SnippetForm
from django.http import HttpResponseRedirect


def topics(request):
    d = {}
    if request.method == "GET":
        name = request.GET.get("search", "")
        if name == "":
            d["topics"] = Topic.objects.all().order_by("id")
        else:
            d["topics"] = Topic.objects.filter(name=name)
        topic_form = TopicForm()

    return render(request, "education/topics.html", context=d)

def topic_view(request, topic_id: int):
    d = {}
    try:
        d["topic"] = topic = Topic.objects.get(pk=topic_id)
    except:
        raise Http404
    topic_form = TopicForm(instance=topic)
    d["topic_form"] = topic_form
    d["snippets"] = topic.snippet_set.filter(topic_id=topic_id)
    if request.method == "GET":
        name = request.GET.get("search", "")
        if name == "":
            d["snippets"] = topic.snippet_set.filter(topic_id=topic_id)
        else:
            d["snippets"] = topic.snippet_set.filter(topic_id=topic_id).filter(name=name)
        topic_form = TopicForm()
        
    if request.method == "POST":
        topic_form = TopicForm(request.POST, instance=topic)
        if topic_form.is_valid() and "save" in request.POST:
            topic.name = topic_form.cleaned_data["name"]
            topic.description = topic_form.cleaned_data["description"]
            topic.save()
        elif topic_form.is_valid() and "delete" in request.POST:
            topic.delete()
        return HttpResponseRedirect(reverse("education:topics"))
    else:
        topic_form = TopicForm(instance=topic)
    d["education_nav_menu"] = 1

    return render(request, "education/topic_view.html", context=d)

def create_topic(request):
    d = {}
    if request.method == "POST":
        topic_form = TopicForm(request.POST)
        if topic_form.is_valid():
            name = topic_form.cleaned_data["name"]
            description = topic_form.cleaned_data["description"]
            user_profile_id = request.user_profile.id
            topic = Topic(name=name, description=description)
            topic.save()

            return HttpResponseRedirect(reverse("education:topics"))
    else:
        topic_form = TopicForm()
    d["topic_form"] = topic_form

    return render(request, "education/create_topic.html", context=d)

def create_snippet(request, topic_id: int):
    d = {}
    if request.method == "POST":
        snippet_form = SnippetForm(request.POST)
        if snippet_form.is_valid():
            name = snippet_form.cleaned_data["name"]
            complexity = snippet_form.cleaned_data["complexity"]
            example = snippet_form.cleaned_data["example"]
            user_profile_id = request.user_profile.id
            snippet = Snippet(name=name, 
                              complexity=complexity, 
                              example=example,
                              user_profile_id=user_profile_id, topic_id=topic_id)
            snippet.save()
    
            return HttpResponseRedirect(reverse("education:topics"))
    else:
        snippet_form = SnippetForm()
    d["snippet_form"] = snippet_form

    return render(request, "education/create_snippet.html", context=d)

def snippet_view(request, snippet_id: int):
    d = {}
    try:
        d["snippet"] = snippet = Snippet.objects.get(pk=snippet_id)
        d["topic"] = snippet.topic
    except:
        raise Http404
    snippet_form = SnippetForm(instance=snippet)
    d["snippet_form"] = snippet_form
    if request.method == "POST" and request.user.is_superuser:
        snippet_form = SnippetForm(request.POST, instance=snippet)
        if "save" in request.POST and snippet_form.is_valid():
            snippet.name = snippet_form.cleaned_data["name"]
            snippet.complexity = snippet_form.cleaned_data["complexity"]
            snippet.example = snippet_form.cleaned_data["example"]
            snippet.save()
        elif "delete" in request.POST:
            snippet.delete()
        
        return HttpResponseRedirect(reverse("education:topics"))    
    return render(request, "education/snippet_view.html", context=d)
