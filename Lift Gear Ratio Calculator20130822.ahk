#CommentFlag ///
/// Lift Gear Ratio Calculator
/// Joseph Dykstra
/// For VEX Lifts

#NoTrayIcon
#SingleInstance force
///CONSTANTS
mtr1_stall_torque:=14.97 ///393 torque config (IN LBS)
mtr2_stall_torque:=9.2   ///393 speed config
mtr3_stall_torque:=8.6   ///269
mtr1_full_speed:=100     ///393 torque config (RPM)
mtr2_full_speed:=160     ///393 speed config
mtr3_full_speed:=100     ///269
default_length:=17
default_stages:=1
default_angle :=90
default_weight:=2
default_motors:=2
default_speed:=60
default_torque:=65
endRatio:=1
endTime:=1

/// GUI
///Gui, Menu, MyMenuBar
Gui, Add, Tab2,r11 w400, Lift|Settings
Gui, Tab, Lift
Gui, Add, Text,section, Bar Length:
Gui, Add, Text,, Stages:
Gui, Add, Text,, Angle Change:
Gui, Add, Text,, Weight:
Gui, Add, Text,, Motors:
Gui, Add, Radio, vGearsChain Checked, Direct Drive
Gui, Add, Radio,, Gears
Gui, Add, Radio,, Chain
Gui, Add, Radio,, Gears and Chain

Gui, Add, Edit, vLength ys
Gui, Add, UpDown, vMyUpDown1 Range1-42, %default_length%	///41.56921
Gui, Add, Edit, vStages
Gui, Add, UpDown, vMyUpDown2 Range1-100, %default_stages%
Gui, Add, Edit, vAngle
Gui, Add, UpDown, vMyUpDown3 Range1-360, %default_angle%
Gui, Add, Edit, vWeight
Gui, Add, UpDown, vMyUpDown4 Range1-100, %default_weight%
Gui, Add, Edit, vMotors
Gui, Add, UpDown, vMyUpDown5 Range1-10, %default_motors%
Gui, Add, Radio, vRubberBands Checked, No Elastic Tension
Gui, Add, Radio,, Good Tension
Gui, Add, Radio,, Perfect Tension

Gui, Add, Text,ys,Inches
Gui, Add, Text,,
Gui, Add, Text,,Degrees of Movement
Gui, Add, Text,,Pounds
Gui, Add, Text,,393s

Gui, Tab, Settings
Gui, Add, Text,section,Motor Speed:
Gui, Add, Text,,Motor Torque:
Gui, Add, Text,,Motor Type:
Gui, Add, Radio, vMtrType Checked,393 Torque
Gui, Add, Radio,,393 Speed
Gui, Add, Radio,,269

Gui, Add, Edit, vMtrSpeed ys
Gui, Add, UpDown, vUD_spd Range1-100, %default_speed%	///41.56921
Gui, Add, Edit, vMtrTorque
Gui, Add, UpDown, vUD_torque Range1-100, %default_torque%
Gui, Add, Text,ys,`% (RPM)
Gui, Add, Text,,`% (In. Lbs.)
Gui, Tab

Gui, Add, Button,xm, Calculate
Gui, Add, Text,,1:%endRatio% Ratio
Gui, Add, Text,,%endTime% Seconds

Gui, Show, AutoSize Center
return


ButtonCalculate:
	{
	Gui, Submit, NoHide  ///Save each control's contents to its associated variable.
	mtr_out_torque	:= (mtr%MtrType%_stall_torque*MtrTorque/100)
	mtr_out_speed	:= (mtr%MtrType%_full_speed*MtrSpeed/100)
	SetFormat, float, 0.2 
	ratio := (Length * Stages * Weight) / (mtr_out_torque * Motors)		///INCH LBS / OVERALL MOTORS TORQUE
	ratio := ratio*100/(100-((GearsChain-1)*8))							///LOSS IN GEARS AND CHAIN
	ratio := ratio*(100-((RubberBands-1)*25))/100						///GAIN IN RUBBER BANDS
	time := Angle * ratio / (mtr_out_speed * 360 / 60)					///Calculate Time
	endRatio := ratio
	endTime := time
	Return
	}

MenuExitBtn:
	ExitApp

MenuAboutBtn:
	{
	MsgBox Created by Joseph Dykstra`nTeam 3018`nOpen Source
	Return
	}
/*
MenuConfigBtn:
	{
	InputBox use_mtr, Motor Configuration, What Motor do you want to use?`n1=393 torque`n2=393 speed`n3=269,,,,,,,,1
	Return
	}
	
MenuTorqueBtn:
	{
	InputBox mtr_torque_percent, Motor Torque Percentage, Torque Percentage?,,,,,,,,65
	Return
	}

MenuSpeedBtn:
	{
	InputBox mtr_speed_percent, Motor Speed Percentage, Torque Percentage?,,,,,,,,60
	Return
	}
*/

ButtonClose:
	ExitApp

GuiClose:
	ExitApp




/*
Fix the floats being too long...
	...Attempts on lines 76, 79


*/