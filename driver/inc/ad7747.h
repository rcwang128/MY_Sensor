/***************************************************************************//**
 *   @file   AD7747.h
 *   @brief  Header file of AD7747 Driver.
 *   @author Alex Zhang (zhangyuanchao@mysentech.com)
********************************************************************************
 * Copyright 2017(c) Minyuan Sensing Tech, Inc.
*******************************************************************************/

#ifndef _AD7747_H_
#define _AD7747_H_

/******************************************************************************/
/* Include Files                                                              */
/******************************************************************************/

/******************************************************************************/
/* AD7747                                                                     */
/******************************************************************************/
/* AD7747 Slave Address */
#define AD7747_ADDRESS                  0x48

/* AD7747 Slave Address */
#define AD7747_RESET_CMD                0xBF

/* AD7747 Register Definition */
#define AD7747_REG_STATUS				0
#define AD7747_REG_CAP_DATA_HIGH		1
#define AD7747_REG_CAP_DATA_MID			2
#define AD7747_REG_CAP_DATA_LOW			3
#define AD7747_REG_VT_DATA_HIGH			4
#define AD7747_REG_VT_DATA_MID			5
#define AD7747_REG_VT_DATA_LOW			6
#define AD7747_REG_CAP_SETUP			7
#define AD7747_REG_VT_SETUP				8
#define AD7747_REG_EXC_SETUP			9
#define AD7747_REG_CFG					10
#define AD7747_REG_CAPDACA				11
#define AD7747_REG_CAPDACB				12
#define AD7747_REG_CAP_OFFH				13
#define AD7747_REG_CAP_OFFL				14
#define AD7747_REG_CAP_GAINH			15
#define AD7747_REG_CAP_GAINL			16
#define AD7747_REG_VOLT_GAINH			17
#define AD7747_REG_VOLT_GAINL			18

/* AD7747_REG_STATUS bits */
#define AD7747_STATUS_EXCERR			(1 << 3)
#define AD7747_STATUS_RDY				(1 << 2)
#define AD7747_STATUS_RDYVT				(1 << 1)
#define AD7747_STATUS_RDYCAP			(1 << 0)

/* AD7747_REG_CAP_SETUP bits */
#define AD7747_CAPSETUP_CAPEN			(1 << 7)
#define AD7747_CAPSETUP_CIN2			(1 << 6)
#define AD7747_CAPSETUP_CAPDIFF			(1 << 5)
#define AD7747_CAPSETUP_CACHOP			(1 << 0)

/* AD7747_REG_VT_SETUP bits */
#define AD7747_VTSETUP_VTEN				(1 << 7)
#define AD7747_VTSETUP_VTMD_INT_TEMP	(0 << 5)
#define AD7747_VTSETUP_VTMD_EXT_TEMP	(1 << 5)
#define AD7747_VTSETUP_VTMD_VDD_MON		(2 << 5)
#define AD7747_VTSETUP_VTMD_EXT_VIN		(3 << 5)
#define AD7747_VTSETUP_EXTREF			(1 << 4)
#define AD7747_VTSETUP_VTSHORT			(1 << 1)
#define AD7747_VTSETUP_VTCHOP			(1 << 0)

/* AD7747_REG_EXC_SETUP bits */
#define AD7747_EXCSETUP_CLKCTRL			(1 << 7)
#define AD7747_EXCSETUP_EXCON			(1 << 6)
#define AD7747_EXCSETUP_EXCB			(1 << 5)
#define AD7747_EXCSETUP_NEXCB			(1 << 4)
#define AD7747_EXCSETUP_EXCA			(1 << 3)
#define AD7747_EXCSETUP_NEXCA			(1 << 2)
#define AD7747_EXCSETUP_EXCLVL(x)		(((x) & 0x3) << 0)

/* AD7747_REG_CFG bits */
#define AD7747_CONF_VTFS(x)				(((x) & 0x3) << 6)
#define AD7747_CONF_CAPFS(x)			(((x) & 0x7) << 3)
#define AD7747_CONF_MODE_IDLE			(0 << 0)
#define AD7747_CONF_MODE_CONT_CONV		(1 << 0)
#define AD7747_CONF_MODE_SINGLE_CONV	(2 << 0)
#define AD7747_CONF_MODE_PWRDN			(3 << 0)
#define AD7747_CONF_MODE_OFFS_CAL		(5 << 0)
#define AD7747_CONF_MODE_GAIN_CAL		(6 << 0)

/* AD7747_REG_CAPDACx bits */
#define AD7747_CAPDAC_DACEN				(1 << 7)
#define AD7747_CAPDAC_DACP(x)			((x) & 0x7F)

/******************************************************************************/
/* Functions Prototypes                                                       */
/******************************************************************************/

/* Initializes the I2C communication peripheral. */
unsigned char AD7747_Init(void);
/* Writes data into AD7747 registers, starting from the selected register
   address pointer. */
void AD7747_Write(unsigned char subAddr,
                  unsigned char* dataBuffer,
                  unsigned char bytesNumber);
/* Reads data from AD7747 registers, starting from the selected register
   address pointer. */
void AD7747_Read(unsigned char subAddr,
                 unsigned char* dataBuffer,
                 unsigned char bytesNumber);
/* Resets the AD7747. */
void AD7747_Reset(void);
/* Waits until a conversion on a voltage/temperature channel has been finished
   and returns the output data. */
unsigned long AD7747_GetVTData(void);
/* Waits until a conversion on a capacitive channel has been finished and
   returns the output data. */
unsigned long AD7747_GetCapData(void);

#endif // _AD7747_H
