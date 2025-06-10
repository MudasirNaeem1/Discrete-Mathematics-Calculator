
; Project Title -> DISCREAT MATHEMATICS CALCULATOR
; Group Members -> 1. MUDASIR (22K-8732)
;                  2. IRTEZA (22K-8731)

; BAI-4A 
; SPRING 2024
; Computer Organization & Assembly Language - COAL LAB  

INCLUDE Irvine32.inc

.data
input BYTE "Enter Sentence ",0
Version2 BYTE "Decrypted Version ",0
Version1 BYTE "Encrypted Version ",0
massage BYTE 60 DUP(?)
encrypted_massage BYTE 60 DUP(?)
keys BYTE 2, 4, 1, 0, 3, 5, 2, 4, 4, 6
T1 BYTE"========================================================================================================================",0
T2 BYTE"                                       DISCREATE MATHEMATICS CALCULATOR                                                       ",0
MSG1 BYTE"			1. CONVERTING SENTENCE INTO LOGIC EXPRESSION  ",0
MSG2 BYTE"			2. GENERATE SERIES ",0
MSG3 BYTE "			3. GENERATING TRUTH TABLE",0
MSG4 BYTE "			4. Caesar Encryption and Decryption",0 
MSG5 BYTE "                        5. FOR CONVERSION AND PERFORM OPERATIONS",0

hd BYTE "           4. HEXA DECIMAL into DECIMAL",0
hb BYTE "           3. HEXA DECIMAL into BINARY",0
dh1 BYTE "           2. DECIMAL into HEXA DECIMAL",0
db1 BYTE "           1. DECIMAL into BINARY",0
dAdd BYTE "           5. DECIMAL addition or subtraction",0 
hAdd BYTE "           6. HEXA DECIMAL addition or subtraction",0 
ASK BYTE "Enter Value : ",0
GET BYTE "After conversion = ",0
loopvar BYTE "How many values you want to insert : ",0
checkchoice BYTE "Enter (1) for Addotion or (2) for subraction : ",0
performed BYTE "After Operation Performed : ",0
userInput BYTE 32 DUP(?)
binaryNumber DWORD ?


QUIT BYTE "			0. QUIT",0
CHOICE BYTE"			Please Enter the Suitable Option From the Above:  ",0

OPERATION BYTE "	After Performing Selected Operation: ",0
WRONG BYTE"			WRONG INPUT!",0
SEN BYTE"		Sentence No.",0
NOTE BYTE"	To Avoid Sentence Format Error, System has defined following Sentences for you ",0
lINE BYTE"________________________________________________________________________________________________________________________",0

PREV BYTE"			11. BACK ",0
 
ENCRYPT BYTE"			1. PERFORM ENCRYPTION ON SENTENCE",0
DECRYPT BYTE"			2. PERFORM DECRYPTION ON SENTENCE",0
CRYPTOSEN BYTE 30 DUP(?)
SAVE BYTE 30 DUP(?)
DISPLAY BYTE "ENTER SENTENCE ",0


P BYTE "F",0
Q BYTE "T",0
R BYTE "F",0
TEMP1 BYTE 6 DUP(?)
TEMP BYTE 6 DUP(?)
TABLE BYTE "=========================================================================",0
TABLE1 BYTE " | ",0 
TABLE_MSG BYTE "ENTER THE EXPRESSION FOR TRUTH TABLE:",0
TABLE_MSG2 BYTE "NOTE:use <-> for BICONDITIONALS statement, -> for IMPLICATION operation, + for OR operation , . for AND operation AND don't use a variable more than once",0
TABLE_MSG3 BYTE "NOTE:It can only generate truth table of atmost three variables and atleast two variables",0
EXPRESSION BYTE 20 DUP(?)
VARIABLE_COUNT DWORD 0

