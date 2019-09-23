import os
import shutil
import urllib
import zipfile
from os.path import basename, isdir, join

import geopandas as gpd


def download_sp_zipfile(url, folder):
    f = basename(url)
    out_dir = join(folder, f.split('.')[0])
    if isdir(out_dir):
        shutil.rmtree(out_dir)
    os.makedirs(out_dir)
    zfile  = join(out_dir, f)
    
    with urllib.request.urlopen(url) as response, open(zfile, 'wb') as out_file:
        shutil.copyfileobj(response, out_file)
        with zipfile.ZipFile(zfile) as zf:
            zf.extractall(path=out_dir)
        os.remove(zfile)
    
    sp_files = {}
    for z in os.listdir(out_dir):
        if z.endswith('.shp') or z.endswith('.geojson'):
            sp_files[z] = gpd.read_file(join(out_dir, z))
            
    return sp_files
