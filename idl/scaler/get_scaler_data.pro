;+
; Procedure: get_scaler_data 
;
; Purpose: reads in HAWC (the High-Altitude Water Cherenkov Observatory)
;          scaler datafile and returns IDL structure with data 
;
; Example: 
;   IDL>f =  './hawc_data/Scaler_001321_000008_2014_243_11115.dat' 
;   IDL>data = get_scaler_data(f) 
;   IDL>help, data
;   ** Structure <f40918>, 7 tags, length=584, data length=574, refs=1:
;      DAY             INT            243
;      SECOND          DOUBLE           11115.554
;      EVENT           ULONG           480000
;      CRATE           STRING    '0x0'
;      SCALER          STRING    '0x44'
;      CHANNELS        ULONG64   Array[64]
;      ERRORSTATUS     STRING    '0x0'
;   IDL>w = where(data.scaler eq '0x45')
;   IDL>plot, data(w).channels[57]
;
; Inputs: 
;   FILENAME: string specifying '*.dat' scaler data filename
;
; Keywords:
;
;   SAV(optional): save the returned data structure in a compressed
;  	  idl .sav file 
;
;   SVDIR(optional): directory to save .sav file in       
;
; Output:
;   Data: structure containing the following arrays
;     .day:     integer doy (jan 1st = 0)
;     .second:  double secondsofday
;     .event:   ULONG event number
;     .crate:   hexstring crate id
;     .scaler:  hexstring scaler id 
;     .channels: ulong64 array of channel counts  
;     .errorstatus: hexstring error status
;-


function get_scaler_data, filename, sav=sav, svdir=svdir

	;determine how many channels are in file
	;read first line in file and count channels
	OpenR, lun, filename, /GET_LUN

	line = ''
	readf, lun, line
	linedata = STRSPLIT(line, /EXTRACT)
	nchannels = linedata[-4]+1

	Close, lun

	;read data file into arrary of the following data structs
	dataStruct = {day:0, second:0.0d, event:0UL, crate:'0x0', scaler:'0x0', $
		channels:indgen(nchannels,/UL64), errorStatus:'0x0'} 
	
	nlines = FILE_LINES(filename)
	data = Replicate(dataStruct, nlines)
	datacount = ULONG(0)

	line = ''
	
	OpenR, lun, filename, /GET_LUN	
	
	while not eof(lun) do begin
		readf, lun, line
		linedata = STRSPLIT(line, /EXTRACT)	

		;remove 'i's, 'C's, 'S's, 'E's from linedata
		w = where(linedata ne 'i' and linedata ne 'C' and linedata ne 'S' $
				and linedata ne 'E')		
		linedata = linedata(w)

		;get indices into channel counts
		chdata = (indgen(nchannels)*2)+6

		;remove channel indicies from linedata
		linedata = [linedata[0:4],linedata[chdata],linedata[-1]]

		;read linedata into dataStruct
		reads, linedata, dataStruct
		data(datacount) = dataStruct
		
		dataCount++
		
	endwhile

	if keyword_set(sav) then begin
		;get metadata from filename
		;[run_number, file_number, year, doy, secondofday]	
		fname = (strsplit(filename, /EXTRACT, '/'))[-1]
		fnamedata = (STRSPLIT(fname, /EXTRACT, '_.'))[1:-2]
		metadata = {run_number:fnamedata[0]+0, file_number:fnamedata[1]+0, $
			year:fnamedata[2]+0, doy:fnamedata[3]+0, secondofday:fnamedata[4]+0}
		
		savfname = string(format='(%"Scaler_%06d_%06d_%d_%d_%d.sav")', metadata.run_number, metadata.file_number, metadata.year, metadata.doy, metadata.secondofday) 
		
		if ~keyword_set(svdir) then svdir = './'
		save, data, filename=svdir+savfname, /compress	
	endif

	return, data
	
end
