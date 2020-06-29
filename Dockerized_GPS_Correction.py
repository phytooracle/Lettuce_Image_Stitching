import numpy as np
import cv2
import random
import math
import multiprocessing
import datetime
import sys
import gc
import pickle
import os
import threading
import socket
import statistics
import datetime
from Customized_myltiprocessing import MyPool
from heapq import heappush, heappop, heapify
from collections import OrderedDict,Counter

from Block_wise_GPS_correction import *
from settings import *

def main(scan_date):
	global lettuce_coords

	lettuce_coords = read_lettuce_heads_coordinates()

	field = Field()
	
	field.save_plot()

	old_lid_base_error = field.calculate_lid_based_error()

	old_RMSE = get_approximate_random_RMSE_overlap(field,10,no_of_cores_to_use_max)

	field.create_patches_SIFT_files()
	
	field.draw_and_save_field(is_old=True)

	field.correct_field()

	field.draw_and_save_field(is_old=False)

	field.save_new_coordinate()


	new_lid_base_error = field.calculate_lid_based_error()
	new_RMSE = get_approximate_random_RMSE_overlap(field,10,no_of_cores_to_use_max)

	print('------------------ ERROR MEASUREMENT ------------------ ')


	print('OLD Lid base Mean and Stdev: {0}'.format(old_lid_base_error))
	print('OLD SI: {0}'.format(np.mean(old_RMSE[:,3])))
	

	print('NEW Lid base Mean and Stdev: {0}'.format(new_lid_base_error))
	print('NEW SI: {0}'.format(np.mean(new_RMSE[:,3])))



start_time = datetime.datetime.now()

scan_date = sys.argv[1]
config_file = sys.argv[2]
local_address = sys.argv[3]

print('Geo-correction started. Log is being saved in {0}'.format(local_address))

original = sys.stdout
sys.stdout = open('/app/{0}/{1}-rgb/{2}.txt'.format(local_address,scan_date,'geo_correction_output'), 'w')

initialize_settings(scan_date,config_file,local_address)
main(scan_date)

end_time = datetime.datetime.now()

report_time(start_time,end_time)

sys.stdout = original