#Lift Gear Ratio Calculator
#CONSTANTS
mtr1_stall_torque=14.76 #393 torque
mtr2_stall_torque=9.2   #393 speed
mtr1_full_speed=100     #393 torque
mtr2_full_speed=160     #393 speed

#Preferences
mtr_torque_percent=65   #target torque (for both 393 torque and 393 speed)
mtr_speed_percent=60    #target speed  (for both 393 torque and 393 speed)
use_mtr=1 #393 1=torque  2=speed

#CALCULATIONS
mtr1_out_torque=mtr1_stall_torque*mtr_torque_percent/100
mtr2_out_torque=mtr2_stall_torque*mtr_torque_percent/100
mtr1_out_speed = mtr1_full_speed * mtr_speed_percent/100
mtr2_out_speed = mtr2_full_speed * mtr_speed_percent/100
mtr_out_torque=0
mtr_out_speed=0

if use_mtr==1:
    mtr_out_torque=mtr1_out_torque
    mtr_out_speed=mtr1_out_speed
if use_mtr==2:
    mtr_out_torque=mtr2_out_torque
    mtr_out_speed=mtr2_out_speed


cont=3
while cont!=0:
    if cont>=3:
        print("Calculate gearing for what lift system?")
        print("1 = Scissor")
        print("2 = Chain Bar")
        print("3 = 4 Bar")
        print("4 = 6 Bar")
        print("5 = Reverse 4 Bar")
        print("6 = Reverse 6 Bar")
        lift_type=""
        lift_num=int(input("Choose:"))
        

    if cont>=2:
        if lift_num==1:                           #SCISSOR
            length=input("Length of bars:")
            stages=input("Number of stages:")
            
        if lift_num==2 or lift_num==3:           #Chain & 4 Bar
            length=input("Length of bars:")
            stages=1
            
        if lift_num==4:                           #6 Bar
            length=input("Length of long bars:")
            stages=1
            
        if lift_num==5:                           #Rev 4 Bar
            length=input("Length of bars:")
            stages=2
        if lift_num==6:                           #Rev 6 Bar
            length=input("Length of long bars:")
            stages=2
        
        angle=input("Angle Change:")
        
    if cont>=1:
        weight = input("Weight of objects:")
        motors = input("Number of motors:")
        ratio = float(length)*float(stages)*float(weight)
        ratio = ratio/float(motors)/mtr_out_torque
        tps = mtr_out_speed*360/60 #revs per sec
        time = float(angle)*ratio/tps
        print("Gear Ratio:   1 :",round(ratio,2))
        print("Lift Time:  ",round(time,2),"Seconds")
        print("")
        print("====================")
        print("")
        print("0=Quit     1=Weight     2=Bar Length     3=Lift Type")
        cont=int(input("Choose:"))
        print("")
        print("====================")
        print("")

