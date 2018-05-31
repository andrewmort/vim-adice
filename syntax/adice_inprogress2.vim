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
syntax match   adiceOperator "[|~><!)(*%@+/=?:;}{,.\^\-\[\]]"
syntax match   adiceOperator "&\s*\<"
"TODO fix non-newline operator to work more consistently with var & -var



" ***************** Todo *****************************
syntax keyword adiceTodo contained TODO FIXME XXX NOTE


" ***************** Comments *****************************
" Setup so that tpying first /* will create comment for entire remainder of
" file until */ is typed on the same line or & is used to continue the line
"syntax region adiceComment     start="\(/\*\)\@=" end="/\*\(.\|&\s*\n\)*\*/" contains=adiceTodo,adiceComment,@Spell
syntax region adiceComment     start="/\*" end="\*/" end="$" contains=adiceTodo,adiceSpecialLine,adiceComment,@Spell
syntax region adiceCommentLine start="\_^\s*\*" end="$" contains=adiceTodo,adiceSpecialLine,@Spell


" ***************** Strings *****************************
syntax region adiceString start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell

syntax match  adiceSpecialLine contained "&\s*$"
syntax region adiceSpecialFile contained start="\#" end="\<\w\+\>" end="$" contains=adiceOperator,adiceSpecialLine,adiceComment
syntax cluster adiceSpecialGroup contains=adiceSpecialLine,adiceSpecialFile


syntax keyword adiceFunction is_set is_signed is_string is_unsigned


" ***************** Commands *****************************

" Require all commands to begin on new line
syntax region adiceCmdBegin start="\_^\(/\*\|\s\|&\s*$\)*\<\(\w\+\|\W\)" end="\>" contains=@adiceCmdGroup,@adiceNonCmdGroup

" Cluster contains all adice commands
syntax cluster adiceCmdGroup contains=adiceCommand

" Cluster contains everything that is not in a command
syntax cluster adiceNonCmdGroup contains=adiceFunction,adiceOperator,adiceComment,adiceSpecialLine,adiceString

" Cluster used between command and required subcommand
syntax cluster adiceCmdFollowGroup contains=adiceSpecialFile,adiceSpecialLine,adiceOperator,adiceComment

" Cluster used between subcommand and additional subcommand
syntax cluster adiceCmdSubFollowGroup contains=adiceSpecialLine,adiceComment


"** Common SubCommands ***
syntax region adiceCmdSubAll   contained matchgroup=adiceCmdSub start="\<all\>" end="\>"
syntax region adiceCmdSubAll   contained matchgroup=adiceCmdSub start="\<plm\>" end="\>"
syntax region adiceCmdSubNES   contained matchgroup=adiceCmdSub start="\<\(node\|element\|scalar\)\>" end="\>"
syntax region adiceCmdSubIn    contained matchgroup=adiceCmdSub start="\<in\>" end="\>"

"** Alert Command **
syntax region adiceCmdAlert contained matchgroup=adiceCommand start="\<ale\%[rt]\>" end="$" end="\(\#\|)\|/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdFollowGroup nextgroup=@adiceCmdAlertGroup

syntax cluster adiceCmdAlertGroup contains=adiceCmdAlertSubAdd,adiceCmdAlertSubDel,adiceCmdAlertSubOnOff,adiceCmdAlertSubReset,adiceCmdAlertSubElement,adiceCmdAlertSubSuppress,adiceCmdAlertSubReport

syntax region adiceCmdAlertSubAdd      contained matchgroup=adiceCmdSub start="\<add\>"       end="\>"
syntax region adiceCmdAlertSubDel      contained matchgroup=adiceCmdSub start="\<del\>"       end="$" contains=adiceCmdSubAll,@adiceNonCmdGroup
syntax region adiceCmdAlertSubElement  contained matchgroup=adiceCmdSub start="\<element\>"   end="\>"
syntax region adiceCmdAlertSubOnOff    contained matchgroup=adiceCmdSub start="\<on\>"            end="$" end="\(/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdSubFollowGroup nextgroup=adiceCmdAlertSubOnOffSub
syntax region adiceCmdAlertSubOnOff    contained matchgroup=adiceCmdSub start="\<off\>"       end="$" end="\(/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdSubFollowGroup nextgroup=adiceCmdAlertSubOnOffSub
syntax region adiceCmdAlertSubReport   contained matchgroup=adiceCmdSub start="\<report\>"    end="\>"
syntax region adiceCmdAlertSubReset    contained matchgroup=adiceCmdSub start="\<reset\>"     end="\>"
syntax region adiceCmdAlertSubSuppress contained matchgroup=adiceCmdSub start="\<suppress\>"  end="\>"

