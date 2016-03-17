#include<iostream.h>
extern "C" unsigned int divmod(unsigned int a, unsigned int b, unsigned int& c);
int main(void)
{
	unsigned int a, b, c, d;
	unsigned int* addressc = &c; // now PUSH address c will pass the address of c
	cout << "\nenter a, b : "; cin >> a >> b;

	_asm
		{
			PUSH addressc
			PUSH b
			PUSH a
			CALL divmod
			ADD ESP, 12
			MOV d, EAX

		}
	cout << "a/b = " << d << " : a%b= " << c << endl;
	return 0;
}