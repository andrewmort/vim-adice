" Vim syntax file
" Language: Adice
" Maintainer: Andrew Mort
" Latest Revision: 5/17/2018

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

syntax case ignore

" ***************** Operators *****************************
"syntax keyword adiceOperator from to
syntax match   adiceOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"


" ***************** Todo *****************************
syntax keyword adiceTodo contained TODO FIXME XXX NOTE


" ***************** Comments *****************************
" TODO check if comments will continue on next line with &
syntax region adiceComment start="/\*" end="\*/" contains=adiceTodo,@Spell
syntax region adiceComment start="\_^\s*\*" skip="&\s*" end="$" contains=adiceTodo,@Spell


" ***************** Strings *****************************
syntax region adiceString start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell


" ***************** Commands *****************************
setlocal iskeyword+=$,.

syntax keyword adiceCommand contained $
syntax keyword adiceCommand contained ale[rt]
syntax keyword adiceCommand contained alt[er]
syntax keyword adiceCommand contained be[ep]
syntax keyword adiceCommand contained cle[ar]
syntax keyword adiceCommand contained clo[se]
syntax keyword adiceCommand contained com[mand]
syntax keyword adiceCommand contained con[tinue]
syntax keyword adiceCommand contained def[ine]
syntax keyword adiceCommand contained del[ete]
syntax keyword adiceCommand contained dem[and]
syntax keyword adiceCommand contained dim[ension]
syntax keyword adiceCommand contained dis[play]
syntax keyword adiceCommand contained em
syntax keyword adiceCommand contained ena[ble]
syntax keyword adiceCommand contained endde[fine]
syntax keyword adiceCommand contained endh[ereis]
syntax keyword adiceCommand contained ends[cope]
syntax keyword adiceCommand contained ev[aluate]
syntax keyword adiceCommand contained exe[cute]
syntax keyword adiceCommand contained exi[t]
syntax keyword adiceCommand contained fo[p]
syntax keyword adiceCommand contained fr[eq]
syntax keyword adiceCommand contained g[o]
syntax keyword adiceCommand contained ha[rdcopy]
syntax keyword adiceCommand contained hel[p]
syntax keyword adiceCommand contained her[eis]
syntax keyword adiceCommand contained hh[istogram]
syntax keyword adiceCommand contained hi[stogram]
syntax keyword adiceCommand contained hp[lot]
syntax keyword adiceCommand contained hs[mith]
syntax keyword adiceCommand contained in[clude]
syntax keyword adiceCommand contained k[eep]
syntax keyword adiceCommand contained la[bel]
syntax keyword adiceCommand contained li[brary]
syntax keyword adiceCommand contained loa[d]
syntax keyword adiceCommand contained loc[al]
syntax keyword adiceCommand contained mo[r]
syntax keyword adiceCommand contained nem[o]
syntax keyword adiceCommand contained new[s]
syntax keyword adiceCommand contained ni[c]
syntax keyword adiceCommand contained no[ise]
syntax keyword adiceCommand contained nsa[ve]
syntax keyword adiceCommand contained nst
syntax keyword adiceCommand contained ol[d_optimize]
syntax keyword adiceCommand contained open
syntax keyword adiceCommand contained opt[imize]
syntax keyword adiceCommand contained par[ameterize]
syntax keyword adiceCommand contained pat[h]
syntax keyword adiceCommand contained pc[ap]
syntax keyword adiceCommand contained plm
syntax keyword adiceCommand contained plo[t]
syntax keyword adiceCommand contained print
syntax keyword adiceCommand contained printf
syntax keyword adiceCommand contained prob[e]
syntax keyword adiceCommand contained prof[ile]
syntax keyword adiceCommand contained ps[s]
syntax keyword adiceCommand contained pz
syntax keyword adiceCommand contained pzp[lot]
syntax keyword adiceCommand contained q[uit]
syntax keyword adiceCommand contained rad[ar]
syntax keyword adiceCommand contained rai[se]
syntax keyword adiceCommand contained ran[domize]
syntax keyword adiceCommand contained rea[d]
syntax keyword adiceCommand contained rep[licate]
syntax keyword adiceCommand contained res[et]
syntax keyword adiceCommand contained ret[urn]
syntax keyword adiceCommand contained ro[t]
syntax keyword adiceCommand contained save
syntax keyword adiceCommand contained savea[s]
syntax keyword adiceCommand contained sca[ndir]
syntax keyword adiceCommand contained sco[pe]
syntax keyword adiceCommand contained sd[f]
syntax keyword adiceCommand contained sen[sitivity]
syntax keyword adiceCommand contained set
syntax keyword adiceCommand contained sh[ow]
syntax keyword adiceCommand contained si[mulate]
syntax keyword adiceCommand contained sk[ew]
syntax keyword adiceCommand contained sm[ith]
syntax keyword adiceCommand contained spa[rameter]
syntax keyword adiceCommand contained spr[intf]
syntax keyword adiceCommand contained ss[canf]
syntax keyword adiceCommand contained sw[eep]
syntax keyword adiceCommand contained sy[stem]
syntax keyword adiceCommand contained tr[averse]
syntax keyword adiceCommand contained ty[pe]
syntax keyword adiceCommand contained unm[acro]
syntax keyword adiceCommand contained uns[et]
syntax keyword adiceCommand contained us[e]
syntax keyword adiceCommand contained wi[ndow]

