from django.contrib import admin

# Register your models here.
from core.models import Person


class PersonAdmin(admin.ModelAdmin):
    pass


admin.site.register(Person, PersonAdmin)
