/*
 * adc.h -- Potentiometer auslesen
 *
 * (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#ifndef _adc_h
#define _adc_h

#define ADC_CHANNEL_1	0
#define ADC_CHANNEL_2	1

/*
 * The ADC inputs are assigned as follows
 *
 * RV1 -> ADC3(PB3)   controls heater output P4 (PB1, OC0B, OC1A)
 * RV2 -> ADC2(PB4)   controls heater output P3 (PB0, OC0A)
 */

/**
 * \brief initiate ADC conversion
 */
void	adc_initate(unsigned char channel);

#endif /* _adc_h */
