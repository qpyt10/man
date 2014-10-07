/*
 * =====================================================================================
 *
 *       Filename:  main.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  12/19/2013 05:49:03 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#include <stdio.h>
#include <stdlib.h>


/*! A test class */
class Test
{
public:
/** An enum type.
* The documentation block cannot be put after the enum!
*/
enum EnumType
{
int EVal1, /**< enum value 1 */
int EVal2 /**< enum value 2 */
};
void member(); //!< a member function.
protected:
int value; /*!< an integer value */
};


int main (int argc, char **argv) {

   Test a; /* !< Detailed description after the member */

}

