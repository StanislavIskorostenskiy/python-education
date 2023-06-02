from django import template                                                                                                                                                        
from django.template.defaultfilters import stringfilter

register = template.Library()

@register.filter
def attr(form, name_arg):
    # case attr:'class=customclass'
    try:
        attrs = form.field.widget.attrs
        name, arg = name_arg.split("=")
        attrs[name] = arg
    except:
        pass
    return form