#include<iostream.h>

unsigned int largest(unsigned int a[], unsigned int n)
{
	unsigned int b, d;
	// Assembler to compute b = largest of a[0] ... a[n] using the algorithm
	// b = a[0];
	// c = 0;
	// for (c=1; c<n; c++)
	//	{
	// 		d = a[c];
	// 		if(b < d) b=d;
	//	}

	asm
	{
		mov eax, a 				//eax = address of a[0]
		mov ebx, [eax] 			//ebx = value of a[0]
		mov ecx, 1 				//ecx = index to chug through the array
	forlabel:
		cmp ecx, n				//if ecx >= n then no more elements in a to test
		jae done
		mov edx, [eax + ecx*4]	//edx = a[ecx], whose address is eax + ecx*4
		cmp ebx, edx 			//see if current element is larger than current largest
		jae endfor				//pass on to the next elemnt if not
		mov ebx, edx			//else update the current largest
	endfor:
		inc ecx					//update the control variable
		jmp forlabel
	done:
		mov b, ebx 				//ebx is now the largest element so set b = ebx
	}
	return b;
}

int main(void) // Due to a quirk in BCC32 main must come after largest
{
	unsigned int a[10] = {2,8,7,6,5,9,0,3,1,4};
	cout << endl << "Largest int in array = " << largest(a, 10) << endl;
	return 0;
}