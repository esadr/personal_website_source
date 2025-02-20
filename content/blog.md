---
title: 'Blog'
type: landing  # Same type as your Experience page
layout: landing  # Some sites may require layout: landing
date: 2025-02-14  # or any date you like

# Optional: Adjust spacing
design:
  spacing: '5rem'

# Define the sections of your landing page
sections:
  - block: collection
    content:
      title: "Latest Posts"
      subtitle: "Check out my recent updates"
      # The filters below control which posts display and how many.
      filters:
        author: ""
        tag: ""
        category: ""
        publication_type: ""
        folders: ["post"]  # ✅ Only show blog posts
        exclude_featured: false
        exclude_future: false
        exclude_past: false
        order_by: desc
        count: 0  # 0 = show all
    design:
      view: article-grid  # ✅ Matches the publications layout
      columns: 2  # ✅ Two-column layout
---
