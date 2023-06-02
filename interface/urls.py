import debug_toolbar
import settings
from django.conf.urls import handler404
from django.conf.urls import handler500
from django.contrib import admin
from django.urls import include, include, re_path, path
from django.conf.urls.static import static

urlpatterns = [
    path("admin/", admin.site.urls), 
    path("i18n/", include("django.conf.urls.i18n"))
]

urlpatterns += [
    path(r"education/", include("education.urls", namespace="education")),
]

urlpatterns += [
    path(r"api-drf/", include("api_drf.urls")),
]

urlpatterns += [
    re_path(r"", include("main.urls", namespace="main")),
    re_path(r"^profile/", include("user_profile.urls", namespace="user_profile")),
]

handler404 = "main.views.handler404"
handler500 = "main.views.handler500"


if settings.DEBUG:
    urlpatterns += [
        path("__debug__/", include(debug_toolbar.urls)),
    ]
