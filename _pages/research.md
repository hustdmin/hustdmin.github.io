---
layout: page
title: 研究方向
permalink: /research/
description:
nav: true
nav_order: 1
display_categories:
horizontal: true
---

<!-- pages/projects.md -->
<div class="projects">
  {% assign sorted_projects = site.research | sort: "importance" %}
  <!-- Generate cards for each project -->
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
