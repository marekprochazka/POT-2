from django.contrib import admin

# Register your models here.
from core.models import Person, TypeDefaultAvatar


class PersonAdmin(admin.ModelAdmin):
    pass


class TypeDefaultAvatarAdmin(admin.ModelAdmin):
    pass


admin.site.register(Person, PersonAdmin)
admin.site.register(TypeDefaultAvatar, TypeDefaultAvatarAdmin)
