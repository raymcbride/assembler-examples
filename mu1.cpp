#include<iostream.h>
int main(void)
{
	unsigned int a, b, c;
	cout << "\nEnter a and b :";
	cin >> a >> b;
	// Assembler to compute c = a * b using the algorithm
	// c = 0;
	// while (b!=0) { c+=a; b--;}

	asm
		{
			mov eax, a // eax = a
			mov ebx, b // ebx = b
			mov ecx, 0 // c = 0 using ecx for variable c
	whilelab:
			cmp ebx, 0
			je done // if ebx = 0 goto done
			add ecx, eax // ecx = ecx + eax
			dec ebx // ebx = ebx - 1
			jmp whilelab // goto whilelab
	done:
			mov c, ecx // c = ecx
		}
		cout << "a * b = " << c << endl;
		return 0;
	}