FINDLOG BYTE"		Enter Sentance to Convert into Logical Expression: ",0
STATEMENT BYTE 60 DUP(?)            ;STATEMNT TO LET USER KN
STATEMENT1 BYTE 60 DUP(?)
STRING2 BYTE 100 DUP(?)                  ;STRING FROM WHERE STRING NEED TO BE SEARCHED
STR1 BYTE "AND",0
STR2 BYTE "OR",0
STR3 BYTE "IF AND ONLY IF",0	;STRING THAT NEED TO BE SEARCHED
L DWORD ?
P_EQU BYTE "LET	P = ",0
Q_EQU BYTE "	Q = ",0
PQ_AND BYTE "LOGICAL EXPRESSION:	P & Q",0
PQ_OR BYTE "LOGICAL EXPRESSION:		P V Q",0
PQ_BI BYTE "LOGICAL EXPRESSION:		P <-> Q",0
TEMP3 DWORD ?
TEMP4 DWORD ?
TEMP5 DWORD ?


promptA          BYTE "Enter the first term (a): ", 0
promptD          BYTE "Enter the common difference (d) (or ratio for GP) (r): ", 0
promptN          BYTE "Enter the number of terms (n): ", 0
promptChoice     BYTE "Enter 1 for Arithmetic Progression (AP), 2 for Geometric Progression (GP): ", 0
promptInvalid    BYTE "Invalid input! Please enter a positive number.", 13, 10, 0
comma            BYTE ",", 0
newLine          BYTE 13, 10, 0  

a                DWORD ?   
d                DWORD ?   
n                DWORD ?   

.code
	
main proc 
																											; Main Frame
MENU::
	CALL CLRSCR
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET T2 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET MSG1	 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF

	MOV EDX,OFFSET MSG2 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	
	MOV EDX,OFFSET MSG3 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET MSG4 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET MSG5 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET QUIT 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	CALL CRLF

	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
	CALL READINT
	CMP AX,1
	JE C1 
	cmp ax,2
	je c2
	CMP AX,3
	JE C3
	CMP AX,4
	JE C4
	CMP AX,5
	JE C5
	CMP AX,0
	JE BYE

	MOV EDX,OFFSET WRONG
	CALL WRITESTRING
	MOV EAX,900
	CALL DELAY
	CALL CRLF
	JMP MENU

	C1:
	CALL Sentence_To_Logic
	JMP MENU
	C2:
		call Series
		JMP MENU
	C3:
	CALL Generating_Turth_Table
	JMP MENU
	C4:
	CALL Shift_Cipher
	JMP MENU 

	C5:
	CALL Numeric_operations
	JMP MENU 
	BYE:
		EXIT
exit
main ENDP

