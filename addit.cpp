#include <iostream.h>
extern "C" unsigned int addit( unsigned int a, unsigned int b);
//  C requires external assembler names to be declared like this.
int main(void)
{
  unsigned int a, b, c, more = 1;
  char         line[80];
  while (more)
   {
     cout << "\nenter a, b : ";
     cin  >> a >> b; cin.clear(0); cin.getline( line, 79 );
      // inline assembler code for   c = addit( a, b );
     asm
      {
        PUSH b           // PUSH PARAMETERS  RIGHT TO LEFT in C
        PUSH a
        CALL addit       // MAKE CALL
        ADD  ESP, 8      // POP PARAMETERS
        MOV  c,   EAX    // STORE RETURN VALUE
      }
    cout << "a + b = " << addit( a,b ) << endl;
   }
  return 0;
}