syntax keyword adiceCommand contained else
syntax keyword adiceCommand contained elsei[f]
syntax keyword adiceCommand contained endi[f]
syntax keyword adiceCommand contained if
syntax keyword adiceCommand contained then

syntax keyword adiceCommand contained br[eak]
syntax keyword adiceCommand contained do
syntax keyword adiceCommand contained enddo
syntax keyword adiceCommand contained endw[hile]
syntax keyword adiceCommand contained nex[t]
syntax keyword adiceCommand contained wh[ile]

syntax keyword adiceCommand contained ca[tch]
syntax keyword adiceCommand contained endc[atch]
syntax keyword adiceCommand contained th[row]

syntax keyword adiceCommand contained ma[cro]

syntax keyword adiceSubCmdAlert contained add del all on off mod com reset
syntax keyword adiceSubCmdAlert contained element suppress report

"syntax region adiceCmdAlert start="ale[rt]" skip="&\s*" end="$" contains=adiceCommand


" ***************** Functions *****************************
" Math
syntax keyword adiceFunction contained abs acos acosh arg asin asinh atan atanh
syntax keyword adiceFunction contained ceil complex cos cosh exp floor imag int
syntax keyword adiceFunction contained log log10 magniture max min mod phase ptat
syntax keyword adiceFunction contained real round sin sinh sqrt step tan tanh
syntax keyword adiceFunction contained aint derivative

" Reults Access
syntax keyword adiceFunction contained current_scan dev devac devdb devdc devi
syntax keyword adiceFunction contained devm devp devr i iac idb idc ii im ip ir
syntax keyword adiceFunction contained l last_scan n sendc v vac vdb vdc vi vm
syntax keyword adiceFunction contained vp vr vv command_scan fromdatserv sen
syntax keyword adiceFunction contained todatserv w

" Data and Waveform Analysis
syntax keyword adiceFunction contained atod binstring bus dave db definite_integral
syntax keyword adiceFunction contained deval derivative dmax dmin dtoa find first
syntax keyword adiceFunction contained firstind getrange getslice group_delay
syntax keyword adiceFunction contained hexstring integral last lastind logic
syntax keyword adiceFunction contained octstring shift signedbus radixstring
syntax keyword adiceFunction contained real rss unsignedbus waveform

" Curve Fitting
syntax keyword adiceFunction contained endfit expfit exppolyfit invpolyfit
syntax keyword adiceFunction contained linfit logfit logpolyfit nonlin polyfit
syntax keyword adiceFunction contained powfit ratpolyfit splinefit

" Statstical
syntax keyword adiceFunction contained erf erfc gauss rand random_mismatch
syntax keyword adiceFunction contained srand uniform gauss_ar rand_ar rgauss
syntax keyword adiceFunction contained rgauss_ar uniform_ar

" FFT
syntax keyword adiceFunction contained fft fftdb ffti fftm fftp fftr invfft
syntax keyword adiceFunction contained invfftdb invffti invfftm invfftp invfftr