syntax region adiceCmdAlertSubOnOffSub   contained matchgroup=adiceCmdSub start="\<\(mod\|com\)\>"           end="\>"

"** Alter Command **
syntax region adiceCmdAlter contained transparent matchgroup=adiceCommand start="\<alt\%[er]\>" end="$" contains=@adiceCmdFollowGroup,@adiceNonCmdGroup,adiceCmdSubIn
syntax cluster adiceCmdGroup add=adiceCmdAlter

"** Beep Command **
syntax keyword adiceCommand contained be[ep]

"** Break Command **
syntax keyword adiceCommand contained br[eak]

"** Catch Command **
syntax region adiceCmdCatch contained transparent matchgroup=adiceCommand start="\<ca\%[tch]\>" end="$" end="\(\#\|)\|/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdFollowGroup nextgroup=@adiceCmdGroup
syntax cluster adiceCmdGroup add=adiceCmdCatch

"** Clear Command **
syntax keyword adiceCommand contained cle[ar]

"** Close Command **
syntax region adiceCmdClose transparent matchgroup=adiceCommand start="\<clo\%[se]\>" end="$" end="\(/\*\|&\s*$\|\s\)\@!"  contains=@adiceCmdSubFollowGroup nextgroup=adiceCmdSubAll,adiceSpecialFile
syntax cluster adiceCmdGroup add=adiceCmdClose

"** Command Command **
syntax keyword adiceCommand contained com[mand] nextgroup=adiceSpecialFile

"** Continue Command **
syntax region adiceCmdContinue contained transparent matchgroup=adiceCommand start="\<con\%[tinue]\>" end="$" contains=@adiceCmdFollowGroup,@adiceNonCmdGroup,adiceCmdSubIn
syntax cluster adiceCmdGroup add=adiceCmdClose

"** Display Command **
syntax region adiceCmdDisplay contained transparent matchgroup=adiceCommand start="\<dis\%[play]\>" end="$" end="\(\#\|)\|/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdFollowGroup nextgroup=adiceCmdDisplaySubLong,@adiceCmdDisplayGroup
"

syntax cluster adiceCmdDisplayGroup contains=adiceCmdDisplaySubAc,adiceCmdDisplaySubAlias,adiceCmdDisplaySubAspects,adiceCmdDisplaySubDc,adiceCmdDisplaySubElements,adiceCmdDisplaySubEpath,adiceCmdDisplaySubExecutes,adiceCmdDisplaySubFlatNodes,adiceCmdDisplaySubFop,adiceCmdDisplaySubFrequency,adiceCmdDisplaySubInclude,adiceCmdDisplaySubIsolating,adiceCmdDisplaySubKeeps,adiceCmdDisplaySubLabel,adiceCmdDisplaySubLibrary,adiceCmdDisplaySubModels,adiceCmdDisplaySubMonitored,adiceCmdDisplaySubMor,adiceCmdDisplaySubNemo,adiceCmdDisplaySubNics,adiceCmdDisplaySubNodes,adiceCmdDisplaySubNoise,adiceCmdDisplaySubNonics,adiceCmdDisplaySubNpars,adiceCmdDisplaySubNsts,adiceCmdDisplaySubOpen,adiceCmdDisplaySubParameterize,adiceCmdDisplaySubParts,adiceCmdDisplaySubPcaps,adiceCmdDisplaySubPss,adiceCmdDisplaySubPz,adiceCmdDisplaySubSaveas,adiceCmdDisplaySubSensitivity,adiceCmdDisplaySubSimulate,adiceCmdDisplaySubStats,adiceCmdDisplaySubSubckt,adiceCmdDisplaySubSubsys_of,adiceCmdDisplaySubSweep,adiceCmdDisplaySubTran

