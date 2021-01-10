# Large Scale Image Geo-correction and Stitching Platform

This repository contains all the necessary codes for running geo-correcting the images that are generated by the Gantry, University of Arizona automated high-throughput phenotyping machine. Although it is specifically developed for the Gantry, but any set of geo-referenced images can be geo-corrected using this tool. We mainly focus on TIFF image that are coming off the Gantry. 

## Files in the repository

* Block_wise_GPS_correction.py: The main developed codes and functions for implementing the geo-correction algorithm is located in this file. This file is not meant to be run separately. 

* Customized_myltiprocessing.py: A customize multiprocessing class is developed to increase the performance of python multiprocessing in this script.

* Dockerized_GPS_Correction.py: The main entry point for running the geo-correction on Lab Servers. Arguments are: {scan date}, {address of the config file}, {address of the directory where all the files exist and the results will be saved}. 

* Dockerized_GPS_Correction_FLIR.py: The main entry point for running the geo-correction for FLIR on either HPC or Lab Servers (TBC). Same arguments as above. Following are the list of parameters:
  * '-d' --> '--destination', type=str, help='address of the destination folder on HPC (usually on xdisk where everything is stored).' 

  * '-b' --> '--bin_2tif', type=str, help='the address of the bin_2tif folder.'

  * '-g' --> '--gps_coord', type=str, help='the address of the GPS coordinates csv file.'

  * '-s' --> '--scan_date', type=str, help='the name of the specific scan to work on.'

  * '-c' --> '--config_file', type=str, help='the name of the config file to use.'

  * '-l' --> '--lid_address', type=str, help='the address of the lid file.'

  * '-u' --> '--uav_lettuce_address', type=str, help='the address of the uav lettuce coordinates file.'

  * '-r' --> '--repository_address', type=str, help='the address of the geocorrection repository.'

* Dockerized_Mosaicing_FLIR.py: The main entry point for running the mosaicing for FLIR on either HPC or Lab Servers (TBC). It generates corrected and uncorrected mosaics. It needs to be run after running the geo-correction code. It takes the same parameters, same arguments as above. Following are the list of parameters:

  * '-d' --> '--destination', type=str, help='address of the destination folder on HPC (usually on xdisk where everything is stored).' 

  * '-b' --> '--bin_2tif', type=str, help='the address of the bin_2tif folder.'

  * '-g' --> '--gps_coord', type=str, help='the address of the GPS coordinates csv file.'

  * '-s' --> '--scan_date', type=str, help='the name of the specific scan to work on.'

  * '-c' --> '--config_file', type=str, help='the name of the config file to use.'

  * '-l' --> '--lid_address', type=str, help='the address of the lid file.'

  * '-u' --> '--uav_lettuce_address', type=str, help='the address of the uav lettuce coordinates file.'

  * '-r' --> '--repository_address', type=str, help='the address of the geocorrection repository.'


* Dockerized_GPS_Correction_HPC.py: The main entry ponit for running the geo-correction on HPC inside the pipeline. Following are the list of parameters:
  * '-d' --> '--destination', type=str, help='address of the destination folder on HPC (usually on xdisk where everything is stored).' 

  * '-b' --> '--bin_2tif', type=str, help='the address of the bin_2tif folder.'

  * '-g' --> '--gps_coord', type=str, help='the address of the GPS coordinates csv file.'

  * '-s' --> '--scan_date', type=str, help='the name of the specific scan to work on.'

  * '-c' --> '--config_file', type=str, help='the name of the config file to use.'

  * '-l' --> '--lid_address', type=str, help='the address of the lid file.'

  * '-u' --> '--uav_lettuce_address', type=str, help='the address of the uav lettuce coordinates file.'

  * '-r' --> '--repository_address', type=str, help='the address of the geocorrection repository.'

* Dockerized_Ortho_Save.py: The entry point for generating and saving the orhtos. Same parameters as above. 

* GPS_image_stitching.py: The old file where all the untidy codes for testing are placed in. 

* geo_correction_config.txt: A sample of a good config file with all the field. (Lid Detection Method options: ML (for faster RCNN), TMP (for Template Matching) and Other)

* settings.py: The file that is responsible for reading the config file and configuring the platform. 

* test_main.py: A development test file for testing the code in debuge mode. 

* lid_temp.png: The template used in lid detection. This can be changed from season to season or even scan to scan. 

## Notes

The local repository must contain all the above files (specially the main skeleton of the code and the temp image of the lid).

