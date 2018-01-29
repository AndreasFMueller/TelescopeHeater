/*
 * heater.c -- main function of the heater firmware
 *
 * (c) 2015 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif /* HAVE_CONFIG_H */
#include <avr/wdt.h>
#include <avr/interrupt.h>
#include <timer.h>
#include <pwm.h>
#include <util/delay.h>

/**
 * \brief Main function for the heater
 */
int	main(int argc, char *argv[]) {
	// initialize
	pwm_set(PWM_CHANNEL_P4, 0);
	pwm_set(PWM_CHANNEL_P3, 0);

	// enable interrupts
	sei();

	// start the timer
	timer_start();

	// guider port main function, infinite loop
	for (;;) {
	}
}

void wdt_init(void) __attribute__((naked)) __attribute__((section(".init3")));

void wdt_init(void) {
	MCUSR = 0;
	wdt_disable();
}
