from django.contrib import admin

from .models import Choice, Question


class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 0
    min_num = 2


class QuestionAdmin(admin.ModelAdmin):
    list_display = ('question_text', 'pub_date')
    search_fields = ['question_text']
    list_filter = ['pub_date']

    fieldsets = [(None, {
        'fields': ['question_text']
    }), ('Date information', {
        'fields': ['pub_date'],
        'classes': ['collapse']
    })]
    inlines = [ChoiceInline]


class MyAdminSite(admin.AdminSite):
    site_header = 'Polls Administration'


admin_site = MyAdminSite()
admin_site.register(Question, QuestionAdmin)
