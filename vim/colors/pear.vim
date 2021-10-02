set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="pear"

hi SpecialKey term=bold ctermfg=4 guifg=Blue
hi link EndOfBuffer NonText
hi NonText term=bold ctermfg=12 gui=bold guifg=Blue
hi Directory term=bold ctermfg=4 guifg=Blue
hi ErrorMsg term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
hi IncSearch term=reverse cterm=reverse gui=reverse
hi Search term=reverse ctermbg=11 guibg=Yellow
hi MoreMsg term=bold ctermfg=2 gui=bold guifg=SeaGreen
hi ModeMsg term=bold cterm=bold gui=bold
hi LineNr term=underline ctermfg=130 guifg=Brown
hi clear LineNrAbove
hi clear LineNrBelow
hi CursorLineNr term=bold cterm=underline ctermfg=130 gui=bold guifg=Brown
hi Question term=standout ctermfg=2 gui=bold guifg=SeaGreen
hi StatusLine term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Title term=bold ctermfg=5 gui=bold guifg=Magenta
hi Visual term=reverse ctermbg=7 guibg=LightGrey
hi clear VisualNOS
hi WarningMsg term=standout ctermfg=1 guifg=Red
hi WildMenu term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi Folded term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue guibg=LightGrey
hi FoldColumn term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue guibg=Grey
hi DiffAdd term=bold ctermbg=81 guibg=LightBlue
hi DiffChange term=bold ctermbg=225 guibg=LightMagenta
hi DiffDelete term=bold ctermfg=12 ctermbg=159 gui=bold guifg=Blue guibg=LightCyan
hi DiffText term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
hi SignColumn term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue guibg=Grey
hi Conceal ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi SpellBad term=reverse ctermbg=224 gui=undercurl guisp=Red
hi SpellCap term=reverse ctermbg=81 gui=undercurl guisp=Blue
hi SpellRare term=reverse ctermbg=225 gui=undercurl guisp=Magenta
hi SpellLocal term=underline ctermbg=14 gui=undercurl guisp=DarkCyan
hi Pmenu ctermfg=0 ctermbg=White guibg=LightMagenta
hi PmenuSel ctermfg=0 ctermbg=DarkCyan guibg=Grey
hi PmenuSbar ctermbg=248 guibg=Grey
hi PmenuThumb ctermbg=0 guibg=Black
hi TabLine term=underline cterm=underline ctermfg=0 ctermbg=7 gui=underline guibg=LightGrey
hi TabLineSel term=bold cterm=bold gui=bold
hi TabLineFill term=reverse cterm=reverse gui=reverse
hi CursorColumn term=reverse ctermbg=7 guibg=Grey90
hi CursorLine term=underline cterm=underline guibg=Grey90
hi ColorColumn term=reverse ctermbg=0 guibg=lightgrey
hi link QuickFixLine Search
hi StatusLineTerm term=bold,reverse cterm=bold ctermfg=15 ctermbg=2 gui=bold guifg=bg guibg=DarkGreen
hi StatusLineTermNC term=reverse ctermfg=15 ctermbg=2 guifg=bg guibg=DarkGreen
hi clear Normal
hi MatchParen term=reverse ctermbg=14 guibg=Cyan
hi ToolbarLine term=underline ctermbg=7 guibg=LightGrey
hi ToolbarButton cterm=bold ctermfg=15 ctermbg=242 gui=bold guifg=White guibg=Grey40
hi Comment term=bold ctermfg=4 guifg=Blue
hi Constant term=underline ctermfg=1 guifg=Magenta
hi Special term=bold ctermfg=5 guifg=#6a5acd
hi Identifier term=underline ctermfg=6 guifg=DarkCyan
hi Statement term=bold ctermfg=130 gui=bold guifg=Brown
hi PreProc term=underline ctermfg=5 guifg=#6a0dad
hi Type term=underline ctermfg=2 gui=bold guifg=SeaGreen
hi Underlined term=underline cterm=underline ctermfg=5 gui=underline guifg=SlateBlue
hi Ignore ctermfg=15 guifg=bg
hi Error term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Todo term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
hi link String Constant
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float Number
hi link Function Identifier
hi link Conditional Statement
hi link Repeat Statement
hi link Label Statement
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi link SpecialChar Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
hi link vimTodo Todo
hi link vimCommand Statement
hi clear vimStdPlugin
hi link vimOption PreProc
hi link vimErrSetting vimError
hi link vimAutoEvent Type
hi link vimGroup Type
hi link vimHLGroup vimGroup
hi link vimFuncName Function
hi clear vimGlobal
hi link vimSubst vimCommand
hi link vimComment Comment
hi link vim9Comment Comment
hi link vimNumber Number
hi link vimAddress vimMark
hi link vimAutoCmd vimCommand
hi clear vimEcho
hi clear vimIsCommand
hi clear vimExtCmd
hi clear vimFilter
hi link vimLet vimCommand
hi link vimMap vimCommand
hi link vimMark Number
hi clear vimSet
hi link vimSyntax vimCommand
hi clear vimUserCmd
hi clear vimCmdSep
hi link vimVar Identifier
hi link vimFBVar vimVar
hi link vimInsert vimString
hi link vimBehaveModel vimBehave
hi link vimBehaveError vimError
hi link vimBehave vimCommand
hi link vimFTCmd vimCommand
hi link vimFTOption vimSynType
hi link vimFTError vimError
hi clear vimFiletype
hi clear vimAugroup
hi clear vimExecute
hi link vimNotFunc vimCommand
hi clear vimFunction
hi link vimFunctionError vimError
hi link vimLineComment vimComment
hi link vimSpecFile Identifier
hi link vimOper Operator
hi clear vimOperParen
hi link vimString String
hi link vimRegister SpecialChar
hi link vimCmplxRepeat SpecialChar
hi clear vimRegion
hi clear vimSynLine
hi link vimNotation Special
hi link vimCtrlChar SpecialChar
hi link vimFuncVar Identifier
hi link vimContinue Special
hi clear vimSetEqual
hi link vimAugroupKey vimCommand
hi link vimAugroupError vimError
hi link vimEnvvar PreProc
hi link vimFunc vimError
hi link vimParenSep Delimiter
hi link vimoperStar vimOper
hi link vimSep Delimiter
hi link vimOperError Error
hi link vimFuncKey vimCommand
hi link vimFuncSID Special
hi link vimAbb vimCommand
hi link vimEchoHL vimCommand
hi link vimHighlight vimCommand
hi link vimLetHereDoc vimString
hi link vimNorm vimCommand
hi link vimSearch vimString
hi link vimUnmap vimMap
hi link vimUserCommand vimCommand
hi clear vimFuncBody
hi clear vimFuncBlank
hi link vimPattern Type
hi link vimSpecFileMod vimSpecFile
hi clear vimEscapeBrace
hi link vimSetString vimString
hi clear vimSubstRep
hi clear vimSubstRange
hi link vimUserAttrb vimSpecial
hi link vimUserAttrbError Error
hi clear vimComFilter
hi link vimUserAttrbKey vimOption
hi link vimUserAttrbCmplt vimSpecial
hi link vimUserCmdError Error
hi link vimUserAttrbCmpltFunc Special
hi link vimCommentString vimString
hi link vimPatSepErr vimError
hi link vimPatSep SpecialChar
hi link vimPatSepZ vimPatSep
hi link vimPatSepZone vimString
hi link vimPatSepR vimPatSep
hi clear vimPatRegion
hi link vimNotPatSep vimString
hi link vimStringEnd vimString
hi link vimStringCont vimString
hi link vimSubstTwoBS vimString
hi link vimSubstSubstr SpecialChar
hi clear vimCollection
hi clear vimSubstPat
hi link vimSubst1 vimSubst
hi clear vimSubst2
hi link vimSubstDelim Delimiter
hi clear vimSubstRep4
hi link vimSubstFlagErr vimError
hi clear vimCollClass
hi link vimCollClassErr vimError
hi link vimSubstFlags Special
hi link vimMarkNumber vimNumber
hi link vimPlainMark vimMark
hi clear vimRange
hi link vimPlainRegister vimRegister
hi link vimSetMod vimOption
hi link vimSetSep Statement
hi link vimLetHereDocStart Special
hi link vimLetHereDocStop Special
hi link vimMapMod vimBracket
hi clear vimMapLhs
hi clear vimAutoCmdSpace
hi clear vimAutoEventList
hi clear vimAutoCmdSfxList
hi link vimAutoCmdMod Special
hi link vimEchoHLNone vimGroup
hi link vimMapBang vimCommand
hi clear vimMapRhs
hi link vimMapModKey vimFuncSID
hi link vimMapModErr vimError
hi clear vimMapRhsExtend
hi clear vimMenuBang
hi clear vimMenuPriority
hi link vimMenuName PreProc
hi link vimMenuMod vimMapMod
hi link vimMenuNameMore vimMenuName
hi clear vimMenuMap
hi clear vimMenuRhs
hi link vimBracket Delimiter
hi link vimUserFunc Normal
hi clear vimUsrCmd
hi link vimElseIfErr Error
hi link vimBufnrWarn vimWarn
hi clear vimNormCmds
hi link vimGroupSpecial Special
hi clear vimGroupList
hi link vimSynError Error
hi link vimSynContains vimSynOption
hi link vimSynKeyContainedin vimSynContains
hi link vimSynNextgroup vimSynOption
hi link vimSynType vimSpecial
hi clear vimAuSyntax
hi link vimSynCase Type
hi link vimSynCaseError vimError
hi clear vimClusterName
hi link vimGroupName vimGroup
hi link vimGroupAdd vimSynOption
hi link vimGroupRem vimSynOption
hi clear vimIskList
hi link vimIskSep Delimiter
hi link vimSynKeyOpt vimSynOption
hi clear vimSynKeyRegion
hi link vimMtchComment vimComment
hi link vimSynMtchOpt vimSynOption
hi link vimSynRegPat vimString
hi clear vimSynMatchRegion
hi clear vimSynMtchCchar
hi clear vimSynMtchGroup
hi link vimSynPatRange vimString
hi link vimSynNotPatRange vimSynRegPat
hi link vimSynRegOpt vimSynOption
hi link vimSynReg Type
hi link vimSynMtchGrp vimSynOption
hi clear vimSynRegion
hi clear vimSynPatMod
hi link vimSyncC Type
hi clear vimSyncLines
hi clear vimSyncMatch
hi link vimSyncError Error
hi clear vimSyncLinebreak
hi clear vimSyncLinecont
hi clear vimSyncRegion
hi link vimSyncGroupName vimGroupName
hi link vimSyncKey Type
hi link vimSyncGroup vimGroupName
hi link vimSyncNone Type
hi clear vimHiLink
hi link vimHiClear vimHighlight
hi clear vimHiKeyList
hi link vimHiCtermError vimError
hi clear vimHiBang
hi link vimHiGroup vimGroupName
hi link vimHiAttrib PreProc
hi link vimFgBgAttrib vimHiAttrib
hi link vimHiAttribList vimError
hi clear vimHiCtermColor
hi clear vimHiFontname
hi clear vimHiGuiFontname
hi link vimHiGuiRgb vimNumber
hi link vimHiTerm Type
hi link vimHiCTerm vimHiTerm
hi link vimHiStartStop vimHiTerm
hi link vimHiCtermFgBg vimHiTerm
hi link vimHiCtermul vimHiTerm
hi link vimHiGui vimHiTerm
hi link vimHiGuiFont vimHiTerm
hi link vimHiGuiFgBg vimHiTerm
hi link vimHiKeyError vimError
hi clear vimHiTermcap
hi link vimHiNmbr Number
hi link vimCommentTitle PreProc
hi link vim9LineComment vimComment
hi clear vimCommentTitleLeader
hi link vimSearchDelim Statement
hi clear vimLuaRegion
hi link luaTodo Todo
hi link luaComment Comment
hi clear luaInnerComment
hi link luaParenError Error
hi link luaSpecial SpecialChar
hi clear luaIfThen
hi clear luaElseifThen
hi link luaElse Conditional
hi clear luaThenEnd
hi clear luaBlock
hi clear luaLoopBlock
hi link luaIn Operator
hi link luaStatement Statement
hi clear luaParen
hi link luaTable Structure
hi link luaBraceError Error
hi clear luaTableBlock
hi link luaError Error
hi link luaFunction Function
hi clear luaFunctionBlock
hi link luaCond Conditional
hi link luaRepeat Repeat
hi link luaLabel Label
hi link luaOperator Operator
hi link luaConstant Constant
hi link luaString2 String
hi link luaString String
hi link luaNumber Number
hi link luaFunc Identifier
hi link luaFor Repeat
hi link vimScriptDelim Comment
hi clear vimPerlRegion
hi link podCmdText String
hi link podCommand Statement
hi link podOverIndent Number
hi link podForKeywd Identifier
hi link podFormat Identifier
hi link podVerbatimLine PreProc
hi link podSpecial Identifier
hi link podEscape String
hi link podEscape2 Number
hi clear podBoldItalic
hi clear podBoldOpen
hi clear podBoldAlternativeDelimOpen
hi clear podItalicBold
hi clear podItalicOpen
hi clear podItalicAlternativeDelimOpen
hi clear podNoSpaceOpen
hi clear podNoSpaceAlternativeDelimOpen
hi clear podIndexOpen
hi clear podIndexAlternativeDelimOpen
hi clear podBold
hi clear podBoldAlternativeDelim
hi clear podItalic
hi clear podItalicAlternativeDelim
hi link perlTodo Todo
hi clear perlPOD
hi clear perlBraces
hi link perlConditional Conditional
hi link perlElseIfError Error
hi link perlRepeat Repeat
hi link perlOperator Operator
hi clear perlFakeGroup
hi link perlControl PreProc
hi link perlStatementStorage perlStatement
hi link perlStatementControl perlStatement
hi link perlStatementScalar perlStatement
hi link perlStatementRegexp perlStatement
hi link perlStatementNumeric perlStatement
hi link perlStatementList perlStatement
hi link perlStatementHash perlStatement
hi link perlStatementIOfunc perlStatement
hi clear perlFiledescStatementNocomma
hi link perlStatementFiledesc perlStatement
hi clear perlFiledescStatementComma
hi link perlStatementVector perlStatement
hi link perlStatementFiles perlStatement
hi link perlStatementFlow perlStatement
hi link perlStatementInclude perlStatement
hi link perlStatementProc perlStatement
hi link perlStatementSocket perlStatement
hi link perlStatementIPC perlStatement
hi link perlStatementNetwork perlStatement
hi link perlStatementPword perlStatement
hi link perlStatementTime perlStatement
hi link perlStatementMisc perlStatement
hi link perlStatementIndirObj perlStatement
hi clear perlStatementIndirObjWrap
hi link perlLabel Label
hi link perlVarPlain perlIdentifier
hi link perlVarNotInMatches perlIdentifier
hi link perlVarSlash perlIdentifier
hi link perlPackageRef perlType
hi clear perlVarMember
hi link perlVarSimpleMember perlIdentifier
hi link perlMethod perlIdentifier
hi link perlPostDeref perlIdentifier
hi link perlVarPlain2 perlIdentifier
hi link perlFunctionName perlIdentifier
hi clear perlVarBlock
hi clear perlVarBlock2
hi link perlShellCommand perlString
hi link perlFloat Float
hi link perlNumber Number
hi link perlStringUnexpanded perlString
hi link perlString String
hi link perlQQ perlString
hi link perlArrow perlIdentifier
hi link perlVarSimpleMemberName perlString
hi clear perlPackageConst
hi link perlFiledescRead perlIdentifier
hi link perlFiledescStatement perlIdentifier
hi link perlSpecialString perlSpecial
hi clear NONE
hi link perlSpecialStringU2 perlString
hi link perlSpecialStringU perlSpecial
hi link perlSpecialMatch perlSpecial
hi link perlNotEmptyLine Error
hi link perlMatchStartEnd perlStatement
hi link perlVStringV perlStringStartEnd
hi link perlParensSQ perlString
hi link perlBracketsSQ perlString
hi link perlBracesSQ perlString
hi link perlAnglesSQ perlString
hi link perlParensDQ perlString
hi link perlBracketsDQ perlString
hi link perlBracesDQ perlString
hi link perlAnglesDQ perlString
hi link perlMatch perlString
hi link perlSubstitutionGQQ perlString
hi link perlSubstitutionSQ perlString
hi link perlTranslationGQ perlString
hi link perlStringStartEnd perlString
hi link perlComment Comment
hi clear perlHereDocStart
hi link perlHereDoc perlString
hi clear perlAutoload
hi link perlStatementPackage perlStatement
hi link perlPackageDecl perlType
hi link perlSubError Error
hi link perlSubAttributesCont perlSubAttributes
hi link perlSubAttributes PreProc
hi link perlSubPrototypeError Error
hi link perlSubPrototype Type
hi link perlSignature Type
hi link perlSubName Function
hi link perlFunction Keyword
hi link perlSharpBang PreProc
hi link perlFormatName perlIdentifier
hi link perlFormatField perlString
hi clear perlFormat
hi link perlDATA perlComment
hi link perlInclude Include
hi link perlSpecial Special
hi link perlCharacter Character
hi link perlType Type
hi link perlIdentifier Identifier
hi link perlStatement Statement
hi link perlList perlStatement
hi link perlMisc perlStatement
hi link perlStorageClass perlType
hi link perlFunctionPRef perlType
hi link perlSpecialAscii perlSpecial
hi link perlSpecialDollar perlSpecial
hi clear perlSync
hi clear perlSyncPOD
hi link vimEmbedError vimError
hi clear vimPythonRegion
hi link pythonStatement Statement
hi link pythonFunction Function
hi link pythonConditional Conditional
hi link pythonRepeat Repeat
hi link pythonOperator Operator
hi link pythonException Exception
hi link pythonInclude Include
hi link pythonAsync Statement
hi link pythonDecorator Define
hi link pythonDecoratorName Function
hi link pythonDoctestValue Define
hi clear pythonMatrixMultiply
hi link pythonTodo Todo
hi link pythonComment Comment
hi link pythonQuotes String
hi link pythonEscape Special
hi link pythonString String
hi link pythonTripleQuotes pythonQuotes
hi clear pythonSpaceError
hi link pythonDoctest Special
hi link pythonRawString String
hi link pythonNumber Number
hi link pythonBuiltin Function
hi clear pythonAttribute
hi link pythonExceptions Structure
hi clear pythonSync
hi clear vimAugroupSyncA
hi link vimError Error
hi link vimKeyCodeError vimError
hi link vimWarn WarningMsg
hi link vimAuHighlight vimHighlight
hi link vimAutoCmdOpt vimOption
hi link vimAutoSet vimCommand
hi link vimCondHL vimCommand
hi link vimElseif vimCondHL
hi link vimFold Folded
hi link vimSynOption Special
hi link vimHLMod PreProc
hi link vimKeyCode vimSpecFile
hi link vimKeyword Statement
hi link vimSpecial Type
hi link vimStatement Statement
hi ExtraWhitespace ctermbg=9 guibg=red