Sentence_To_Logic PROC																				; Fuction 1. CONVERTING SENTENCE INTO LOGIC EXPRESSION 
LOCAL VAR1:BYTE

	mov eax,0
	CALL CLRSCR
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET MSG1 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF


	MOV EDX,OFFSET FINDLOG
	CALL WRITESTRING
	CALL CRLF

	CLD ; CLEAR DIRECTION FLAG
	MOV EAX,0
	MOV ESI,0
	MOV EDX,0
	MOV EDX,OFFSET STRING2
	MOV ECX,LENGTHOF STRING2

	CALL READSTRING
	INVOKE STR_UCASE, ADDR STRING2   
	CALL CRLF   
	MOV VAR1,AL
	cmp al,0
	je l101
	MAINLY:
	MOV EDX,0
	MOV EDI,OFFSET STRING2
	CMP AH,0
	JE  SET
	CMP AH,1
	JE SET1
	CMP AH,2
	JE SET2
	l101:
	MOV EDX,OFFSET WRONG
	CALL WRITESTRING
	EXIT
	
	L2:
	MOVZX ECX,VAR1
	MOV L,ECX
	L1:

	MOV AL,[ESI]
	CMP EDX,TEMP3
	JE START
	SCASB
	JZ WR
	JNZ ELS

	WR:
	INC TEMP4
	INC EDX      ;WHENEVER CHARATER EXIST EDX GET AND NOW THE OTHER CHARACTER WILL BE SEARCHED
	INC ESI
	JMP ENDING

	ELS:
	INC TEMP4
	MOV ESI,TEMP5
	MOV EDX,0
	ENDING:
	LOOP L1

	START:
	CLD	
	MOV EBX,TEMP3
	CMP EDX,EBX           ;;IN THE END THE END IF STRING EXIST STRING THAT NEED TO BE SEARCHED AND EDX WILL HAVE SAME LENGTH
	;CALL DUMPREGS
	JE EQUAL
	INC AH			;IF STRING NOT FIND
	JMP MAINLY
	MOV EDX,OFFSET STATEMENT1
	CALL WRITESTRING
	EXIT
	
	EQUAL:
	MOV BL,[EDI]
	CMP BL,40H
	JA ELS
	MOV EBX,TEMP4
	SUB EBX,TEMP3
	MOV ECX,EBX
	CLD
	MOV ESI,OFFSET STRING2	
	MOV EDI,OFFSET STATEMENT
	REP MOVSB
	MOV EDX,OFFSET P_EQU
	CALL WRITESTRING
	MOV EDX,OFFSET STATEMENT
	CALL WRITESTRING
	CALL CRLF

	CLD
	ADD EBX,TEMP4
	MOV ECX,EBX
	MOV ESI,OFFSET STRING2
	MOV EDI,OFFSET STATEMENT1
	ADD ESI,TEMP4
	REP MOVSB
	MOV EDX,OFFSET Q_EQU
	CALL WRITESTRING
	MOV EDX,OFFSET STATEMENT1
	CALL WRITESTRING
	CALL CRLF
	CMP AH,0
	JE JM_P
	CMP AH,1
	JE P1
	CMP AH,2
	JE P2
	JM_P:
	CALL CRLF
	MOV EDX,OFFSET PQ_BI
	CALL WRITESTRING
	CALL CRLF
	JMP FSQUIT
	
	P1:
	CALL CRLF
	MOV EDX,OFFSET PQ_OR
	CALL CRLF
	CALL WRITESTRING
	JMP FSQUIT
	
	P2:
	CALL CRLF
	MOV EDX,OFFSET PQ_AND
	CALL WRITESTRING
	CALL CRLF
	JMP FSQUIT

	SET:
	MOV TEMP4,0
	MOV ESI ,OFFSET STR3
	MOV TEMP3,LENGTHOF STR3-1
	MOV TEMP5,OFFSET STR3
	JMP L2
	
	SET1:
	MOV TEMP4,0
	MOV ESI,OFFSET STR2
	MOV TEMP3,LENGTHOF STR2-1
	MOV TEMP5,OFFSET STR2
	JMP L2
	
	SET2:
	MOV TEMP4,0
	MOV ESI,OFFSET STR1
	MOV TEMP3,LENGTHOF STR1-1
	MOV TEMP5,OFFSET STR1
	JMP L2






FSQUIT:

	CALL CRLF
	MOV EDX,OFFSET PREV
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET QUIT 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
	CALL READINT
	CMP	AX,11 
	JE S5
	CMP	AX,0 
	JE S6
	MOV EDX,OFFSET WRONG
	CALL WRITESTRING
	MOV EAX,900
	CALL DELAY
	CALL CRLF
	CALL Sentence_To_Logic
	ret

	S5:
	RET
	EXIT

	S6:
	EXIT




	Exit
	Sentence_To_Logic ENDP



not_operation PROC,op:PTR BYTE
	MOV ESI,op
	MOV AL,[ESI]
	CMP AL,'F'
	JE convert_to_true
	MOV AL,'F'
	MOV [ESI],AL
	JMP not_jmp

	convert_to_true:
		MOV AL,'T'
		MOV [ESI],AL

	not_jmp:
		RET

