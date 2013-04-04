/*
 * 
 * ============================================================================
 * =========
 * 
 * Filename:  convert_second_to_readable_string.c
 * 
 * Description:  convert second to time string, like
 * ./convert_second_to_readable_string 12 output is 00:00:12
 * 
 * 
 * Version:  1.0 Created:  2013/04/04 13时50分24秒 Revision:  none Compiler:
 * gcc
 * 
 * Author:  sunjun Organization:
 * 
 * ==============================
 * ======================================================
 */


#include	<stdlib.h>
#include	<stdio.h>
/*
 * ===  FUNCTION
 * ======================================================================
 * Name:  main Description:
 * ===========================================================================
 * ==========
 */
int
main(int argc, char *argv[])
{
	int		s = atoi(argv[1]);

	int		m = s / 60;
	int		h = m / 60;

	s = s % 60;
	m = m % 60;

	printf("%d:%02d:%02d\n", h, m, s);
	return EXIT_SUCCESS;
}				/* ----------  end of function main
				 * ---------- */