" Other
syntax keyword adiceFunction contained adi_array adi_data adi_file adi_info
syntax keyword adiceFunction contained adi_list adi_map adi_random adi_string
syntax keyword adiceFunction contained adi_system adi_waveform
syntax keyword adiceFunction contained circuit_file_name free_channel_number
syntax keyword adiceFunction contained index is_array is_bus is_buswave is_complex
syntax keyword adiceFunction contained is_complexwave is_fixedsize is_function
syntax keyword adiceFunction contained is_logic is_logicwave is_real is_realwave
syntax keyword adiceFunction contained is_set is_signed is_string is_unsigned
syntax keyword adiceFunction contained is_varsize is_wave isvalid lower size
syntax keyword adiceFunction contained string sub_array upper
syntax keyword adiceFunction contained adi_clock adi_gui cpu_time datserv_process_id
syntax keyword adiceFunction contained elapsed_time force_global_variable peak_dynamic_memory
syntax keyword adiceFunction contained process_id program_is_x program_name program_version
syntax keyword adiceFunction contained running_scan running_hier swap_available swap_used
syntax keyword adiceFunction contained system_cpu_time user_cpu_time


" ***************** Control Constants *****************************
syntax keyword adiceConstant boltz
syntax keyword adiceConstant ctok
syntax keyword adiceConstant infinity
syntax keyword adiceConstant pi
syntax keyword adiceConstant root2
syntax keyword adiceConstant twopi


