/*
 * timer.h -- timer configuration
 *
 * (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#ifndef _timer_h
#define _timer_h

/**
 * \brief clock frequence of the processor, 1MHz
 */
#define F_CPU	1000000L

extern void	timer_start();
extern void	timer_stop();

#endif /* _timer_h */