syntax region adiceCmdDisplaySubLong transparent contained matchgroup=adiceCmdSub start="\<long\>" end="$" end="\(\#\|)\|/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdSubFollowGroup nextgroup=adiceCmdDisplaySubElements,adiceCmdDisplaySubStats

syntax region adiceCmdDisplaySubAc           contained matchgroup=adiceCmdSub start="\<ac\>"               end="\>"
syntax region adiceCmdDisplaySubAlias        contained matchgroup=adiceCmdSub start="\<al\%[ias]\>"        end="\>"
syntax region adiceCmdDisplaySubAspects      contained matchgroup=adiceCmdSub start="\<as\%[pects]\>"      end="\>"
syntax region adiceCmdDisplaySubDc           contained matchgroup=adiceCmdSub start="\<dc\>"               end="\>"
syntax region adiceCmdDisplaySubElements     contained matchgroup=adiceCmdSub start="\<el\%[ements]\>"     end="\>"
syntax region adiceCmdDisplaySubEpath        contained matchgroup=adiceCmdSub start="\<ep\%[ath]\>"        end="\>"
syntax region adiceCmdDisplaySubExecutes     contained matchgroup=adiceCmdSub start="\<ex\%[ecutes]\>"     end="\>"
syntax region adiceCmdDisplaySubFlatNodes    contained matchgroup=adiceCmdSub start="\<fl\%[at_nodes]\>"   end="\>"
syntax region adiceCmdDisplaySubFop          contained matchgroup=adiceCmdSub start="\<fo\%[p]\>"          end="$" end="\(/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdSubFollowGroup nextgroup=adiceCmdSubNES
syntax region adiceCmdDisplaySubFrequency    contained matchgroup=adiceCmdSub start="\<fr\%[equency]\>"    end="\>"
syntax region adiceCmdDisplaySubInclude      contained matchgroup=adiceCmdSub start="\<in\%[clude]\>"      end="\>"
syntax region adiceCmdDisplaySubIsolating    contained matchgroup=adiceCmdSub start="\<is\%[olating]\>"    end="\>"
syntax region adiceCmdDisplaySubKeeps        contained matchgroup=adiceCmdSub start="\<ke\%[eps]\>"        end="\>"
syntax region adiceCmdDisplaySubLabel        contained matchgroup=adiceCmdSub start="\<la\%[bel]\>"        end="\>"
syntax region adiceCmdDisplaySubLibrary      contained matchgroup=adiceCmdSub start="\<li\%[brary]\>"      end="\>"
syntax region adiceCmdDisplaySubModels       contained matchgroup=adiceCmdSub start="\<mod\%[els]\>"       end="\>"
syntax region adiceCmdDisplaySubMonitored    contained matchgroup=adiceCmdSub start="\<mon\%[itored]\>"    end="\>"
syntax region adiceCmdDisplaySubMor          contained matchgroup=adiceCmdSub start="\<mor\>"              end="\>"
syntax region adiceCmdDisplaySubNemo         contained matchgroup=adiceCmdSub start="\<ne\%[mo]\>"         end="$" end="\(/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdSubFollowGroup nextgroup=adiceCmdDisplaySubNemoSub
syntax region adiceCmdDisplaySubNics         contained matchgroup=adiceCmdSub start="\<ni\%[cs]\>"         end="$" end="\(/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdSubFollowGroup nextgroup=adiceCmdSubNES
syntax region adiceCmdDisplaySubNodes        contained matchgroup=adiceCmdSub start="\<nod\%[es]\>"        end="\>"
syntax region adiceCmdDisplaySubNoise        contained matchgroup=adiceCmdSub start="\<noi\%[se]\>"        end="\>"
syntax region adiceCmdDisplaySubNonics       contained matchgroup=adiceCmdSub start="\<non\%[ics]\>"       end="\>"
syntax region adiceCmdDisplaySubNpars        contained matchgroup=adiceCmdSub start="\<np\%[ars]\>"        end="\>"
syntax region adiceCmdDisplaySubNsts         contained matchgroup=adiceCmdSub start="\<ns\%[ts]\>"         end="$" end="\(/\*\|&\s*$\|\s\)\@!" contains=@adiceCmdSubFollowGroup nextgroup=adiceCmdSubNES
syntax region adiceCmdDisplaySubOpen         contained matchgroup=adiceCmdSub start="\<o\%[pen]\>"         end="\>"
syntax region adiceCmdDisplaySubParameterize contained matchgroup=adiceCmdSub start="\<param\%[eterize]\>" end="\>"
syntax region adiceCmdDisplaySubParts        contained matchgroup=adiceCmdSub start="\<part\%[s]\>"        end="\>"
syntax region adiceCmdDisplaySubPcaps        contained matchgroup=adiceCmdSub start="\<pc\%[aps]\>"        end="\>"
syntax region adiceCmdDisplaySubPss          contained matchgroup=adiceCmdSub start="\<ps\%[s]\>"          end="\>"
syntax region adiceCmdDisplaySubPz           contained matchgroup=adiceCmdSub start="\<pz\>"               end="\>"
syntax region adiceCmdDisplaySubSaveas       contained matchgroup=adiceCmdSub start="\<sa\%[veas]\>"       end="\>"
syntax region adiceCmdDisplaySubSensitivity  contained matchgroup=adiceCmdSub start="\<se\%[nsitivity]\>"  end="\>"
syntax region adiceCmdDisplaySubSimulate     contained matchgroup=adiceCmdSub start="\<si\%[mulate]\>"     end="\>"
syntax region adiceCmdDisplaySubStats        contained matchgroup=adiceCmdSub start="\<st\%[ats]\>"        end="\>"
syntax region adiceCmdDisplaySubSubckt       contained matchgroup=adiceCmdSub start="\<subc\%[kt]\>"       end="\>"
syntax region adiceCmdDisplaySubSubsys_of    contained matchgroup=adiceCmdSub start="\<subs\%[ys_of]\>"    end="\>"
syntax region adiceCmdDisplaySubSweep        contained matchgroup=adiceCmdSub start="\<sw\%[eep]\>"        end="\>"
syntax region adiceCmdDisplaySubTran         contained matchgroup=adiceCmdSub start="\<t\%[ran]\>"         end="\>"

