# VEX Lift Gear Ratio Calculator #
#     Author: Joseph Dykstra     #
#       Created: 2013-07-09      #
#      Finished: 2013-09-04      #

import sys
import easygui as eg

#CONSTANTS		393torq	393spd	269
stall_torque =	[14.76, 9.2,	8.6]
full_speed =	[100,   160,	100]

#Preferences
mtr_torque_percent=65   #target torque
mtr_speed_percent=60    #target speed
use_mtr=0				# 0=393torque  1=393speed  2=269

#CALCULATIONS
mtr_out_torque = stall_torque[use_mtr]*mtr_torque_percent/100
mtr_out_speed  =  full_speed[use_mtr] * mtr_speed_percent/100


#GUI
msg = "Enter Lift Specs"
title = "VEX Lift Gear Ratio Calculator"
while 1:
	fieldNames = ["Length","Stages","Angle Change","Weight","Motors"]
	fieldValues = []				# initialize fieldValues
	fieldValues = eg.multenterbox(msg, title, fieldNames)
	while 1:						# make sure that none of the fields was left blank
		if fieldValues == None: break
		errmsg = ""
		for i in range(len(fieldNames)):
			if fieldValues[i].strip() == "":
				errmsg += ('"%s" is a required field.\n\n' % fieldNames[i])
		if errmsg == "": break		# no problems found
		fieldValues = eg.multenterbox(errmsg, title, fieldNames, fieldValues)
	
	length = float(fieldValues[0])
	stages = float(fieldValues[1])
	angle  = float(fieldValues[2])
	weight = float(fieldValues[3])
	motors = float(fieldValues[4])
	print("Reply was:",str(fieldValues))
	ratio = float(length)*float(stages)*float(weight)
	ratio = ratio/float(motors)/mtr_out_torque
	rps = mtr_out_speed*360/60		#revs per sec
	time = float(angle)*ratio/rps
	msg = "Gear Ratio: 1:"+str(round(ratio,2))+"\nLift Time: "+str(round(time,2))+" Seconds"
	print(str(msg)+str("\n"))