not_operation ENDP

and_operation PROC,first:BYTE,second:BYTE
	CMP first,'T'
	JE and_tes
	and_false:
		MOV AL,'F'
		RET

	and_tes:
		CMP second,'T'
		JNE and_false
		MOV AL,'T'
		RET

and_operation ENDP

or_operation PROC,first:BYTE,second:BYTE
	CMP first,'F'
	JE or_tes
	or_true:
		MOV AL,'T'
		RET

	or_tes:
		CMP second,'F'
		JNE or_true
		MOV AL,'F'
		RET

or_operation ENDP

implies_operation PROC,first:BYTE,second:BYTE
	CMP first,'T'
	JE implies_tes
	implies_true:
		MOV AL,'T'
		RET
		
	implies_tes:
		CMP second,'F'
		JNE implies_true
		MOV AL,'F'
		RET	

implies_operation ENDP

biconditional_operation PROC,first:BYTE,second:BYTE
	MOV AL,first
	CMP AL,second
	JNE biconditional_false
	MOV AL,'T'
	RET

	biconditional_false:
		MOV AL,'F'
		RET
biconditional_operation ENDP

two_variable_sol PROC,two_sol:PTR BYTE,len:DWORD,two_var1:BYTE,two_var2:BYTE
	PUSH ECX
	MOV ESI,two_sol
	MOV ECX,len
	two_so:
		MOV AL,[ESI]
		CMP AL,'+'
		JE two_or
		CMP AL,'.'
		JE two_and
		CMP AL,'<'
		JE two_bi
		CMP AL,'-'
		JE two_imp
		two_sol2:
			INC ESI
			loop two_so
			POP ECX
			RET

		two_or:
			INVOKE or_operation,two_var1,two_var2
			POP ECX
			RET

		two_and:
			INVOKE and_operation,two_var1,two_var2
			POP ECX
			RET

		two_bi:
			INVOKE biconditional_operation,two_var1,two_var2
			POP ECX
			RET

		two_imp:
			INVOKE implies_operation,two_var1,two_var2
			POP ECX
			RET

two_variable_sol ENDP

three_variable_sol PROC,exp:PTR BYTE,len:DWORD,three_var1:BYTE,three_var2:BYTE,three_var3:BYTE
						LOCAL result:BYTE
	push ECX
	MOV ESI,exp
	MOV ECX,len
	MOV EDI,OFFSET temp1
	three_sol:
		MOV AL,[ESI]
		CMP AL,'('
		JE three_two

		MOVSB

		three_jmp:
			LOOP three_sol

		


		three_two:
			PUSH EDI
			MOV EDI,OFFSET temp
			INC ESI
			PUSH ECX
			MOV ECX,3
			REP MOVSB
			POP ECX
			CMP ECX,len
			JE three_sol1
			INVOKE two_variable_sol,ADDR temp,3,three_var2,three_var3
			SUB ECX,5
			MOV result,AL
			POP EDI
			MOV AL,'Q'
			MOV [EDI],AL
			INC EDI
			INVOKE two_variable_sol,ADDR temp1,3,three_var1,result
			POP ECX
			RET

			three_sol1:
				INVOKE two_variable_sol,ADDR temp,3,three_var1,three_var2
				MOV result,AL
				SUB ECX,5
				POP EDI
				MOV AL,'P'
				MOV [EDI],AL
				INC EDI
				MOV ECX,3
				MOV ESI,exp
				ADD ESI,5
				REP MOVSB
				INVOKE two_variable_sol,ADDR temp1,3,result,three_var3
				POP ECX
				RET



three_variable_sol ENDP


