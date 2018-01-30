/*
 * adc.c -- potentiometer auslesen
 *
 * (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include "adc.h"
#include "pwm.h"
#include <avr/io.h>
#include <avr/interrupt.h>

static void     adc_setup() __attribute__ ((constructor));

/**
 * \brief configure the ADC channels for the poentiometers
 */
static void     adc_setup() {
	ADMUX = (0 << REFS0) | (1 << ADLAR) | (0 << MUX0);
}

static unsigned char	current_channel = 0;

void	adc_initiate(unsigned char channel) {
	current_channel = channel;
	switch (current_channel) {
	case ADC_CHANNEL_1:
		ADMUX = (0 << REFS0) | (1 << ADLAR) | (0x2 << MUX0);
		break;
	case ADC_CHANNEL_2:
		ADMUX = (0 << REFS0) | (1 << ADLAR) | (0x3 << MUX0);
		break;
	}
	ADCSRA = (1 << ADEN) | (1 << ADSC) | (1 << ADIE) | (1 << ADPS0);
}


ISR(ADC_vect) {
	unsigned short	a = ADCH;
	ADCSRA = 0;
	switch (current_channel) {
	case ADC_CHANNEL_1:
		pwm_set(PWM_CHANNEL_P4, 255 - a);
		break;
	case ADC_CHANNEL_2:
		pwm_set(PWM_CHANNEL_P3, a);
		break;
	}
}
