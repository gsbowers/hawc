;+
; Procedure: get_scaler_lookup
;
; Purpose: This is a translation of Dirk Lennarz python code into 
;          IDL to generate a scaler lookup table for HAWC (the 
;          High-Altitude Water Cherenkov Observatory) detectors  
;          
; Example: 
;    IDL> s = get_scaler_lookups(1313)
;    % Compiled module: GET_SCALER_LOOKUPS.
;    IDL> help, s
;    ** Structure <aed538>, 10 tags, length=10240, data length=10240,refs=1:
;       S70             STRING    Array[64]
;       S69             STRING    Array[64]
;       S68             STRING    Array[64]
;       S71             STRING    Array[64]
;       S72             STRING    Array[64]
;       S73             STRING    Array[64]
;       S76             STRING    Array[64]
;       S75             STRING    Array[64]
;       S74             STRING    Array[64]
;       S77             STRING    Array[64]
;
;    IDL> print, s.S69
;    E18 A E18 B E18 C E18 D F17 A F17 B F17 C F17 D F16 A F16 B F16 C F16 D G16 A
;    G16 B G16 C G16 D F15 A F15 B F15 C F15 D G15 A G15 B G15 C G15 D F14 A F14 B
;    F14 C F14 D G14 A G14 B G14 C G14 D F13 A F13 B F13 C F13 D G13 A G13 B G13 C
;    G13 D F12 A F12 B F12 C F12 D G12 A G12 B G12 C G12 D F11 A F11 B F11 C F11 D
;    G11 A G11 B G11 C G11 D H15 A H15 B H15 C H15 D H14 A H14 B H14 C H14 D
;
;    IDL> print, s.S71
;    M20 A M20 B M20 C M20 D CH Shrouded PMT Shrouded PMT near F18 OPEN
;    Shrouded PMT in L11 OPEN OPEN OPEN OPEN OPEN OPEN OPEN No PMT F19 A F19 B F19 C
;    F19 D G18 A G18 B G18 C G18 D G19 A G19 B G19 C G19 D G20 A G20 B G20 C G20 D
;    L14 A L14 B L14 C L14 D M14 A M14 B M14 C M14 D L15 A L15 B L15 C L15 D M15 A
;    M15 B M15 C M15 D L16 A L16 B L16 C L16 D M16 A M16 B M16 C M16 D L17 A L17 B
;    L17 C L17 D M17 A M17 B M17 C M17 D

;
; Inputs: 
;   Run_number: integer specifying HAWC run_number
;
; Keywords:
;   None
;
; Output:
;   Data: structure containing a tag for each scaler operating during
;     the given run.  Each tagname is the prefix 'S' followed by the 
;     scaler id.  Each tag is an array(64) of channel labels
;-


function get_scaler_lookup, run_number

;##Lookup tables
pmt_map_FEB_1 = []
pmt_map_FEB_2 = []
pmt_map_FEB_3 = []
pmt_map_FEB_4 = []

;##FEB crate 1
pmt_map_FEB_1_C_20 = []

