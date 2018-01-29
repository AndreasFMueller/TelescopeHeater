/*
 * pwm.h -- PWM output
 *
 * (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#ifndef _pwm_h
#define _pwm_h

#define PWM_CHANNEL_P4	0
#define PWM_CHANNEL_P3	1

extern void	pwm_set(unsigned char channel, unsigned char duty);

#endif /* _pwm_h */
