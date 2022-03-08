* File: /home/axon/srk180000/cad/gf65/Spring2022_lvs/INV.pex.sp
* Created: Mon Mar  7 19:41:52 2022
* Program "Calibre xRC"
* Version "v2013.2_18.13"
* 
.include "/home/axon/srk180000/cad/gf65/Spring2022_lvs/INV.pex.sp.pex"
.subckt INV  GND! OUT VDD! IN
* 
* IN	IN
* VDD!	VDD!
* OUT	OUT
* GND!	GND!
XD0_noxref N_GND!_D0_noxref_pos N_VDD!_D0_noxref_neg DIODENWX  AREA=4.5717e-12
+ PERIM=9.16e-06
XMMN0 N_OUT_MMN0_d N_IN_MMN0_g N_GND!_MMN0_s N_GND!_D0_noxref_pos NFET L=6e-08
+ W=1e-06 AD=5.5e-13 AS=3.1e-13 PD=3.1e-06 PS=2.62e-06 NRD=0.365 NRS=0.135 M=1
+ NF=1 CNR_SWITCH=0 PCCRIT=0 PAR=1 PTWELL=0 SA=3.1e-07 SB=5.5e-07 SD=0 PANW1=0
+ PANW2=1.8e-15 PANW3=3e-15 PANW4=3e-15 PANW5=3e-15 PANW6=6e-15 PANW7=1.2e-14
+ PANW8=1.2e-14 PANW9=1.92e-14 PANW10=0
XMMP0 N_OUT_MMP0_d N_IN_MMP0_g N_VDD!_MMP0_s N_VDD!_D0_noxref_neg PFET L=6e-08
+ W=2e-06 AD=1.1e-12 AS=6.2e-13 PD=5.1e-06 PS=4.62e-06 NRD=0.1825 NRS=0.0675 M=1
+ NF=1 CNR_SWITCH=1 PCCRIT=0 PAR=1 PTWELL=1 SA=3.1e-07 SB=5.5e-07 SD=0
+ PANW1=3.6e-15 PANW2=3e-15 PANW3=3e-15 PANW4=3e-15 PANW5=3e-15 PANW6=1.06e-13
+ PANW7=3.2e-14 PANW8=1.398e-13 PANW9=4.8e-14 PANW10=7.2e-14
*
.include "/home/axon/srk180000/cad/gf65/Spring2022_lvs/INV.pex.sp.INV.pxi"
*
.ends
*
*