" ***************** Control Variables *****************************
syntax keyword adiceVariable abstol
syntax keyword adiceVariable abstolc
syntax keyword adiceVariable abstolr
syntax keyword adiceVariable adice4_diagnostics
syntax keyword adiceVariable adice_alg_a10_parts
syntax keyword adiceVariable alert_auto_convert
syntax keyword adiceVariable alert_min_duration
syntax keyword adiceVariable alert_start
syntax keyword adiceVariable alert_state
syntax keyword adiceVariable alert_trans
syntax keyword adiceVariable alog
syntax keyword adiceVariable alog_file_name
syntax keyword adiceVariable analog_unknown_res
syntax keyword adiceVariable apply_nics_for_dc
syntax keyword adiceVariable auto_adjust_y_limits
syntax keyword adiceVariable auto_rot_at_go
syntax keyword adiceVariable balloon_help
syntax keyword adiceVariable bjt_algo
syntax keyword adiceVariable capacitor_current_algo
syntax keyword adiceVariable charge
syntax keyword adiceVariable check_ckt_time_stamp
syntax keyword adiceVariable check_model_time_stamps
syntax keyword adiceVariable chgtol
syntax keyword adiceVariable color_assignment
syntax keyword adiceVariable complex_number_format
syntax keyword adiceVariable continue_on_use_error
syntax keyword adiceVariable continue_on_use_interrupt
syntax keyword adiceVariable crop_on_y_relimit
syntax keyword adiceVariable cs_ac_variants
syntax keyword adiceVariable curve_selector_version
syntax keyword adiceVariable datserv_tol_factor
syntax keyword adiceVariable dcpoly_damping
syntax keyword adiceVariable dcpoly_limiting_alg
syntax keyword adiceVariable defad
syntax keyword adiceVariable defas
syntax keyword adiceVariable default_bus_radix
syntax keyword adiceVariable default_delay_f
syntax keyword adiceVariable default_delay_r
syntax keyword adiceVariable default_delay_t
syntax keyword adiceVariable default_dsw_on_res
syntax keyword adiceVariable default_logic_high_res
syntax keyword adiceVariable default_logic_low_res
syntax keyword adiceVariable default_minr
syntax keyword adiceVariable default_plot_type
syntax keyword adiceVariable defl
syntax keyword adiceVariable defnrd
syntax keyword adiceVariable defnrs
syntax keyword adiceVariable defw
syntax keyword adiceVariable diagonal_pivoting
syntax keyword adiceVariable digital_grid_height
syntax keyword adiceVariable draw_curve_labels
syntax keyword adiceVariable draw_grid_border
syntax keyword adiceVariable draw_grid_labels
syntax keyword adiceVariable draw_grid_lines
syntax keyword adiceVariable draw_title_lines
syntax keyword adiceVariable dsw_inf_thresh
syntax keyword adiceVariable dynamic_logic_capacitance
syntax keyword adiceVariable dynamic_logic_mode
syntax keyword adiceVariable echo
syntax keyword adiceVariable enable_cloning
syntax keyword adiceVariable eps0
syntax keyword adiceVariable epsox
syntax keyword adiceVariable epssil
syntax keyword adiceVariable error_on_unset_var
syntax keyword adiceVariable fft_first_point
syntax keyword adiceVariable fluxlinkagetol
syntax keyword adiceVariable freq
syntax keyword adiceVariable function_call_limit
syntax keyword adiceVariable gmin
syntax keyword adiceVariable gmintype
syntax keyword adiceVariable grid_spacing
syntax keyword adiceVariable high
syntax keyword adiceVariable high_threshold
syntax keyword adiceVariable high_voltage
syntax keyword adiceVariable hinit
syntax keyword adiceVariable hmax
syntax keyword adiceVariable hmax_factor
syntax keyword adiceVariable hmin
syntax keyword adiceVariable hmin_diagnostic_factor
syntax keyword adiceVariable homotopy_seed
syntax keyword adiceVariable inches_per_grid_line
syntax keyword adiceVariable indep_numdigits
syntax keyword adiceVariable init_debug_level
syntax keyword adiceVariable init_logic_value
syntax keyword adiceVariable init_with_nsts
syntax keyword adiceVariable intercept_window_right
syntax keyword adiceVariable intercept_window_width
syntax keyword adiceVariable interval
syntax keyword adiceVariable isw_algo
syntax keyword adiceVariable isw_float_algo
syntax keyword adiceVariable isw_loop_algo
syntax keyword adiceVariable itl1
syntax keyword adiceVariable itl2
syntax keyword adiceVariable itl3
syntax keyword adiceVariable itl4
syntax keyword adiceVariable itldcsw
syntax keyword adiceVariable itlpss_fixed
syntax keyword adiceVariable itlpss_newton
syntax keyword adiceVariable itlss1
syntax keyword adiceVariable itlss2
syntax keyword adiceVariable itlss3
syntax keyword adiceVariable itlss4
syntax keyword adiceVariable jacobian_bypass
syntax keyword adiceVariable keep_node_charge
syntax keyword adiceVariable label_placement
syntax keyword adiceVariable label_tail_end
syntax keyword adiceVariable limiting_alg
syntax keyword adiceVariable limiting_rev_bias
syntax keyword adiceVariable logic_off_res
syntax keyword adiceVariable low
syntax keyword adiceVariable low_threshold
syntax keyword adiceVariable low_voltage
syntax keyword adiceVariable lte_formula
syntax keyword adiceVariable lte_step_scale
syntax keyword adiceVariable lteratio
syntax keyword adiceVariable lvldc
syntax keyword adiceVariable lvldcsw
syntax keyword adiceVariable lvlpss
syntax keyword adiceVariable lvltim
syntax keyword adiceVariable mark_confidential
syntax keyword adiceVariable matrix_package_version
syntax keyword adiceVariable max_alert
syntax keyword adiceVariable max_contention_messages
syntax keyword adiceVariable max_label_length
syntax keyword adiceVariable max_newton_delta_v
syntax keyword adiceVariable max_sim_errors
syntax keyword adiceVariable maxcap
syntax keyword adiceVariable maxinductance
syntax keyword adiceVariable maxord
syntax keyword adiceVariable merge_parallel_devices
syntax keyword adiceVariable method
syntax keyword adiceVariable min_switch_contention
syntax keyword adiceVariable mindb
syntax keyword adiceVariable minresistance
syntax keyword adiceVariable monitor_level
syntax keyword adiceVariable monte
syntax keyword adiceVariable nemo_option
syntax keyword adiceVariable nic_expire_algo
syntax keyword adiceVariable nicnst0
syntax keyword adiceVariable nicnstr
syntax keyword adiceVariable nicnstri
syntax keyword adiceVariable nics_expire_time
syntax keyword adiceVariable noise_sort_order
syntax keyword adiceVariable notation
syntax keyword adiceVariable num_neg_scans
syntax keyword adiceVariable num_threads
syntax keyword adiceVariable number_of_fields
syntax keyword adiceVariable numdigits
syntax keyword adiceVariable numvers
syntax keyword adiceVariable optimize_caseid
syntax keyword adiceVariable optimize_generation
syntax keyword adiceVariable outlim_damping
syntax keyword adiceVariable outlim_limiting_alg
syntax keyword adiceVariable paracap
syntax keyword adiceVariable phasemax
syntax keyword adiceVariable phasewrap
syntax keyword adiceVariable platform
syntax keyword adiceVariable plot_spool_command
syntax keyword adiceVariable plot_update_interval
syntax keyword adiceVariable plt_numdigits
syntax keyword adiceVariable profile_count_init
syntax keyword adiceVariable profile_print_limit
syntax keyword adiceVariable profile_timer_interval
syntax keyword adiceVariable pss_completed_iters
syntax keyword adiceVariable pss_init_periods
syntax keyword adiceVariable pss_save_periods
syntax keyword adiceVariable pss_source_period_tol
syntax keyword adiceVariable pssratio
syntax keyword adiceVariable ptype
syntax keyword adiceVariable pzabstol
syntax keyword adiceVariable pzftol
syntax keyword adiceVariable pzmaxf
syntax keyword adiceVariable pzmaxiter
syntax keyword adiceVariable pzmaxrts
syntax keyword adiceVariable pzreltol
syntax keyword adiceVariable quitquery
syntax keyword adiceVariable rad
syntax keyword adiceVariable radar_timeout
syntax keyword adiceVariable radar_version
syntax keyword adiceVariable raise_destination
syntax keyword adiceVariable ramptime
syntax keyword adiceVariable release
syntax keyword adiceVariable reltol
syntax keyword adiceVariable reltolc
syntax keyword adiceVariable reltoli
syntax keyword adiceVariable reltolq
syntax keyword adiceVariable reltolr
syntax keyword adiceVariable reltolv
syntax keyword adiceVariable restore_sweep_variable
syntax keyword adiceVariable rng_version
syntax keyword adiceVariable rot_power_names
syntax keyword adiceVariable runmode
syntax keyword adiceVariable save_node_aliases
syntax keyword adiceVariable savetime
syntax keyword adiceVariable savetime=1
syntax keyword adiceVariable scatflg
syntax keyword adiceVariable sen_norm
syntax keyword adiceVariable set_ic_alg
syntax keyword adiceVariable settletime
syntax keyword adiceVariable shared_radar
syntax keyword adiceVariable show_cursor_channel
syntax keyword adiceVariable sim_tran_init_algo
syntax keyword adiceVariable smallest_sparse_matrix
syntax keyword adiceVariable smith_chart_type
syntax keyword adiceVariable smith_data_type
syntax keyword adiceVariable smith_freq_annot
syntax keyword adiceVariable sp__scalefactor
syntax keyword adiceVariable special_analog_grids
syntax keyword adiceVariable start_radar_at_go_time
syntax keyword adiceVariable status_notation
syntax keyword adiceVariable status_numdigits
syntax keyword adiceVariable std_behav_model_dir
syntax keyword adiceVariable std_script_dir
syntax keyword adiceVariable stolfactor
syntax keyword adiceVariable stop_on_alert
syntax keyword adiceVariable swap_limit
syntax keyword adiceVariable sweep_off_storage
syntax keyword adiceVariable symbol_spacing
syntax keyword adiceVariable tdegc
syntax keyword adiceVariable time
syntax keyword adiceVariable timetol
syntax keyword adiceVariable topology_check
syntax keyword adiceVariable trace_command_macros
syntax keyword adiceVariable trace_file_opens
syntax keyword adiceVariable tran_accel_alg
syntax keyword adiceVariable traverse_limit
syntax keyword adiceVariable tref
syntax keyword adiceVariable umoutvoltage_abstol
syntax keyword adiceVariable unknown
syntax keyword adiceVariable unknown_line_width
syntax keyword adiceVariable unknown_voltage
syntax keyword adiceVariable use_adice4_diode_temp
syntax keyword adiceVariable vl_pull0
syntax keyword adiceVariable vl_pull1
syntax keyword adiceVariable vl_strong0
syntax keyword adiceVariable vl_strong1
syntax keyword adiceVariable vl_supply0
syntax keyword adiceVariable vl_supply1
syntax keyword adiceVariable vl_weak0
syntax keyword adiceVariable vl_weak1
syntax keyword adiceVariable vntol
syntax keyword adiceVariable vthdelta
syntax keyword adiceVariable xkfet
syntax keyword adiceVariable xpndc
syntax keyword adiceVariable xpntr


