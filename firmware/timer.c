/*
 * timer.c -- timer implementation
 *
 * The tiny's timer is used to trigger ADC conversions for the potentiometers
 *
 * (c) 2018 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif /* HAVE_CONFIG_H */
#include <timer.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sfr_defs.h>
#include <avr/wdt.h>
#include <math.h>

/*
 * start the timer by using the PCK/4096 prescaler
 */
#define TIMER_STOP	(1 << CTC1) | (0x0 << CS10)
#define TIMER_START	(1 << CTC1) | (0xd << CS10)

/**
 * \brief initialize the two timers
 *
 * Timer1 is used to generate 100Hz interrupts. 
 */
static void     timer_setup() __attribute__ ((constructor));

static void	timer_setup() {
	/*
 	 * 8 bit Timer1 is used to generate 100Hz interrupts
 	 */
	GTCCR = 0;
	TCNT1 = 0;
	OCR1A = 244; // 100 Hz
	TIMSK = (1 << OCIE1A);
	TCCR1 = TIMER_STOP; // timer stopped
}

/**
 * \brief Start the timer
 *
 * depending on the current speed mode, the appropriate timer configuration
 * value is loaded into the Timer 1 configuration register.
 */
void	timer_start() {
	TCCR1 = TIMER_START;
}

/**
 * \brief Stop the timer
 *
 * The TIMER_STOP timer configuration value stops the timer
 */ 
void	timer_stop() {
	TCCR1 = TIMER_STOP;	// timer stopped
}

static unsigned char	adc_channel = 0;

/*
 * Timer related work to be done during the tiemr interrupt
 *
 * This is an inline function because there is no need to call it from
 * any other place than from the interrupt handler. Inlining it saves
 * a lot of stack space
 */
static inline void	timer_update() {
	adc_initiate(adc_channel);
	// initiate ADC conversion
	switch (adc_channel) {
	case 0:	adc_channel = 1;
		break;
	case 1:	adc_channel = 0;
		break;
	}
}

/*
 * The timer interupt calls the timer_update to initiate ADC conversions
 */
ISR(TIMER1_COMPA_vect) {
	timer_update();
	wdt_reset();
}
