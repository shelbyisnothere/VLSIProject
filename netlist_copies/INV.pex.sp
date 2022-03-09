* File: /home/axon/srk180000/cad/gf65/Spring2022_lvs/INV.pex.sp
* Created: Wed Mar  9 15:58:01 2022
* Program "Calibre xRC"
* Version "v2013.2_18.13"
* 
.include "/home/axon/srk180000/cad/gf65/Spring2022_lvs/INV.pex.sp.pex"
.subckt INV_tutorial  GND! OUT VDD! IN
* 
* IN	IN
* VDD!	VDD!
* OUT	OUT
* GND!	GND!
XD0_noxref N_GND!_D0_noxref_pos N_VDD!_D0_noxref_neg DIODENWX  AREA=7.7175e-12
+ PERIM=1.344e-05
XMMN0 N_OUT_MMN0_d N_IN_MMN0_g N_GND!_MMN0_s N_GND!_D0_noxref_pos NFET L=6e-08
+ W=1.38e-06 AD=7.59e-13 AS=4.278e-13 PD=3.86e-06 PS=3.38e-06 NRD=0.264493
+ NRS=0.0978261 M=1 NF=1 CNR_SWITCH=0 PCCRIT=0 PAR=1 PTWELL=0 SA=3.1e-07
+ SB=5.5e-07 SD=0 PANW1=0 PANW2=1.8e-15 PANW3=3e-15 PANW4=3e-15 PANW5=3e-15
+ PANW6=6e-15 PANW7=1.2e-14 PANW8=1.2e-14 PANW9=2.4e-14 PANW10=1.8e-14
XMMP0 N_OUT_MMP0_d N_IN_MMP0_g N_VDD!_MMP0_s N_VDD!_D0_noxref_neg PFET L=6e-08
+ W=4.14e-06 AD=2.277e-12 AS=1.2834e-12 PD=9.38e-06 PS=8.9e-06 NRD=0.0881643
+ NRS=0.0326087 M=1 NF=1 CNR_SWITCH=1 PCCRIT=0 PAR=1 PTWELL=1 SA=3.1e-07
+ SB=5.5e-07 SD=0 PANW1=3.6e-15 PANW2=3e-15 PANW3=3e-15 PANW4=3e-15 PANW5=3e-15
+ PANW6=2.13e-13 PANW7=5.34e-14 PANW8=2.682e-13 PANW9=4.8e-14 PANW10=7.2e-14
*
.include "/home/axon/srk180000/cad/gf65/Spring2022_lvs/INV.pex.sp.INV_TUTORIAL.pxi"
*
.ends
*
*
