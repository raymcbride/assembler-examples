#include <iostream.h>
extern "C" unsigned int power( unsigned int n, unsigned int k);
//  C requires external assembler names to be declared like this.
int main(void)
{
  unsigned int n, k, more = 1;
  char         line[80];
  while (more)
   {
     cout << "\nenter n, k : ";
     cin  >> n >> k; cin.clear(0); cin.getline( line, 79 ); if(!cin.good())break;
      // inline assembler code for   c = addit( a, b );
    cout << "n to the power of k = " << power( n,k ) << endl;
   }
  return 0;
}


