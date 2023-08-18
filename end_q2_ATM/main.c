#include <at89c5131.h>
#include "endsem.h"

char S_str[6]= {0,0,0,0,0,0};   //String for Balance Sita
char G_str[6] = {0,0,0,0,0,0};  //String for Balance Gita
char n500_s[3]= {0,0,0};    // STRING FOR 500RS NOTE
char n100_s[3]= {0,0,0};    // STRING FOR 100RS NOTE

char password[5] = {0,0,0,0,0} ;   //PASSWORD ARRAY
//Main function

//-------------------------------------------------
void main(void)
{
	unsigned char ch=0;
	
	uart_init();            // Please finish this function in endsem.h

	
	transmit_string("Press A for Account display and W for withdrawing cash\r\n");
	
    while (1)
    {
			ch = receive_char();
																								/* code */
		switch(ch)
		{
			case 'A':transmit_string("Hello, Please enter Account Number\r\n");
								 break;	
			case 'a':transmit_string("Hello, Please enter Account Number\r\n");
								 break;
			default:transmit_string("No such account, please enter valid details\r\n");
								 break;
		
			
			case '1':transmit_string("Account Holder: Sita\r\n");
							 transmit_string("Account Balance: 10000\r\n");
								 break;																							
			case '2':transmit_string("Account Holder: Gita\r\n");
							 transmit_string("Account Balance: 10000\r\n");
								 break;
			
  
			case 'W':transmit_string("Withdraw state, enter account number\r\n");
								 break;	
			case 'w':transmit_string("Withdraw state, enter account number\r\n");
								 break;
			
							
		
			 case '3':transmit_string("Enter Amount, in hundreds\r\n");
				break;
								
								
			
								 
				 case '4':transmit_string("Enter Amount, in hundreds\r\n");
				break;
								
																	
								transmit_string("Remaining balance: \r\n");
								transmit_string("500 Notes:   100 Notes: \r\n")	;							
											
		}
		}
}


