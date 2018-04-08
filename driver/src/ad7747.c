/***************************************************************************//**
 *   @file   AD7747.c
 *   @brief  Implementation of AD7747 Driver.
 *   @author Alex Zhang (zhangyuanchao@mysentech.com)
********************************************************************************
 * Copyright 2017(c) Minyuan Sensing Tech, Inc.
*******************************************************************************/

/******************************************************************************/
/* Include Files                                                              */
/******************************************************************************/
#include "ad7747.h"

/***************************************************************************//**
 * @brief Initializes the I2C communication peripheral.
 *
 * @return status - The result of the I2C initialization.
 *                  Example: 0 - Initialization failed;
 *                           1 - Initialization succeeded.
*******************************************************************************/
unsigned char AD7747_Init(void)
{
    unsigned char status = 0;
    
    //status = I2C_Init();
    
    return status;
}

/***************************************************************************//**
 * @brief Writes data into AD7747 registers, starting from the selected
 *        register address pointer.
 *
 * @param subAddr - The selected register address pointer.
 * @param dataBuffer - Pointer to a buffer storing the transmission data.
 * @param bytesNumber - Number of bytes that will be sent.
 *
 * @return None.
*******************************************************************************/
void AD7747_Write(unsigned char subAddr,
                  unsigned char* dataBuffer,
                  unsigned char bytesNumber)
{
    unsigned char sendBuffer[10] = {0, };
    unsigned char byte = 0;
    
    sendBuffer[0] = subAddr;
    for(byte = 1; byte <= bytesNumber; byte++)
    {
        sendBuffer[byte] = dataBuffer[byte - 1];
    }
/*    I2C_Write(AD7747_ADDRESS,
              sendBuffer,
              bytesNumber + 1,
              1);*/
}

/***************************************************************************//**
 * @brief Reads data from AD7747 registers, starting from the selected
 *        register address pointer.
 *
 * @param subAddr - The selected register address pointer.
 * @param dataBuffer - Pointer to a buffer that will store the received data.
 * @param bytesNumber - Number of bytes that will be read.
 *
 * @return None.
*******************************************************************************/
void AD7747_Read(unsigned char subAddr,
                 unsigned char* dataBuffer,
                 unsigned char bytesNumber)
{
 /*   I2C_Write(AD7747_ADDRESS,
              (unsigned char*)&subAddr,
              1,
              0);
    I2C_Read(AD7747_ADDRESS,
             dataBuffer,
             bytesNumber,
             1); */
}

/***************************************************************************//**
 * @brief Resets the AD7747.
 *
 * @return None
*******************************************************************************/
void AD7747_Reset(void)
{
    unsigned char cmd = 0;
    
    cmd = AD7747_RESET_CMD;
   /* I2C_Write(AD7747_ADDRESS,
              (unsigned char*)&cmd,
              1,
              1); */
}

/***************************************************************************//**
 * @brief Waits until a conversion on a voltage/temperature channel has been
 *        finished and returns the output data.
 *
 * @return capData - The content of the VT Data register.
*******************************************************************************/
unsigned long AD7747_GetVTData(void)
{
    unsigned char receiveBuffer[3] = {0, 0, 0};
    unsigned long vtData = 0;
    
    receiveBuffer[0] = AD7747_STATUS_RDYVT;
    while(!(receiveBuffer[0] & AD7747_STATUS_RDYVT))
    {
        AD7747_Read(AD7747_REG_STATUS,
                    receiveBuffer,
                    1);
    }
    AD7747_Read(AD7747_REG_VT_DATA_HIGH,
                receiveBuffer,
                3);
    vtData = ((unsigned long)receiveBuffer[0] << 16) +
             ((unsigned short)receiveBuffer[1] << 8) +
             receiveBuffer[0];
    
    return vtData;
}

/***************************************************************************//**
 * @brief Waits until a conversion on a capacitive channel has been finished and
 *        returns the output data.
 *
 * @return capData - The content of the Cap Data register.
*******************************************************************************/
unsigned long AD7747_GetCapData(void)
{
    unsigned char receiveBuffer[3] = {0, 0, 0};
    unsigned long capData = 0;
    
    receiveBuffer[0] = AD7747_STATUS_RDYCAP;
    while(!(receiveBuffer[0] & AD7747_STATUS_RDYCAP))
    {
        AD7747_Read(AD7747_REG_STATUS,
                    receiveBuffer,
                    1);
    }
    AD7747_Read(AD7747_REG_CAP_DATA_HIGH,
                receiveBuffer,
                3);
    capData = ((unsigned long)receiveBuffer[0] << 16) +
              ((unsigned short)receiveBuffer[1] << 8) +
              receiveBuffer[0];
    
    return capData;
}