syntax region adiceCmdDisplaySubNemoSub  contained matchgroup=adiceCmdSub start="\<\(r\|l\|rl\|c\|total_c\)\>" end="\>"

"syntax region adiceCmdDisplaySubLong contained matchgroup=adiceCmdSub start="." end="\<long\>" end="$" nextgroup=adiceCmdDisplaySubElements contains=@adiceNonCmdGroup
"syntax region adiceCmdDisplaySubElements contained matchgroup=adiceCmdSub start="." end="\<elements\>" end="$" contains=@adiceNonCmdGroup


"syntax match adiceCmdDisplay "\<dis\(p\|pl\|pla\|play\)\?\>\s+\(\#\s*[(]\?\<\w*\>[)]\?\)\?  \<\w+\>" contains=@adiceNonCmdGroup,adiceCmdDisplaySubLong,adiceCmdDisplaySubElements,adiceCmdDisplaySubFop
"syntax cluster adiceCmdGroup add=adiceCmdDisplay

"syntax region  adiceCmdDisplaySub contained matchgroup=adiceCmdSub start="\<alias\>" start="\<aspects\>" start="\<long\>" start="\<elements\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" start="\<\>" end="\>"
"syntax cluster adiceCmdGroup add=adiceCmdDisplay


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
   HiLink adiceCommentLine    Comment

   HiLink adiceString         String
   HiLink adiceOperator       Operator
   HiLink adiceNumber         Number
   HiLink adiceFunction       Function
   HiLink adiceVariable       Identifier
   HiLink adiceConstant       Constant
   HiLink adiceTodo           Todo

   HiLink adiceCommand        Keyword
   HiLink adiceCmdSub         Type
   HiLink adiceSpecialLine    Special
   HiLink adiceSpecialFile    Special

   delcommand HiLink
endif

syntax case match

let b:current_syntax = "adice"
