/*
 * pwm.c -- PWM output
 *
 * (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include <avr/io.h>
#include "pwm.h"

/**
 * \brief initialize the PWM
 */
static void     pwm_setup() __attribute__ ((constructor));

static void	pwm_setup() {
	// configure PB0 and PB1 as outputs
	DDRB |= (1 << PB0) | (1 << PB1);
	// initialize the PWM counter
	TCNT0 = 0;
	OCR0A = 64;	// start with 50% duty cycle
	OCR0B = 196;	// start with 50% duty cycle
	// configure fast PWM mode
	TCCR0A = (0x2 << COM0A0) | (0x2 << COM0B0) | 0x3;
	TCCR0B = (0 << WGM02) | 0x2; // prescaler  clk/1024 (starts timer)
}

void	pwm_set(unsigned char channel, unsigned char value) {
	switch (channel) {
	case PWM_CHANNEL_P4:
		OCR0A = value;
		break;
	case PWM_CHANNEL_P3:
		OCR0B = value;
		break;
	}
}
