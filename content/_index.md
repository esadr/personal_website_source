---
title: ""
date: 2026-09-11
type: landing

design:
  spacing: "6rem"

sections:
  - block: resume-biography-3
    content:
      username: admin
      text: ""
    design:
      css_class: dark
      background:
        color: black
        image:
          filename: stacked-peaks.svg
          filters:
            brightness: 1.0
          size: cover
          position: center
          parallax: false

  - block: features
    id: focus
    content:
      title: What I Build
      text: Reliable AI systems designed for enterprise knowledge and real-world operations.
      items:
        - name: Enterprise GenAI & Knowledge Systems
          icon: circle-stack
          description: Architect and productionize enterprise RAG systems with governed retrieval, source citations, metadata-aware search, document lifecycle controls, observability, and production reliability.
        - name: AI Evaluation & Retrieval Quality
          icon: check-badge
          description: Design evaluation systems that separate retrieval quality from answer-generation quality using gold and SME-reviewed datasets, retrieval metrics, citation coverage, evidence sufficiency, unsupported-answer behavior, and latency.
        - name: Production ML & Forecasting Platforms
          icon: chart-bar
          description: Own and modernize production ML workflows with traceability, observability, AWS-managed execution, CI/CD, and repeatable operating practices that reduce manual operational work.

  - block: features
    id: experience
    content:
      title: Experience
      text: Selected recent roles; additional experience and education are available on the [Experience page](/experience/).
      items:
        - name: Moderna — Senior Data Scientist
          description: '**2023–Present** — Lead architecture and productionization of enterprise AI systems spanning GenAI/RAG, retrieval and evaluation, governed enterprise knowledge, cloud ML services, observability, and production reliability. I also own modernization and reliability work for production forecasting workflows and reusable ML operating patterns.'
        - name: Infor — Senior Data Scientist
          description: '**2021–2023** — Developed and productionized end-to-end machine learning solutions in AWS and helped turn applied ML concepts into deployable capabilities using repeatable MLOps practices.'
        - name: Lowe’s — Data Scientist
          description: '**2020–2021** — Built cloud-based machine learning applications and applied statistical modeling and demand forecasting to operational business problems.'

  - block: markdown
    id: research
    content:
      title: Research Background & Publications
      subtitle: ""
      text: |-
        My research background is in scalable machine learning, NLP, large and imbalanced datasets, and biomedical data science. This work provides the algorithmic foundation for my current focus on reliable production AI systems.
    design:
      columns: "1"

  - block: collection
    id: papers
    content:
      title: Featured Publications
      filters:
        folders:
          - publication
        featured_only: true
    design:
      view: article-grid
      columns: 2

  - block: collection
    content:
      title: Recent Publications
      text: ""
      filters:
        folders:
          - publication
        exclude_featured: false
    design:
      view: citation

  - block: collection
    id: talks
    content:
      title: Talks
      filters:
        folders:
          - event
    design:
      view: article-grid
      columns: 1

  - block: collection
    id: writing
    content:
      title: Writing
      filters:
        folders:
          - post
        exclude_featured: false
        exclude_future: false
        exclude_past: false
        order: desc
    design:
      view: article-grid
      columns: 2

  - block: cta-card
    content:
      title: Let’s Connect
      text: I enjoy exchanging ideas on reliable GenAI, retrieval and evaluation, production ML, and scalable AI systems.
      button:
        text: Email Me
        url: mailto:esadrfa@gmail.com
    design:
      card:
        css_class: "bg-primary-700"
        css_style: ""
---
