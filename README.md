Azavea Data Analytics team python project template
==============================

A file structure template, development environment and rule set for python data analytics projects on the data analytics team

Getting Started
------------

### Requirements:

* Docker

From within the root directory, first remove git tracking from the project

`rm -rf .git`

If you have not already done so, build the Docker image (you will only need to do this once)

`docker build -t da-project-template .`

Run a Docker container

`./scripts/container.sh .`

This will open a bash shell within the Docker container. Within the container the 'project' directory on the host machine (as specified as a parameter of `container.sh` above) will map to `/project` within the container. You can now access the full file structure of this template from within the container.

To exit

`exit`

Project Organization
------------

    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── interm         <- Intermediate data that has been transformed
    │   ├── organized      <- Raw datasets that have been renamed or reorganized into a new folder structure but have not been changed at all      
    │   ├── processed      <- The final, canonical data sets for modeling
    │   └── raw            <- The original, immutable data dump
    │
    ├── docs               <- A default Sphinx project; see sphinx-doc.org for details (currently not configured)
    │
    ├── guide              <- A set of markdown files with documented best practices, guidelines and rools for collaborative projects
    │
    ├── models             <- Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g
    │                         `1.0-jqp-initial-data-exploration`
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures        <- Generated graphics and figures to be used in reporting
    │
    ├── requirements.txt   <- The requirements file for reproducing the analysis environment
    │
    └── src                <- Source code for use in this project.
        │
        ├── data           <- Scripts to download or generate data
        │   └── make_dataset.py
        │
        ├── features       <- Scripts to turn raw data into features for modeling
        │   └── build_features.py
        │
        ├── models         <- Scripts to train models and then use trained models to make
        │   │                 predictions
        │   ├── predict_model.py
        │   └── train_model.py
        │
        └── visualization  <- Scripts to create exploratory and results oriented visualizations
            └── visualize.py
    


--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>
