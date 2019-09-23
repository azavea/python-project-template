# DA Python Task

### Task:
Write a script that can be run from the command line taking the following parameters:
 - An airport csv url
 - A tract shapefile uri
 - A uri for the zipped california shapefile
 - A uri for the output csv
 - A boolean flag indicating whether or not the user would like to write a json of airports within a specified distance (defaults to true)
 - A search radius for airports within a distance of each tract

### Data:
    - Dataset #1 (American Indian Census Tracts): https://www.census.gov/cgi-bin/geo/shapefiles/index.php?year=2018&layergroup=American+Indian+Area+Geography
        - Manually download the from the census, unzip it and make it accessible to a script run from within the docker environment
    - Dataset #2 (Airports): https://s3.amazonaws.com/azavea-climate-sandbox/airports.csv
        - Read the csv directly from s3
    - Dataset #3 (CA State Boundary): https://data.ca.gov/dataset/ca-geographic-boundaries/resource/3db1e426-fb51-44f5-82d5-a54d7c6e188b
        - Use my function in `python_test/data/utils.py` to download and unzip the california state boundary shapefile

### Rules:
    - You must define and import at least one submodule (i.e. a different script that defines functions or classes, `python_test/data/utils.py` is an example) of python-test
    - The script must be runnable from the command line and take command line parameters (I recommend using [click](https://click.palletsprojects.com/en/7.x/))
    - The script must run within the da-project docker container
    - All code (other than the what runs in the `__name__ == "__main__"` block) should be defined within functions or classes.

### Output:
1. Create a csv of all tracts in California with fields denoting the closest airport and how far away it is
2. A json with each tract and a list of airports within a specified distance
    - The json should go in the same directory as the csv. The filename should be automatically generated and should include the search radius in it.

### Suggestions:
    - Start by testing things out in a jupyter notebook (access one by running `./docker/jupyter`)
    - Define functions and move them out to scripts then try importing them and using them in the notebook
    - Eventually move everything over to a script and add a command line interface
    - Look at examples like [CCD](https://github.com/azavea/ccd-data-cleaning/blob/master/ccd/clean.py) or [scattergood](https://github.com/azavea/scattergood-reporting-phila-assets-risks/blob/master/src/run.py) if you need something to work off of
    - Let me know if you have any questions or want me to explain anything 