funk PROC 
   FLD ST(1)
   FSIN
   FLD ST(0)
   FMUL ST(0), ST(0)
   FMUL ST(0), ST(1)
   FFREE ST(1)
   FMUL ST(0), ST(3)
   FFREE ST(3)
   FDIV ST(0), ST(2)
   FFREE ST(2)
   RET
funk ENDP