*
 * Filename: setup.sp
 * Authors: Anna Nguyen, David Wang, Shelby King
 * Date: 3/9/2022
 * Course: Introduction to VLSI Design EE4325.001 Spring 2022
 * Description:
 *	    Spice test setup file for project 3. General format borrowed
 *      from provided tutorial example. 
 *

$ transistor model
.include "/proj/cad/library/mosis/GF65_LPe/cmos10lpe_CDS_oa_dl064_11_20160415/models/YI-SM00030/Hspice/models/design.inc"
.include "INV.pex.sp"

.option post runlvl=5

xi GND! OUT VDD! IN INV_TUTORIAL

vdd VDD! GND! 1.2v
$ Define piecewise linear input waveform such that input slew rate is 40ps
vin IN GND! pwl(0ns 1.2v 1ns 1.2v 1.056ns 0v 6ns 0v 6.056ns 1.2v 12ns 1.2v)
cout OUT GND! 55.002f

$transient analysis
.tr 100ps 12ns
$example of parameter sweep, replace numeric value W of pfet with WP in invlvs.sp
$.tr 100ps 12ns sweep WP 1u 9u 0.5u

.measure tran trise trig v(IN) val=0.6v fall=1 targ v(OUT) val=0.6v rise=1 $measure tlh at 0.6v
.measure tran tfall trig v(IN) val=0.6v rise=1 targ v(OUT) val=0.6v fall=1 $measure tpl at 0.6v
.measure tavg param = '(trise+tfall)/2' $calculate average delay
.measure tdiff param='abs(trise-tfall)' $calculate delay difference
.measure delay param='max(trise,tfall)' $calculate worst case delay

$ method to get edp
.measure tran t1 when v(IN)=1.19 fall=1
.measure tran t2 when v(OUT)=1.19 rise=1
.measure tran t3 when v(IN)=0.01 rise=1
.measure tran t4 when v(OUT)=0.01 fall=1
.measure tran i1 avg i(vdd) from=t1 to=t2 $average current when output rise
.measure tran i2 avg i(vdd) from=t3 to=t4 $average current when output fall
.measure energy1 param='1.2*i1*(t2-t1)' $calculate energy when output rise
.measure energy2 param='1.2*i2*(t4-t3)' $calculate energy when output fall
.measure energysum param='energy1+energy2'
.measure edp2 param='abs(delay*energysum)'

.end