;FUNCTION TO COUNT THE NUMBER OF VARIABLES IN THE EXPRESSION
count_variable PROC,exp:PTR BYTE,no:DWORD
	MOV ESI,EDX
	MOV ECX,no
	MOV EDI,0
	L1:
		MOV BL,'A' 
		MOV AL,[ESI]
		CMP AL,BL
		JAE tes
		JMP L2
		
	tes:
		MOV BL,'Z'
		MOV AL,[ESI]
		CMP AL,BL
		JBE count
		JMP L2

	count:
		INC EDI
		JMP	L2

		L2:
			INC ESI
	LOOP L1
	RET

count_variable ENDP

Generating_Turth_Table PROC																			;FUNCTION 3. GENERATING TRUTH TABLE
	
	mov eax,0
	CALL CLRSCR
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET MSG3 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	mov eax,0

	MOV EDX,OFFSET table_msg3
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF

	MOV EDX,OFFSET table_msg2
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF

	MOV EDX,OFFSET table_msg
	CALL WRITESTRING
	CALL CRLF

	MOV EDX,OFFSET expression
	MOV ECX,19
	CALL READSTRING
	INVOKE STR_UCASE,ADDR expression

	CALL STRLENGTH

	INVOKE count_variable,ADDR expression,EAX
	CMP EDI,2
	JE two_variable
	CMP EDI,3
	JE three_variable

	two_variable:
		MOV EAX,'P'
		CALL WRITECHAR
						
		MOV EDX,OFFSET table1
		CALL WRITESTRING

		MOV EAX,'Q'
		CALL WRITECHAR

		MOV EDX,OFFSET table1
		CALL WRITESTRING

		MOV EDX,OFFSET expression
		CALL WRITESTRING
		CALL CRLF

		MOV EDX,OFFSET table
		CALL WRITESTRING
		CALL CRLF

		MOV ECX,2
			two_outer:
				push ECX
				MOV ECX,2

					two_inner:
						MOV AL,P
						CALL WRITECHAR

						MOV EDX,OFFSET table1
						CALL WRITESTRING

						MOV AL,Q
						CALL WRITECHAR

						MOV EDX,OFFSET table1
						CALL WRITESTRING

						;CALCULATE
						MOV EDX,OFFSET expression
						CALL STRLENGTH
						MOV EBX,EAX
						INVOKE two_variable_sol,ADDR expression,EBX,P,Q
						CALL WRITECHAR
						CALL CRLF

						INVOKE not_operation,ADDR Q
					LOOP two_inner

					POP ECX
					INVOKE not_operation,ADDR P
					DEC ECX
					CMP ECX,0
					JNE two_outer
					MOV EAX,900
	MOV EDX,OFFSET PREV
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET QUIT 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
	CALL READINT
	CMP	AX,11 
	JE S5
	CMP	AX,0 
	JE S6
	MOV EDX,OFFSET WRONG
	CALL WRITESTRING
	MOV EAX,900
	CALL DELAY
	CALL CRLF
	CALL Generating_Turth_Table
	ret

	S5:
	RET
	EXIT

	S6:
	EXIT
				RET
							 
	three_variable:
		MOV EAX,'P'
		CALL WRITECHAR
						
		MOV EDX,OFFSET table1
		CALL WRITESTRING

		MOV EAX,'Q'
		CALL WRITECHAR

		MOV EDX,OFFSET table1
		CALL WRITESTRING

		MOV EAX,'R'
		CALL WRITECHAR

		MOV EDX,OFFSET table1
		CALL WRITESTRING

		MOV EDX,OFFSET expression
		CALL WRITESTRING
		CALL CRLF

		MOV EDX,OFFSET table
		CALL WRITESTRING
		CALL CRLF

		MOV ECX,2
			three_outer:
				PUSH ECX
				MOV ECX,2
				three_inner1:
					push ECX
					MOV ECX,2

						three_inner:
							MOV AL,P
							CALL WRITECHAR

							MOV EDX,OFFSET table1
							CALL WRITESTRING

							MOV AL,Q
							CALL WRITECHAR

							MOV EDX,OFFSET table1
							call WRITESTRING

							MOV AL,R
							CALL WRITECHAR

							MOV EDX,OFFSET table1
							CALL WRITESTRING

							MOV EDX,OFFSET expression
							CALL STRLENGTH

							MOV EBX,EAX

							INVOKE three_variable_sol,ADDR expression,EBX,P,Q,R
							CALL WRITECHAR
						
							CALL CRLF

							INVOKE not_operation,ADDR R
						LOOP three_inner

						POP ECX
						INVOKE not_operation,ADDR Q
					DEC ECX
					CMP ECX,0
					JNE three_inner1

					POP ECX
					INVOKE not_operation,ADDR P
					DEC ECX
					CMP ECX,0
			JNE three_outer

	MOV EDX,OFFSET PREV
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET QUIT 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
	CALL READINT
	CMP	AX,11 
	JE TTS5
	CMP	AX,0 
	JE TTS6
	MOV EDX,OFFSET WRONG
	CALL WRITESTRING
	MOV EAX,900
	CALL DELAY
	CALL CRLF
	CALL Generating_Turth_Table
	ret

	TTS5:
	RET
	EXIT

	TTS6:
	EXIT

	RET
