# Generated by Django 4.1.3 on 2023-04-14 08:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('education', '0004_alter_snippet_complexity'),
    ]

    operations = [
        migrations.AlterField(
            model_name='topic',
            name='description',
            field=models.TextField(max_length=10000, verbose_name='Description'),
        ),
    ]