" ***************** Numbers *****************************
" Match numbers
"   \<                          match start of word, and
"   [+-]\=                      match 0 or 1 of + or -, and
"   [0-9_]\+                    match 1 or more of 0-9, and
"   \(\.[0-9_]*\|\)             match . and 0 or more of 0-9, or
"   \(e[0-9_]*\|\)              match e and 0 or more of 0-9, or
"   \([tgkpnumf]\{1}[a-z]*\|\)  match match 1 eng. not. letter
"                                followed by 0 or more leters, or
"   \>                          match end of word
syntax match   adiceNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\([a-zA-Z]*\|\)\>"


" ***************** Function Group *****************************
" Highlight functions only when name is followed by a parenthesis
"   \<            match start of word, and
"   \w\+          match one or more word char (function name), and
"   \(\.\w\+\)\?  match "." followed by one or more words char, 0 or more times, and
"   \>            match end of word, and
"   \s*           match whitespace, and
"   (             match open paran
syntax match adiceFunctionGroup "\<\w\+\(\.\w\+\)\?\>\s*(" contains=adiceOperator,adiceFunction


" ***************** Command Group *****************************
" Highlight command only at beginning of line
"   \_^           match start of line, and
"   \s*           match whitespace, and
"   \<            match start of word, and
"   \(\w\+\|\W\)  match one or more word char or one non-word char ($), and
"   \>            match end of word
"syntax match adiceCommandGroup "\_^\s*\<\(\w\+\|\W\)\>" contains=ALL


