/**
 * This is an example of calling an assembly function directly from C.
 * This is possible because we follow the System V ABI
 *
 * To run this, execute:
 * `gcc run_exponent.c exponent_with_function.s -o run_exponent`
 *
 */

/**
 *
 * first arg is base
 * second is exponent
 */
int exponent(int, int);
int main()
{
  return exponent(2, 7);
}