Generating_Turth_Table ENDP


	
Shift_Cipher PROC																								;Fuction 4. Caesar’s Encryption and Decryption 
local var:byte

	mov eax,0
	CALL CLRSCR
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET MSG4 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET ENCRYPT
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET	DECRYPT
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
		
	call ReadInt
	cmp al,1
	je doEncrypt
	cmp al,2
	je doDecrypt

	doEncrypt:
	push ebp
			lea edx,input
			call WriteString
			call crlf

			lea edx,massage
			mov ecx,60
			call ReadString
			lea esi,massage	
			lea edi,encrypted_massage
			mov edx,ecx
			while2:
				cmp edx,0
				je exit1
				sub edx,10
				mov ebx,10
				mov ebp,0
				while1:
					cmp ebx,0
					je while2
					mov cl,keys[ebp]
					cmp cl,0
					je skip
					ja rotateRight
					jb rotateLeft
					skip:
					mov al,[esi]
					mov [edi],al

					add esi,1
					add edi,1
					sub ebx,1
					add ebp,1
					jmp while1
					rotateRight:
					mov al,[esi]
					ror al,cl
					mov [edi],al
					add esi,1
					add edi,1
					add ebp,1
					sub ebx,1
					jmp while1
					rotateLeft:
					mov al,[esi]
					rol al,cl
					mov [edi],al
					add esi,1
					add edi,1
					add ebp,1
					sub ebx,1
					jmp while1
					exit1:
					
					call crlf
					mov edx,OFFSET version1
					call WriteString
					call crlf
					
					call crlf
					mov edx,OFFSET encrypted_massage
					call WriteString
					call crlf
					call crlf
					call crlf
				 
				  MOV EDX,OFFSET PREV
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET QUIT 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
		
	call readint
	CMP AL,0
	JE EDS2
	pop ebp
	ret





			doDecrypt:
			push ebp
					lea edx,input
					call WriteString
					call crlf

					lea edx,massage

					mov ecx,60
					call ReadString

					lea esi,massage	
					lea edi,encrypted_massage
					mov edx,ecx
					while4:
		cmp edx,0
		je exit2
		sub edx,10
		mov ebx,10
		mov ebp,0
		while3:
			cmp ebx,0
			je while4
			mov cl,keys[ebp]
			cmp cl,0
			je skip1
			ja rotateLeft1
			jb rotateRight1
			skip1:
			mov al,[esi]
			mov [edi],al

			add esi,1
			add edi,1
			sub ebx,1
			add ebp,1
			jmp while3
			rotateRight1:
			mov al,[esi]
			ror al,cl
			mov [edi],al
			add esi,1
			add edi,1
			add ebp,1
			sub ebx,1
			jmp while3
			rotateLeft1:
			mov al,[esi]
			rol al,cl
			mov [edi],al
			add esi,1
			add edi,1
			add ebp,1
			sub ebx,1
			jmp while3
			exit2:
			call crlf
			call crlf
			mov edx,OFFSET Version2
			call WriteString
			call crlf
			call crlf
			call crlf
			mov edx,OFFSET encrypted_massage
			call WriteString
			call crlf
					call crlf
					call crlf
					
	 MOV EDX,OFFSET PREV
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET QUIT 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
		
	call readint
	CMP AL,0
	JE EDS2
	pop ebp
	ret
	

	 

	

	EDS2:
	EXIT
	RET



