---
layout: page
title: Research
permalink: /en/research/
description:
lang: en
nav: true
nav_order: 1
has_en: true
display_categories:
horizontal: true
---

<div class="projects">
  {% assign sorted_projects = site.research | sort: "importance" %}
  {% if page.horizontal %}
    <div class="container">
      <div class="row row-cols-1">
      {% for project in sorted_projects %}
        {% include projects_horizontal.html %}
      {% endfor %}
      </div>
    </div>
  {% else %}
    <div class="grid">
      {% for project in sorted_projects %}
        {% include projects.html %}
      {% endfor %}
    </div>
  {% endif %}
</div>