foreach tank, ["E18", "F17", "F16", "G16"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_20 = [pmt_map_FEB_1_C_20,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_19 = []

foreach tank, ["F15", "G15", "F14", "G14"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_19 = [pmt_map_FEB_1_C_19,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_18 = []

foreach tank, ["F13", "G13", "F12", "G12"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_18 = [pmt_map_FEB_1_C_18,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_17 = []

foreach tank, ["F11", "G11", "H15", "H14"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_17 = [pmt_map_FEB_1_C_17,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_16 = []

foreach tank, ["H13", "I13", "H12", "I12"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_16 = [pmt_map_FEB_1_C_16,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_15 = []

foreach tank, ["H11", "I11", "I14", "J13"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_15 = [pmt_map_FEB_1_C_15,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_14 = []

foreach tank, ["J12", "K12", "J11", "K11"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_14 = [pmt_map_FEB_1_C_14,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_13 = []

foreach tank, ["L11", "E19", "F18", "G17"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_13 = [pmt_map_FEB_1_C_13,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_12 = []

pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"M20 A"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"M20 B"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"M20 C"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"M20 D"]

pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"CH Shrouded PMT"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"Shrouded PMT near F18"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"OPEN"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"Shrouded PMT in L11"]

pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"OPEN"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"OPEN"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"OPEN"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"OPEN"]

pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"OPEN"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"OPEN"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"OPEN"]
pmt_map_FEB_1_C_12 = [pmt_map_FEB_1_C_12,"No PMT"]

pmt_map_FEB_1_C_11 = []

foreach tank, ["F19", "G18", "G19", "G20"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_11 = [pmt_map_FEB_1_C_11,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_10 = []

foreach tank, ["L14", "M14", "L15", "M15"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_10 = [pmt_map_FEB_1_C_10,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_9 = []

foreach tank, ["L16", "M16", "L17", "M17"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_9 = [pmt_map_FEB_1_C_9,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_8 = []

foreach tank, ["L18", "M18", "L19", "M19"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_8 = [pmt_map_FEB_1_C_8,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_7 = []

foreach tank, ["L12", "M12", "L13", "M13"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_7 = [pmt_map_FEB_1_C_7,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_6 = []

foreach tank, ["H16", "I15", "H17", "I16"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_6 = [pmt_map_FEB_1_C_6,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_5 = []

foreach tank, ["H18", "I17", "H19", "I18"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_5 = [pmt_map_FEB_1_C_5,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_4 = []

foreach tank, ["I19", "I20", "K20", "K19"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_4 = [pmt_map_FEB_1_C_4,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_3 = []

foreach tank, ["J14", "K13", "J15", "K14"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_3 = [pmt_map_FEB_1_C_3,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_2 = []

foreach tank, ["J16", "K15", "J17", "K16"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_2 = [pmt_map_FEB_1_C_2,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_1_C_1 = []

foreach tank, ["J18", "K17", "J19", "K18"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_1_C_1 = [pmt_map_FEB_1_C_1,tank + " " + pmt]
    pmt_map_FEB_1 = [pmt_map_FEB_1,tank + " " + pmt]
	endforeach
endforeach

;##FEB crate 2
pmt_map_FEB_2_C_20 = []

foreach tank, ["N11", "O11", "N12", "O12"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_20 = [pmt_map_FEB_2_C_20,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_19 = []

foreach tank, ["N13", "O13", "N14", "O14"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_19 = [pmt_map_FEB_2_C_19,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_18 = []

foreach tank, ["N15", "O15", "N16", "O16"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_18 = [pmt_map_FEB_2_C_18,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_17 = []

foreach tank, ["N17", "O17", "N18", "O18"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_17 = [pmt_map_FEB_2_C_17,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_16 = []

foreach tank, ["N19", "O19", "P11", "Q11"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_16 = [pmt_map_FEB_2_C_16,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_15 = []

foreach tank, ["P12", "Q12", "P13", "Q13"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_15 = [pmt_map_FEB_2_C_15,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_14 = []

foreach tank, ["P14", "Q14", "P15", "Q15"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_14 = [pmt_map_FEB_2_C_14,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_13 = []

foreach tank, ["P16", "Q16", "P17", "Q17"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_13 = [pmt_map_FEB_2_C_13,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_12 = []

foreach tank, ["P18", "Q18", "R11", "S11"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_12 = [pmt_map_FEB_2_C_12,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_11 = []

foreach tank, ["R12", "S12", "R13", "S13"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_11 = [pmt_map_FEB_2_C_11,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_10 = []

foreach tank, ["R14", "S14", "R15", "S15"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_10 = [pmt_map_FEB_2_C_10,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_9 = []

foreach tank, ["R16", "S16", "R17", "S17"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_9 = [pmt_map_FEB_2_C_9,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_8 = []

foreach tank, ["T11", "U11", "T12", "U12"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_8 = [pmt_map_FEB_2_C_8,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_7 = []

foreach tank, ["T13", "U13", "T14", "U14"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_7 = [pmt_map_FEB_2_C_7,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_6 = []

foreach tank, ["T15", "U15", "T16", "U16"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_6 = [pmt_map_FEB_2_C_6,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_5 = []

foreach tank, ["V11", "W11", "V12", "W12"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_5 = [pmt_map_FEB_2_C_5,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_4 = []

foreach tank, ["V13", "W13", "V14", "W14"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_4 = [pmt_map_FEB_2_C_4,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_3 = []

foreach tank, ["V15", "X14", "X12", "X13"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_3 = [pmt_map_FEB_2_C_3,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_2_C_2 = []

foreach tank, ["X11", "E15", "E14", "E13"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_2_C_2 = [pmt_map_FEB_2_C_2,tank + " " + pmt]
    pmt_map_FEB_2 = [pmt_map_FEB_2,tank + " " + pmt]
	endforeach
endforeach

;##FEB crate 3
pmt_map_FEB_3_C_20 = []

foreach tank, ["U10", "T10", "U09", "T09"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_20 = [pmt_map_FEB_3_C_20,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_19 = []

foreach tank, ["U08", "T08", "U07", "T07"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_19 = [pmt_map_FEB_3_C_19,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_18 = []

foreach tank, ["U06", "T06", "U05", "T05"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_18 = [pmt_map_FEB_3_C_18,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_17 = []

foreach tank, ["U04", "T04", "U03", "S05"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_17 = [pmt_map_FEB_3_C_17,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_16 = []

foreach tank, ["S06", "R06", "S07", "R07"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_16 = [pmt_map_FEB_3_C_16,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_15 = []

foreach tank, ["S08", "R08", "S09", "R09"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_15 = [pmt_map_FEB_3_C_15,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_14 = []

foreach tank, ["S10", "R10", "Q10", "Q07"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_14 = [pmt_map_FEB_3_C_14,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_13 = []

foreach tank, ["Q09", "Q08", "U02", "T03"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_13 = [pmt_map_FEB_3_C_13,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_12 = []

foreach tank, ["S04", "R05", "S03", "R04"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_12 = [pmt_map_FEB_3_C_12,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_11 = []

foreach tank, ["S02", "R03", "T02", "R02"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_11 = [pmt_map_FEB_3_C_11,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_10 = []

foreach tank, ["V01", "F07", "V02", "W02"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_10 = [pmt_map_FEB_3_C_10,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_9 = []

foreach tank, ["V03", "W03", "V04", "W04"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_9 = [pmt_map_FEB_3_C_9,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_8 = []

foreach tank, ["X01", "X04", "X02", "X03"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_8 = [pmt_map_FEB_3_C_8,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_7 = []

foreach tank, ["V05", "W05", "V06", "W06"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_7 = [pmt_map_FEB_3_C_7,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_6 = []

foreach tank, ["V07", "W07", "V08", "W08"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_6 = [pmt_map_FEB_3_C_6,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_3_C_5 = []

foreach tank, ["X05", "X08", "X06", "X07"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_3_C_5 = [pmt_map_FEB_3_C_5,tank + " " + pmt]
    pmt_map_FEB_3 = [pmt_map_FEB_3,tank + " " + pmt]
	endforeach
endforeach

;##FEB crate 4
pmt_map_FEB_4_C_20 = []

foreach tank, ["P10", "P09", "P08", "P07"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_20 = [pmt_map_FEB_4_C_20,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_19 = []

foreach tank, ["Q06", "P06", "Q05", "P05"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_19 = [pmt_map_FEB_4_C_19,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_18 = []

foreach tank, ["Q04", "P04", "Q03", "P03"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_18 = [pmt_map_FEB_4_C_18,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_17 = []

foreach tank, ["Q02", "P02", "N03", "E12"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_17 = [pmt_map_FEB_4_C_17,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_16 = []

foreach tank, ["O03", "N04", "O06", "N07"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_16 = [pmt_map_FEB_4_C_16,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_15 = []

foreach tank, ["O05", "N06", "O04", "N05"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_15 = [pmt_map_FEB_4_C_15,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_14 = []

foreach tank, ["O09", "O08", "O10", "O07"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_14 = [pmt_map_FEB_4_C_14,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_13 = []

foreach tank, ["L10", "M03", "M04", "L04"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_13 = [pmt_map_FEB_4_C_13,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_12 = []

foreach tank, ["M05", "L05", "M06", "L06"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_12 = [pmt_map_FEB_4_C_12,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_11 = []

foreach tank, ["M07", "L07", "L08", "L09"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_11 = [pmt_map_FEB_4_C_11,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_10 = []

foreach tank, ["K10", "J10", "K09", "J09"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_10 = [pmt_map_FEB_4_C_10,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_9 = []

foreach tank, ["K08", "J08", "K07", "J07"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_9 = [pmt_map_FEB_4_C_9,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_8 = []

foreach tank, ["K06", "J06", "K05", "J05"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_8 = [pmt_map_FEB_4_C_8,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_7 = []

foreach tank, ["K04", "I05", "I06", "H06"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_7 = [pmt_map_FEB_4_C_7,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_6 = []

foreach tank, ["I07", "H07", "I08", "H08"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_6 = [pmt_map_FEB_4_C_6,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_5 = []

foreach tank, ["I09", "H09", "I10", "H10"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_5 = [pmt_map_FEB_4_C_5,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_4 = []

foreach tank, ["G10", "F10", "G09", "F09"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_4 = [pmt_map_FEB_4_C_4,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_3 = []

foreach tank, ["G08", "F08", "G07", "G06"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_3 = [pmt_map_FEB_4_C_3,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_2 = []

foreach tank, ["E09", "E10", "X10", "W10"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_2 = [pmt_map_FEB_4_C_2,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

pmt_map_FEB_4_C_1 = []

foreach tank, ["X09", "V09", "W09", "V10"] do begin 
	foreach pmt, ["A", "B", "C", "D"] do begin
    pmt_map_FEB_4_C_1 = [pmt_map_FEB_4_C_1,tank + " " + pmt]
    pmt_map_FEB_4 = [pmt_map_FEB_4,tank + " " + pmt]
	endforeach
endforeach

;##Other
pmt_map_Monitoring = []

pmt_map_Monitoring = [pmt_map_Monitoring,"GTC Mon 1"]
pmt_map_Monitoring = [pmt_map_Monitoring,"GTC Mon 2"]
pmt_map_Monitoring = [pmt_map_Monitoring,"GTC Mon 3"]
pmt_map_Monitoring = [pmt_map_Monitoring,"GTC Mon 4"]

pmt_map_Monitoring = [pmt_map_Monitoring,"GTC Mon 5"]
pmt_map_Monitoring = [pmt_map_Monitoring,"GTC Mon 6"]
pmt_map_Monitoring = [pmt_map_Monitoring,"GTC Mon 7"]
pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]

pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]
pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]
pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]
pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]

pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]
pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]
pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]
pmt_map_Monitoring = [pmt_map_Monitoring,"OPEN"]

;pmt_map_Dummy = ["DUMMY" foreach i in range(0,16)]
pmt_map_Dummy = strarr(16) + "DUMMY"

;# In case no run_number is given give the most recent config
if run_number eq 0 or run_number ge 1619 then $
    scaler_lookup = {s68:  [pmt_map_FEB_2_C_20 , pmt_map_FEB_1_C_20 , pmt_map_FEB_2_C_19 , pmt_map_FEB_1_C_19], $
                     s69:  [pmt_map_FEB_2_C_18 , pmt_map_FEB_1_C_18 , pmt_map_FEB_2_C_17 , pmt_map_FEB_1_C_17], $
                     s70:  [pmt_map_FEB_2_C_16 , pmt_map_FEB_1_C_16 , pmt_map_FEB_2_C_15 , pmt_map_FEB_1_C_15], $
                     s71:  [pmt_map_FEB_2_C_14 , pmt_map_FEB_1_C_14 , pmt_map_FEB_2_C_13 , pmt_map_FEB_1_C_13], $
                     s72:  [pmt_map_FEB_2_C_12 , pmt_map_FEB_1_C_12 , pmt_map_FEB_2_C_11 , pmt_map_FEB_1_C_11], $
                     s73:  [pmt_map_FEB_2_C_10 , pmt_map_FEB_1_C_10 , pmt_map_FEB_2_C_9  , pmt_map_FEB_1_C_9], $
                     s74:  [pmt_map_FEB_2_C_8  , pmt_map_FEB_1_C_8  , pmt_map_FEB_2_C_7  , pmt_map_FEB_1_C_7], $
                     s75:  [pmt_map_FEB_2_C_6  , pmt_map_FEB_1_C_6  , pmt_map_FEB_2_C_5  , pmt_map_FEB_1_C_5], $
                     s76:  [pmt_map_FEB_4_C_4  , pmt_map_FEB_1_C_4  , pmt_map_FEB_4_C_3  , pmt_map_FEB_1_C_3], $
                     s77:  [pmt_map_FEB_4_C_2  , pmt_map_FEB_1_C_2  , pmt_map_Monitoring , pmt_map_FEB_1_C_1], $

                     s96:  [pmt_map_FEB_3_C_20 , pmt_map_FEB_4_C_20 , pmt_map_FEB_3_C_19 , pmt_map_FEB_4_C_19], $
                     s97:  [pmt_map_FEB_3_C_18 , pmt_map_FEB_4_C_18 , pmt_map_FEB_3_C_17 , pmt_map_FEB_4_C_17], $
                     s98:  [pmt_map_FEB_3_C_16 , pmt_map_FEB_4_C_16 , pmt_map_FEB_3_C_15 , pmt_map_FEB_4_C_15], $
                     s99:  [pmt_map_FEB_3_C_14 , pmt_map_FEB_4_C_14 , pmt_map_FEB_3_C_13 , pmt_map_FEB_4_C_13], $
                     s100: [pmt_map_FEB_3_C_12 , pmt_map_FEB_4_C_12 , pmt_map_FEB_3_C_11 , pmt_map_FEB_4_C_11], $
                     s101: [pmt_map_FEB_3_C_10 , pmt_map_FEB_4_C_10 , pmt_map_FEB_3_C_9  , pmt_map_FEB_4_C_9], $
                     s102: [pmt_map_FEB_3_C_8  , pmt_map_FEB_4_C_8  , pmt_map_FEB_3_C_7  , pmt_map_FEB_4_C_7], $
                     s103: [pmt_map_FEB_3_C_6  , pmt_map_FEB_4_C_6  , pmt_map_FEB_3_C_5  , pmt_map_FEB_4_C_5], $

                     s104: [pmt_map_FEB_4_C_2  , pmt_map_FEB_4_C_4  , pmt_map_FEB_4_C_1  , pmt_map_FEB_4_C_3]} else $
if run_number lt 37 then $ 
    scaler_lookup = {s67: [pmt_map_FEB_1_C_20 , pmt_map_Dummy , pmt_map_FEB_1_C_19 , pmt_map_Dummy], $
                     s68: [pmt_map_FEB_1_C_18 , pmt_map_Dummy , pmt_map_FEB_1_C_17 , pmt_map_Dummy]} else $
if run_number lt 248 then $
    scaler_lookup = {s67: [pmt_map_FEB_1_C_20 , pmt_map_FEB_1_C_19 , pmt_map_FEB_1_C_18 , pmt_map_FEB_1_C_17], $
                     s68: [pmt_map_FEB_1_C_16 , pmt_map_FEB_1_C_15 , pmt_map_FEB_1_C_14 , pmt_map_FEB_1_C_13]} else $
if run_number lt 475 then $
    scaler_lookup = {s66: [pmt_map_FEB_1_C_20 , pmt_map_FEB_1_C_19 , pmt_map_FEB_1_C_18 , pmt_map_FEB_1_C_17], $
                     s70: [pmt_map_FEB_1_C_16 , pmt_map_FEB_1_C_15 , pmt_map_FEB_1_C_14 , pmt_map_FEB_1_C_13], $
                     s67: [pmt_map_Dummy      , pmt_map_Dummy      , pmt_map_FEB_1_C_12 , pmt_map_Dummy]} else $
if run_number lt 752 then $
    scaler_lookup = {s68: [pmt_map_Monitoring , pmt_map_Dummy , pmt_map_Dummy , pmt_map_Dummy], $
                     s69: [pmt_map_FEB_1_C_20 , pmt_map_FEB_1_C_19 , pmt_map_FEB_1_C_18 , pmt_map_FEB_1_C_17], $
                     s70: [pmt_map_FEB_1_C_16 , pmt_map_FEB_1_C_15 , pmt_map_FEB_1_C_14 , pmt_map_FEB_1_C_13], $
                     s71: [pmt_map_FEB_1_C_12 , pmt_map_FEB_1_C_11 , pmt_map_FEB_1_C_10 , pmt_map_FEB_1_C_9], $
                     s72: [pmt_map_FEB_1_C_8  , pmt_map_FEB_1_C_7  , pmt_map_FEB_1_C_6  , pmt_map_FEB_1_C_5], $
                     s73: [pmt_map_FEB_1_C_4  , pmt_map_Dummy      , pmt_map_FEB_1_C_3  , pmt_map_Dummy], $
                     s74: [pmt_map_FEB_1_C_2  , pmt_map_Dummy      , pmt_map_FEB_1_C_1  , pmt_map_Dummy]} else $
if run_number lt 1219 then $
    scaler_lookup = {s70: [pmt_map_Dummy , pmt_map_Dummy , pmt_map_Monitoring , pmt_map_Dummy], $
                     s69: [pmt_map_FEB_1_C_20 , pmt_map_FEB_1_C_19 , pmt_map_FEB_1_C_18 , pmt_map_FEB_1_C_17], $
                     s68: [pmt_map_FEB_1_C_16 , pmt_map_FEB_1_C_15 , pmt_map_FEB_1_C_14 , pmt_map_FEB_1_C_13], $
                     s71: [pmt_map_FEB_1_C_12 , pmt_map_FEB_1_C_11 , pmt_map_FEB_1_C_10 , pmt_map_FEB_1_C_9], $
                     s72: [pmt_map_FEB_1_C_8  , pmt_map_FEB_1_C_7  , pmt_map_FEB_1_C_6  , pmt_map_FEB_1_C_5], $
                     s73: [pmt_map_FEB_1_C_4  , pmt_map_FEB_1_C_3  , pmt_map_FEB_1_C_2  , pmt_map_FEB_1_C_1], $
                     s74: [pmt_map_FEB_2_C_20 , pmt_map_FEB_2_C_19 , pmt_map_FEB_2_C_18 , pmt_map_FEB_2_C_17]} else $
if run_number lt 1339 then $
    scaler_lookup = {s70: [pmt_map_Dummy , pmt_map_Dummy , pmt_map_Monitoring , pmt_map_Dummy], $
                     s69: [pmt_map_FEB_1_C_20 , pmt_map_FEB_1_C_19 , pmt_map_FEB_1_C_18 , pmt_map_FEB_1_C_17], $
                     s68: [pmt_map_FEB_1_C_16 , pmt_map_FEB_1_C_15 , pmt_map_FEB_1_C_14 , pmt_map_FEB_1_C_13], $
                     s71: [pmt_map_FEB_1_C_12 , pmt_map_FEB_1_C_11 , pmt_map_FEB_1_C_10 , pmt_map_FEB_1_C_9], $
                     s72: [pmt_map_FEB_1_C_8  , pmt_map_FEB_1_C_7  , pmt_map_FEB_1_C_6  , pmt_map_FEB_1_C_5], $
                     s73: [pmt_map_FEB_1_C_4  , pmt_map_FEB_1_C_3  , pmt_map_FEB_1_C_2  , pmt_map_FEB_1_C_1], $
                     s76: [pmt_map_FEB_2_C_20 , pmt_map_FEB_2_C_19 , pmt_map_FEB_2_C_18 , pmt_map_FEB_2_C_17], $
                     s75: [pmt_map_FEB_1_C_16 , pmt_map_FEB_1_C_15 , pmt_map_FEB_1_C_14 , pmt_map_FEB_1_C_13], $
                     s74: [pmt_map_FEB_2_C_12 , pmt_map_FEB_2_C_11 , pmt_map_FEB_2_C_10 , pmt_map_FEB_2_C_9], $
                     s77: [pmt_map_FEB_2_C_8  , pmt_map_FEB_2_C_7  , pmt_map_FEB_2_C_6  , pmt_map_FEB_2_C_5]} else $
if run_number lt 1433 then $
    scaler_lookup = {s68: [pmt_map_Dummy , pmt_map_Dummy , pmt_map_Monitoring , pmt_map_Dummy], $
                     s69: [pmt_map_FEB_1_C_20 , pmt_map_FEB_1_C_19 , pmt_map_FEB_1_C_18 , pmt_map_FEB_1_C_17], $
                     s70: [pmt_map_FEB_1_C_16 , pmt_map_FEB_1_C_15 , pmt_map_FEB_1_C_14 , pmt_map_FEB_1_C_13], $
                     s71: [pmt_map_FEB_1_C_12 , pmt_map_FEB_1_C_11 , pmt_map_FEB_1_C_10 , pmt_map_FEB_1_C_9], $
                     s72: [pmt_map_FEB_1_C_8  , pmt_map_FEB_1_C_7  , pmt_map_FEB_1_C_6  , pmt_map_FEB_1_C_5], $
                     s73: [pmt_map_FEB_1_C_4  , pmt_map_FEB_1_C_3  , pmt_map_FEB_1_C_2  , pmt_map_FEB_1_C_1], $
                     s74: [pmt_map_FEB_2_C_20 , pmt_map_FEB_2_C_19 , pmt_map_FEB_2_C_18 , pmt_map_FEB_2_C_17], $
                     s75: [pmt_map_FEB_1_C_16 , pmt_map_FEB_1_C_15 , pmt_map_FEB_1_C_14 , pmt_map_FEB_1_C_13], $
                     s76: [pmt_map_FEB_2_C_12 , pmt_map_FEB_2_C_11 , pmt_map_FEB_2_C_10 , pmt_map_FEB_2_C_9], $
                     s77: [pmt_map_FEB_2_C_8  , pmt_map_FEB_2_C_7  , pmt_map_FEB_2_C_6  , pmt_map_FEB_2_C_5], $
                     s96: [pmt_map_FEB_2_C_4  , pmt_map_FEB_2_C_3  , pmt_map_FEB_2_C_2  , pmt_map_FEB_3_C_20], $
                     s97: [pmt_map_FEB_3_C_19 , pmt_map_FEB_3_C_18 , pmt_map_FEB_3_C_17 , pmt_map_FEB_3_C_16]} else $
if run_number lt 1619 then $
    scaler_lookup = {s68:  [pmt_map_FEB_2_C_20 , pmt_map_FEB_1_C_20 , pmt_map_FEB_2_C_19 , pmt_map_FEB_1_C_19], $
                     s69:  [pmt_map_FEB_2_C_18 , pmt_map_FEB_1_C_18 , pmt_map_FEB_2_C_17 , pmt_map_FEB_1_C_17], $
                     s70:  [pmt_map_FEB_2_C_16 , pmt_map_FEB_1_C_16 , pmt_map_FEB_2_C_15 , pmt_map_FEB_1_C_15], $
                     s71:  [pmt_map_FEB_2_C_14 , pmt_map_FEB_1_C_14 , pmt_map_FEB_2_C_13 , pmt_map_FEB_1_C_13], $
                     s72:  [pmt_map_FEB_2_C_12 , pmt_map_FEB_1_C_12 , pmt_map_FEB_2_C_11 , pmt_map_FEB_1_C_11], $
                     s73:  [pmt_map_FEB_2_C_10 , pmt_map_FEB_1_C_10 , pmt_map_FEB_2_C_9  , pmt_map_FEB_1_C_9], $
                     s74:  [pmt_map_FEB_2_C_8  , pmt_map_FEB_1_C_8  , pmt_map_FEB_2_C_7  , pmt_map_FEB_1_C_7], $
                     s75:  [pmt_map_FEB_2_C_6  , pmt_map_FEB_1_C_6  , pmt_map_FEB_2_C_5  , pmt_map_FEB_1_C_5], $
                     s76:  [pmt_map_FEB_2_C_4  , pmt_map_FEB_1_C_4  , pmt_map_FEB_2_C_3  , pmt_map_FEB_1_C_3], $
                     s77:  [pmt_map_FEB_2_C_2  , pmt_map_FEB_1_C_2  , pmt_map_Monitoring , pmt_map_FEB_1_C_1], $

                     s96:  [pmt_map_FEB_3_C_20 , pmt_map_FEB_4_C_20 , pmt_map_FEB_3_C_19 , pmt_map_FEB_4_C_19], $
                     s97:  [pmt_map_FEB_3_C_18 , pmt_map_FEB_4_C_18 , pmt_map_FEB_3_C_17 , pmt_map_FEB_4_C_17], $
                     s98:  [pmt_map_FEB_3_C_16 , pmt_map_FEB_4_C_16 , pmt_map_FEB_3_C_15 , pmt_map_FEB_4_C_15], $
                     s99:  [pmt_map_FEB_3_C_14 , pmt_map_FEB_4_C_14 , pmt_map_FEB_3_C_13 , pmt_map_FEB_4_C_13], $
                     s100: [pmt_map_FEB_3_C_12 , pmt_map_FEB_4_C_12 , pmt_map_FEB_3_C_11 , pmt_map_FEB_4_C_11], $
                     s101: [pmt_map_FEB_4_C_4  , pmt_map_FEB_4_C_10 , pmt_map_FEB_3_C_9  , pmt_map_FEB_4_C_9], $
                     s102: [pmt_map_FEB_4_C_3  , pmt_map_FEB_4_C_8  , pmt_map_FEB_3_C_7  , pmt_map_FEB_4_C_7], $
                     s103: [pmt_map_FEB_4_C_2  , pmt_map_FEB_4_C_6  , pmt_map_FEB_3_C_5  , pmt_map_FEB_4_C_5]} else scaler_lookup = 0 
	
return, scaler_lookup

;key = where(tag_names(scaler_lookup) eq string(format='(%"S%d")', scaler_number), count)
;return, scaler_lookup.(key)[channel_number]

end