Shift_Cipher ENDP																				
Series PROC

	CALL CLRSCR
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET MSG2
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF

mov edx, OFFSET promptA
    call WriteString
    call ReadInt
    mov a, eax

    mov edx, OFFSET promptD
    call WriteString
    call ReadInt
    mov d, eax

    mov edx, OFFSET promptN
    call WriteString
    call ReadInt
    mov n, eax
    cmp eax, 0
    jle invalid_input

    mov edx, OFFSET promptChoice
    call WriteString
    call ReadInt
    mov choice, AL
    cmp eax, 1
    jl invalid_input
    cmp eax, 2
    jg invalid_input

    mov ecx, 0
    mov ebx, a

generate_series:
    mov eax, ebx
    call WriteDec         

    inc ecx               
    cmp ecx, n
    jge finish_series     

    mov edx, OFFSET comma
    call WriteString

    cmp choice, 1         
    je compute_ap
    jmp compute_gp

compute_ap:
    add ebx, d            
    jmp continue_loop

compute_gp:
    imul ebx, d           
    jmp continue_loop

continue_loop:
    jmp generate_series   

finish_series:
    mov edx, OFFSET newLine
    call WriteString
    jmp exit_program

invalid_input:
    mov edx, OFFSET promptInvalid
    call WriteString

exit_program:
    JMP FSQUIT
FSQUIT:

	CALL CRLF
	MOV EDX,OFFSET PREV
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET QUIT 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
	CALL READINT
	CMP	AX,11 
	JE S5
	CMP	AX,0 
	JE S6

	S5:
	RET
	EXIT

	S6:
	EXIT


	Series ENDP

