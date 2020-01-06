/**Created by Chris Sequeira on 9/12/19.
 * squares values
 * addition manually via memory addresses
 */
#include <stdio.h>
#include <stdlib.h>

int main() {
	int firstint = 0;
	int secondint = 0;
	int sqsum = 0;
	int ddrss = 0;

	int bytesum = 0;

	printf("Chris Sequeira\n");
	printf("Enter an integer: ");
	scanf_s("%d", &firstint);
	printf("Enter a second integer: ");
	scanf_s("%d", &secondint);

	sqsum = (firstint * firstint) + (secondint * secondint);

	printf("The sum of squares is %i\n", sqsum);

	for (size_t i = 0; i < sizeof(firstint); i++) {
		unsigned char section = *((unsigned char*)&firstint + i);
		bytesum += section;
}

	printf("The sum of bytes is %i\n", bytesum);

	return 0;
}

