;+
; Procedure: tank2scaler_channels 
;
; Purpose: return a mapping between a given HAWC (the High-Altitude 
;          Water Cherenkov Observatory) water tank and it's associated
;          crate number and channels for a given run-number
;
; Example: 
;   IDL> map = tank2scaler_channels(1321, 'H15')
;   IDL> print, map.scaler
;   0x45
;   IDL> print, map.channels
;        56    57    58    59
;   IDL> print, map.labels 
;   H15 A  H15 B  H15 C  H15 D
;
; Inputs: 
;   run_number: an integer specifying the run number
;  
;   tank: a string specifying the water tank (e.g. 'H15') 
;
; Keywords: 
;    None
;
; Output:
;   map: structure containing the following tags
;      - scaler: string scaler ID
;      - channels: array of channels asscoiated with scaler 
;      - labels: array of channels label strings
;   
;   -or-
;
;   -1 if tank not found
;
;-

function tank2scaler_channels, run_number, tank

	;get scaler and channels associated with tank
	scaler_lookups = get_scaler_lookup(run_number)
	tags = tag_names(scaler_lookups)
	ntags = n_tags(scaler_lookups)

	;search through scaler_lookup to find scaler associated with tank
	for i=0,ntags-1 do begin
		s = scaler_lookups.(i)
		channels = where(strmatch(s, tank+'*', /FOLD_CASE) EQ 1, count) 
		if count gt 0 then begin
			scaler = strmid(tags[i],1,strlen(tags[i])-1)+0
			scaler_code = string(scaler, format='(%"0x%z")')
			print, "detectors found: ", s[channels]
			break
		endif	
	endfor

	if count eq 0 then return, -1  

	return, {scaler:scaler_code, channels:channels, labels:s[channels]}

end 
