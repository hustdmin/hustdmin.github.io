---
layout: page
title: 教师
permalink: /teachers/
description:
nav: true
nav_order: 2
display_categories: [团队负责人, 团队教师, 顾问]
horizontal: true
---
<div class="projects">
  <!-- Display categorized projects -->
    {% for category in page.display_categories %}
      {% if category !=  "团队负责人"%}
        {% continue %}
      {% endif %}
      <h2 class="category">{{ category }}</h2>
      {% assign categorized_projects = site.teachers | where: "category", category %}
      {% assign sorted_projects = categorized_projects | sort: "importance" %}
      <!-- Generate cards for each project -->
      {% if page.horizontal %}
        <div class="container">
          <div class="row row-cols-2">
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
    {% endfor %}
</div>

<div class="projects">
  <!-- Display categorized projects -->
    {% for category in page.display_categories %}
      {% if category ==  "团队负责人"%}
        {% continue %}
      {% endif %}
      <h2 class="category">{{ category }}</h2>
      {% assign categorized_projects = site.teachers | where: "category", category %}
      {% assign sorted_projects = categorized_projects | sort: "importance" %}
      <!-- Generate cards for each project -->
      {% if page.horizontal %}
        <div class="container">
          <div class="row row-cols-2">
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
    {% endfor %}
</div>