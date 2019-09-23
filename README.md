Azavea Data Analytics team python project template
==============================

A file structure template, development environment and rule set for python data analytics projects on the data analytics team

Getting Started
------------
Change the name of folder that contains this whole repo: `python-project-template` -> `{your project name}`  

From within the repo directory, first remove git tracking from the project  

`rm -rf .git`

The project template uses a placeholder name of 'da-project'. Change that name in the following files/directories (relative to the repo root):
- `da-project/` (change the name of the folder)  
- `./docker/run/`  
- `./docker/build/`

If you have not already done so, build the Docker image (you will only need to do this once)

`docker/build`

Run a Docker container:

`docker/run`  

This will open a bash shell within the Docker container. Within the container the 'project' directory on the host machine (as specified as a parameter of `run` above) will map to `/opt/src/` within the container. You can now access the full file structure of this template from within the container.

Run a Jupyter Notebook within Docker container:

`docker/jupyter`

You will need to open the link that is displayed in your terminal.

To exit:

`exit`  

Initialize a new git repository:

`git init`  

Project Organization
------------

    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── interm         <- Intermediate data that has been transformed
    │   ├── processed      <- The final, canonical data sets for modeling
    │   └── raw            <- The original, immutable data dump
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
    └── da-project         <- Source code for use in this project.
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
