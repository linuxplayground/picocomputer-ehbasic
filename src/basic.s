; Enhanced BASIC to assemble under CC65, $ver 2.22p5

; $E7E1 $E7CF $E7C6 $E7D3 $E7D1 $E7D5 $E7CF $E81E $E825

; 2.00      new revision numbers start here
; 2.01      fixed LCASE$() and UCASE$()
; 2.02      new get value routine done
; 2.03      changed RND() to galoise method
; 2.04      fixed SPC()
; 2.05      new get value routine fixed
; 2.06      changed USR() code
; 2.07      fixed STR$()
; 2.08      changed INPUT and READ to remove need for $00 start to input buffer
; 2.09      fixed RND()
; 2.10      integrated missed changes from an earlier version
; 2.20      added ELSE to IF .. THEN and fixed IF .. GOTO <statement> to cause error
; 2.21      fixed IF .. THEN RETURN to not cause error
; 2.22      fixed RND() breaking the get byte routine
; 2.22p     patched to disable use of decimal mode and fix Ibuff issues
;              (bugsnquirks.txt notes 2, 4 and 5)
;              tabs converted to spaces, tabwidth=6
; 2.22p2    fixed can't continue error on 1st statement after direct mode
;              changed INPUT to throw "break in line ##" on empty line input
; 2.22p3    fixed RAM above code / Ibuff above EhBASIC patch breaks STR$()
;              fix provided by github user mgcaret
; 2.22p4    fixed string compare of equal strings in direct mode returns FALSE
;              fixed FALSE stored to a variable after a string compare
;                 is > 0 and < 1E-16
;              added additional stack floor protection for background interrupts
;              fixed conditional LOOP & NEXT cannot find their data strucure on stack
; 2.22p5    fixes issues reported by users Ruud and dclxvi on the 6502.org forum
;      5.0     http://forum.6502.org/viewtopic.php?f=5&t=5500
;              sanity check for RAM top allows values below RAM base
;      5.1-7   http://forum.6502.org/viewtopic.php?f=5&t=5606
;              1-7 coresponds to the bug# in the thread
;      5.1     TO expression with a subtract may evaluate with the sign bit flipped
;      5.3     call to LAB_1B5B may return to an address -$100 (page not incremented)
;      5.4     string concatenate followed by MINUS or NOT() crashes EhBASIC
;      5.5     garbage collection may cause an overlap with temporary strings
;      5.6     floating point multiply rounding bug
;      5.7     VAL() may cause string variables to be trashed
;      6.0     add klaus2m5's mixed case mode. (https://github.com/Klaus2m5/6502_EhBASIC_V2.22/blob/master/mixed_case_keywords_mod.txt)

.org     $D000

.include "rp6502.inc"
.include "zp.inc"
.include "init.s"
.include "lang.s"
