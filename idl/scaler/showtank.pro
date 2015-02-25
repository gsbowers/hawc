;+
; Procedure: showtank
;
; Purpose: loads HAWC (the High-Altitude Water Cherenkov Observatory)
;          scaler data from .dat or .sav file and makes postscript plot 
;          of counts in available channels for specified water tank. 
;          Displays postscript plot in spawned evince.   
;           
;
; Example: 
;   IDL>f =  './hawc_data/Scaler_001321_000008_2014_243_11115.dat' 
;   IDL>showtank, f, 'H15'
;   IDL>f =  './hawc_data/Scaler_001321_000008_2014_243_11115.sav' 
;   IDL>showtank, f, 'H15'
;   IDL>ls
;   ...
;   Scaler_H15_001321_000008_2014_243_11115.ps
;
; Inputs: 
;   TANK: string specifying tank id 
;   FILENAME: string specifying .dat or .sav scaler data filename
;
; Keywords:
;   None
;
; Output:
;   
;-
pro showtank, filename, tank

	;get metadata from filename
	;[run_number, file_number, year, doy, secondofday]	
	fname = (strsplit(filename, /EXTRACT, '/'))[-1]
	fnamedata = (STRSPLIT(fname, /EXTRACT, '_.'))[1:-1]
	metadata = {run_number:fnamedata[0]+0, file_number:fnamedata[1]+0, $
		year:fnamedata[2]+0, doy:fnamedata[3]+0, secondofday:fnamedata[4]+0, $
    file_extension:fnamedata[5]}

	;get count data
	if metadata.file_extension eq 'dat' then $
		data = get_scaler_data(filename) $
	else $
		restore, filename=filename	

	;get mapping from tank to scaler and channels
	map = tank2scaler_channels(metadata.run_number, tank)
	if ~is_struct(map) then begin
		message, 'no mapping found for tank: '+tank
		return ; or loop and ask for tank again
	endif 

	scaler = map.scaler
	channels = map.channels
	labels = map.channels

	w = where(data.scaler eq scaler)
	yrange = minmax(data(w).channels(channels))
	colors = [5,60,255,90]

	set_plot, 'ps'
	plotname = string(format='(%"Scaler_%s_%06d_%06d_%d_%d_%d.ps")', tank, metadata.run_number, metadata.file_number, metadata.year, metadata.doy, metadata.secondofday) 
	device,filename=plotname,/color,/inches,xsize=6.0, ysize=6.0
	!p.charsize=1
	loadct, 13

	seconds = data(w).second

	plot, seconds, data(w).channels(channels[0]), /ylog, $
			yrange=yrange, color=colors[0], $
			xtitle='seconds', ytitle='counts/0.1 second', $
			title =tank +' '+fname, xstyle=1, xrange=minmax(seconds)

	for i=1, n_elements(channels)-1 do begin
		oplot, seconds, data(w).channels(channels[i]), color=colors[i]
	endfor
	
	device, /close
	
	spawn, 'evince '+plotname+' &'

end
