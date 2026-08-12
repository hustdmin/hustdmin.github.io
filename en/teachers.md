---
layout: page
title: Faculty
permalink: /en/teachers/
description:
lang: en
nav: true
nav_order: 2
has_en: true
display_categories: [Team Lead, Faculty, Advisor]
horizontal: true
---
<div class="projects">
  {% for category in page.display_categories %}
    {% if category != "Team Lead" %}
      {% continue %}
    {% endif %}
    <h2 class="category">{{ category }}</h2>
    {% assign categorized_projects = site.teachers | where: "category_en", category %}
    {% assign sorted_projects = categorized_projects | sort: "importance" %}
    {% if page.horizontal %}
      <div class="row row-cols-1 row-cols-md-3">
      {% for project in sorted_projects %}{% include projects_horizontal.html %}{% endfor %}
      </div>
    {% else %}
      <div class="grid">{% for project in sorted_projects %}{% include projects.html %}{% endfor %}</div>
    {% endif %}
  {% endfor %}
</div>
<div class="projects">
  {% for category in page.display_categories %}
    {% if category == "Team Lead" %}{% continue %}{% endif %}
    <h2 class="category">{{ category }}</h2>
    {% assign categorized_projects = site.teachers | where: "category_en", category %}
    {% assign sorted_projects = categorized_projects | sort: "importance" %}
    {% if page.horizontal %}
      <div class="row row-cols-1 row-cols-md-3">
      {% for project in sorted_projects %}{% include projects_horizontal.html %}{% endfor %}
      </div>
    {% else %}
      <div class="grid">{% for project in sorted_projects %}{% include projects.html %}{% endfor %}</div>
    {% endif %}
  {% endfor %}
</div>
