---
layout: page
title: Alumni
permalink: /en/students_g/
description:
lang: en
nav: false
has_en: true
display_categories: [Ph.D. Graduates, Master Graduates]
horizontal: true
---
<div class="projects">
  {% for category in page.display_categories %}
    <h2 class="category">{{ category }}</h2>
    {% assign categorized_projects = site.students | where: "category_en", category %}
    {% assign sorted_projects = categorized_projects | sort: "importance" %}
    {% if page.horizontal %}
      <div class="container"><div class="row row-cols-2">
      {% for project in sorted_projects %}{% include projects_horizontal.html %}{% endfor %}
      </div></div>
    {% else %}
      <div class="grid">{% for project in sorted_projects %}{% include projects.html %}{% endfor %}</div>
    {% endif %}
  {% endfor %}
</div>