" ***************** Macro Group*****************************
" Highlight macro command and command given after macro name definition
"   \_^\s*                match start of line and whitespace, and
"   \<MA\c[CRO\c]*\>      match word ma[cro] case insensitive, and
"   \(\s\+\<\w\+\>\)\{2\} match 2 words (macro name, command)
syntax match adiceMacroGroup "\_^\s*\<ma[cro]*\>\(\s\+\<\w\+\>\)\{2\}" contains=adiceCommand


" ***************** Conditional Group*****************************
" Highlight commands that may come after if/else statement
syntax match adiceConditionalGroup "\_^\s*\<\(IF\c\|ELSE\c\(I\c\|IF\c\)\?\)\>.*$" contains=ALL

" ***************** Conditional Group*****************************



" ***************** Syntax Folding *****************************
syntax region adiceDefineFold start="\_^\s*\<DEF\c\(I\c\|IN\c\|INE\c\)\?\>\s*" end="\_^\s*\<ENDDE\c\(F\c\|FI\c\|FIN\c\|FINE\c\)\?\>\s*.*$" keepend extend transparent fold

syntax region adiceScopeFold start="\_^\s*\<SCO\c\(P\c\|PE\c\)\?\>\s*" end="\_^\s*\<ENDS\c\(C\c\|CO\c\|COP\c\|COPE\c\)\?\>\s*.*$" keepend extend transparent fold

syntax region adiceHereisFold start="\_^\s*\<HER\c\(E\c\|EI\c\|EIS\c\)\?\>\s*" end="\_^\s*\<ENDH\c\(E\c\|ER\c\|ERE\c\|EREI\c\|EREIS\c\)\?\>\s*.*$" keepend extend transparent fold

syntax region adiceIfFold start="\_^\s*\<IF\c\>\s*" end="\_^\s*\<ENDI\c\(F\c\)\?\>\s*.*$" keepend extend transparent fold

syntax region adiceDoFold start="\_^\s*\<DO\c\>\s*" end="\_^\s*\<ENDDO\c\>\s*.*$" keepend extend transparent fold

syntax region adiceWhileFold start="\_^\s*\<W\c\(H\c\|HI\c\|HIL\c\|HILE\c\)\?\>\s*" end="\_^\s*\<ENDW\c\(H\c\|HI\c\|HIL\c\|HILE\c\)\?\>\s*.*$" keepend extend transparent fold



" ***************** Highlighting *****************************

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_adice_syn_inits")
   if version < 508
      let did_adice_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   HiLink adiceComment        Comment
   HiLink adiceString         String
   HiLink adiceOperator       Operator
   HiLink adiceNumber         Number
   HiLink adiceFunction       Function
   HiLink adiceVariable       Identifier
   HiLink adiceConstant       Constant
   HiLink adiceCommand        Keyword
   HiLink adiceTodo           Todo

   HiLink adiceSubCmdAlert       Keyword

   delcommand HiLink
endif

syntax case match

let b:current_syntax = "adice"
