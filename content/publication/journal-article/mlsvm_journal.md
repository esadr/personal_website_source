---
title: "Engineering Fast Multilevel Support Vector Machines"

authors:
  - Ehsan Sadrfaridpour
  - Talayeh Razzaghi
  - Ilya Safro

date: "2019-05-09T00:00:00Z"
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: "2019-05-09T00:00:00Z"

# Publication type.
publication_types: ["article-journal"]

# Publication name and optional abbreviated publication name.
publication: "*Springer Machine Learning*"
publication_short: "Machine Learning"

abstract: "The computational complexity of solving nonlinear support vector machine (SVM) is prohibitive on large-scale data. In particular, this issue becomes very sensitive when the data represents additional difficulties such as highly imbalanced class sizes. Typically, nonlinear kernels produce significantly higher classification quality compared to linear kernels but introduce extra kernel and model parameters, which makes fitting computationally expensive. This increases the quality but also reduces the performance dramatically. We introduce a generalized fast multilevel framework for regular and weighted SVM and discuss several versions of its algorithmic components that lead to a good trade-off between quality and time. Our framework is implemented using PETSc, which allows an easy integration with scientific computing tasks. The experimental results demonstrate significant speedup compared to the state-of-the-art nonlinear SVM libraries."

# Summary. An optional shortened abstract
summary: "A generalized fast multilevel framework for regular and weighted SVM, offering a trade-off between quality and computational efficiency on large-scale data."

tags:
  - Support Vector Machines
  - Machine Learning
  - Multilevel Framework
  - Optimization

# Display this page in the Featured widget?
featured: true

# Custom links (optional)
links:
  - name: Project Repository
    url: https://github.com/esadr/mlsvm

url_pdf: "https://link.springer.com/article/10.1007/s10994-019-05800-7"
url_preprint: "https://arxiv.org/pdf/1707.07657.pdf"
url_poster: "https://tigerprints.clemson.edu/grads_symposium/223/"

# Featured image
image:
  caption: 'Image credit: [**Unsplash**](https://unsplash.com/photos/jdD8gXaTZsc)'
  focal_point: ""
  preview_only: false

# Associated Projects (optional).
projects: []

# Slides (optional).
slides: ""
---

{{% callout note %}}
Click the *Cite* button above to demo the feature to enable visitors to import publication metadata into their reference management software.
{{% /callout %}}

{{% callout note %}}
Check out the project repository for the source code and further information.
{{% /callout %}}

The computational complexity of solving nonlinear support vector machine (SVM) is prohibitive on large-scale data. In particular, this issue becomes very sensitive when the data represents additional difficulties such as highly imbalanced class sizes. Typically, nonlinear kernels produce significantly higher classification quality compared to linear kernels but introduce extra kernel and model parameters, which makes fitting computationally expensive. We introduce a generalized fast multilevel framework for regular and weighted SVM and discuss several versions of its algorithmic components that lead to a good trade-off between quality and time. Our framework is implemented using PETSc, which allows an easy integration with scientific computing tasks. The experimental results demonstrate significant speedup compared to the state-of-the-art nonlinear SVM libraries.