Numeric_operations PROC
	mov eax,0
	CALL CLRSCR
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET MSG5 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET T1 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET db1 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET dh1	 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET hb	 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET hd	 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET dAdd	 
	CALL WRITESTRING
	CALL CRLF
	MOV EDX,OFFSET hAdd	 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE	 
	CALL WRITESTRING
	CALL READINT
	CALL CRLF
	CALL CRLF

	CMP EAX, 1
	JE decimal_to_binary
	CMP EAX, 2
	JE decimal_to_hexadecimal
	CMP EAX, 3
	JE hexadecimal_to_binary
	CMP EAX, 4
	JE hexadecimal_to_decimal
	CMP EAX, 5
	JE d_procedure
	CMP EAX, 6
	JE h_procedure
	MOV EDX,OFFSET WRONG
	CALL WRITESTRING
	MOV EAX,900
	CALL DELAY
	CALL CRLF
	JMP MENU
	RET

	decimal_to_binary:
		MOV EDX,OFFSET ASK	 
		CALL WRITESTRING
		CALL READDEC
		CALL CRLF
		MOV EDX,OFFSET GET	 
		CALL WRITESTRING
		MOV EBX, EAX
		CALL WRITEBIN
		JMP FSQUIT

	decimal_to_hexadecimal:
		MOV EDX,OFFSET ASK	 
		CALL WRITESTRING
		CALL READDEC
		CALL CRLF
		MOV EDX,OFFSET GET	 
		CALL WRITESTRING
		MOV EBX, EAX
		CALL WRITEHEX
		JMP FSQUIT
	hexadecimal_to_binary:
		MOV EDX,OFFSET ASK	 
		CALL WRITESTRING
		CALL READHEX
		CALL CRLF
		MOV EDX,OFFSET GET	 
		CALL WRITESTRING
		MOV EBX, EAX
		CALL WRITEBIN
		JMP FSQUIT
	hexadecimal_to_decimal:
		MOV EDX,OFFSET ASK	 
		CALL WRITESTRING
		CALL READHEX
		CALL CRLF
		MOV EDX,OFFSET GET	 
		CALL WRITESTRING
		MOV EBX, EAX
		CALL WRITEDEC
		JMP FSQUIT

		d_procedure:
		MOV EDX,OFFSET checkchoice	 
		CALL WRITESTRING
		CALL READINT
		CMP EAX,1
		JE DO_ADDITION1
		CMP EAX,2
		JE DO_SUBTRACTION1

		DO_ADDITION1:
		MOV EBX,0
		MOV EDX,OFFSET loopvar	 
		CALL WRITESTRING
		CALL READINT
		MOV ECX, EAX
		LoopL2:
			MOV EDX,OFFSET ASK	 
		    CALL WRITESTRING
			CALL READDEC
			ADD EBX,EAX  
			CALL CRLF
			loop LoopL2
			MOV EDX,OFFSET performed	 
			CALL WRITESTRING
			MOV EAX, EBX
			CALL WRITEDEC
			CALL CRLF
			JMP FSQUIT

		DO_SUBTRACTION1:
			MOV EDX,OFFSET ASK	 
		    CALL WRITESTRING
			CALL READDEC
			MOV EBX,EAX
			MOV EAX,0
			MOV EDX,OFFSET ASK	 
		    CALL WRITESTRING
			CALL READDEC
			MOV ECX,EAX
			CALL CRLF
			MOV EDX,OFFSET performed	 
			CALL WRITESTRING
			SUB EBX, ECX
			MOV EAX, EBX
			CALL WRITEDEC
			CALL CRLF
			JMP FSQUIT


		h_procedure:
		MOV EDX,OFFSET checkchoice	 
		CALL WRITESTRING
		CALL READINT
		CMP EAX,1
		JE DO_ADDITION2
		CMP EAX,2
		JE DO_SUBTRACTION2

		DO_ADDITION2:
		MOV EBX,0
		MOV EDX,OFFSET loopvar	 
		CALL WRITESTRING
		CALL READINT
		MOV ECX, EAX
		LoopL3:
			MOV EDX,OFFSET ASK	 
		    CALL WRITESTRING
			CALL READHEX
			ADD EBX,EAX  
			CALL CRLF
			loop LoopL3
			MOV EDX,OFFSET performed	 
			CALL WRITESTRING
			MOV EAX, EBX
			CALL WRITEHEX
			CALL CRLF
			JMP FSQUIT

		DO_SUBTRACTION2:
			MOV EDX,OFFSET ASK	 
		    CALL WRITESTRING
			CALL READHEX
			MOV EBX,EAX 
			MOV EAX,0
			MOV EDX,OFFSET ASK	 
		    CALL WRITESTRING
			CALL READHEX
			MOV ECX, EAX
			CALL CRLF
			MOV EDX,OFFSET performed	 
			CALL WRITESTRING
			SUB EBX,ECX
			MOV EAX,EBX
			CALL WRITEHEX
			CALL CRLF
			JMP FSQUIT

FSQUIT:

	CALL CRLF
	MOV EDX,OFFSET PREV
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET QUIT 
	CALL WRITESTRING
	CALL CRLF
	CALL CRLF
	MOV EDX,OFFSET CHOICE 
	CALL WRITESTRING
	CALL READINT
	CMP	AX,11 
	JE S5
	CMP	AX,0 
	JE S6

	S5:
	RET
	EXIT

	S6:
	EXIT

Numeric_operations ENDP

END main