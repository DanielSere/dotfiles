-- ######################
-- ## Color Properties ##
-- ######################
local colors = {
	highlightColor = '#dadada';
	cursorColor =    '#dadada';
	foreground =     '#dadada';
	background =     '#141b1e';
	black =          '#232a2d';
	red =            '#e57474';
	green =          '#8ccf7e';
	yellow =         '#e5c76b';
	blue =           '#67b0e8';
	purple =         '#c47fd5';
	cyan =           '#6cbfbf';
	white =          '#b3b9b8';
	light_black =    '#2d3437';
	light_red =      '#ef7e7a';
	light_green =    '#96d988';
	light_yellow =   '#f4d67a';
	light_blue =     '#71baf2';
	light_purple =   '#ce89df';
	light_cyan =     '#67cbe7';
	light_white =    '#bdc3c2';
	grey1 =          '#262e32';
	light_grey =          '#4a545e';
	none = 'NONE';
}

-- #####################
-- ## Terminal Colors ##
-- #####################
function colors.terminal_color()
	vim.g.terminal_0 = colors.background
	vim.g.terminal_1 = colors.red
	vim.g.terminal_2 = colors.green
	vim.g.terminal_3 = colors.yellow
	vim.g.terminal_4 = colors.blue
	vim.g.terminal_5 = colors.purple
	vim.g.terminal_6 = colors.cyan
	vim.g.terminal_7 = colors.foreground
	vim.g.terminal_8 = colors.background
	vim.g.terminal_9 = colors.light_red
	vim.g.terminal_10 = colors.light_green
	vim.g.terminal_11 = colors.light_yellow
	vim.g.terminal_12 = colors.light_blue
	vim.g.terminal_13 = colors.light_purple
	vim.g.terminal_14 = colors.light_cyan
	vim.g.terminal_15 = colors.foreground
end

-- ########################
-- ## Highlight Function ##
-- ########################
function colors.highlight(group, color)
	local style = color.style and 'gui=' .. color.style or 'gui=NONE'
	local fg =    color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
	local bg =    color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
	local sp =    color.sp and 'guisp=' .. color.sp or ''
	vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg..' '..sp)
end

function colors.load_syntax()
	local syntax = {
		-- ##################
		-- ## Syntax Group ##
		-- ##################
		Boolean=        { fg=colors.yellow };
		Comment=        { fg=colors.light_grey };
		Constant=       { fg=colors.cyan };
		Character=      { fg=colors.green };
		Conditional=    { fg=colors.purple };
		Define=         { fg=colors.purple };
		Error=          { fg=colors.red };
		Exception=      { fg=colors.purple };
		Float=          { fg=colors.yellow };
		Function=       { fg=colors.blue };
		-- Identifier=     { fg=colors.light_red };
		Include=        { fg=colors.purple };
		Keyword=        { fg=colors.purple };
		Label=          { fg=colors.purple };
		Macro=          { fg=colors.purple };
		Number=         { fg=colors.yellow };
		Operator=       { fg=colors.light_purple };
		PreProc=        { fg=colors.yellow };
		PreCondit=      { fg=colors.yellow };
		Repeat=         { fg=colors.purple };
		Statement=      { fg=colors.purple };
		StorageClass=   { fg=colors.yellow };
		Special=        { fg=colors.blue };
		SpecialChar=    { fg=colors.yellow };
		Structure=      { fg=colors.yellow };
		String=         { fg=colors.green  };
		SpecialComment= { fg=colors.grey1 };
		Typedef=        { fg=colors.yellow };
		Type=           { fg=colors.yellow };
		Todo=           { fg=colors.purple };
		Underlined=     { fg=colors.none, style='underline' };
		Debug=          {};
		Delimiter=      {};
		Ignore=         {};
		Tag=            {};
		-- ################
		-- ## Treesitter ##
		-- ################
		TSError=              { fg=colors.red };
      	TSPunctDelimitter=    { fg=colors.cyan };
      	TSPunctBracket=       {};
      	TSPunctSpecial=       { fg=colors.cyan };
      	TSConstant=           { fg=colors.yellow };
      	TSConstBuiltin=       { fg=colors.blue };
      	TSContMacro=          { fg=colors.purple };
      	TSString=             { fg=colors.green };
      	TSStringRegex=        { fg=colors.red };
      	TSCharacter=          { fg=colors.green };
      	TSNumber=             { fg=colors.yellow };
      	TSBoolean=            { fg=colors.yellow };
      	TSFloat=              { fg=colors.yellow };
      	TSAnnotation=         { fg=colors.blue };
      	TSAttribute=          { fg=colors.yellow };
      	TSNamespace=          { fg=colors.blue };
      	TSFunctionBuiltin=    { fg=colors.blue };
      	TSFunction=           { fg=colors.blue };
      	TSFuncMacro=          { fg=colors.blue };
      	TSParameter=          { fg=colors.red };
      	TSParameterReference= { fg=colors.red };
      	TSMethod=             { fg=colors.blue };
      	TSField=              { fg=colors.yellow };
      	TSProperty=           { fg=colors.yellow };
      	TSConstructor=        { fg=colors.blue };
      	TSConditional=        { fg=colors.purple };
      	TSRepeat=             { fg=colors.purple };
      	TSLabel=              { fg=colors.purple };
      	TSKeyword=            { fg=colors.purple };
      	TSKeywordFunction=    { fg=colors.purple };
      	TSKeywordOperator=    { fg=colors.cyan };
      	TSOperator=           { fg=colors.cyan };
      	TSExeption=           { fg=colors.red };
      	TSType=               { fg=colors.blue };
      	TSTypeBuiltin=        { fg=colors.red };
      	TSStructure=          { fg=colors.yellow };
      	TSInclude=            { fg=colors.red };
      	TSVariable=           { fg=colors.yellow };
      	TSVariableBuiltin=    { fg=colors.blue };
      	TSText=               {};
      	TSStrong=             { fg=colors.purple };
      	TSEmphasis=           { fg=colors.cyan };
      	TSUnderline=          { fg=colors.yellow };
      	TSTitle=              { fg=colors.yellow };
      	TSLiteral=            { fg=colors.green };
      	TSUri=                { fg=colors.green };
      	TSTag=                {};
      	TSTagDelimitter=      {};
		-- #####################
		-- ## Highlight Group ##
		-- #####################
		BufferInactive=      { fg=colors.foreground, bg=colors.grey1 };
      	BufferInactiveTarge= { fg=colors.foreground, bg=colors.grey1 };
      	BufferInactiveSign=  { fg=colors.blue, bg=colors.grey1 };
      	BufferCurrent=       { fg=colors.yellow, bg=colors.background, style ='bold' };
      	BufferCurrentSign=   { fg=colors.blue, bg=colors.background };
      	BufferTabPageFill=   { fg=colors.blue, bg=colors.background };
      	BufferCurrentMod=    { fg=colors.blue, bg=colors.background };
      	BufferInactiveMod=   { fg=colors.blue, bg=colors.grey1 };
      	ColorColumn=         { fg=colors.none, bg=colors.grey1 };
      	Conceal=             { fg=colors.grey1, bg=colors.none };
      	CursorLineNr=        { fg=colors.blue };
      	CursorIM=            { fg=colors.none, bg=colors.none, style='reverse' };
      	CursorColumn=        { fg=colors.none, bg=colors.grey1 };
      	CursorLine=          { fg=colors.none, bg=colors.grey1 };
      	Cursor=              { fg=colors.none, bg=colors.none, style='reverse' };
      	DiffAdd=             { fg=colors.light_green, bg=colors.background };
      	DiffChange=          { fg=colors.light_yellow, bg=colors.background };
      	DiffDelete=          { fg=colors.light_red, bg=colors.background };
      	DiffText=            { fg=colors.foreground, bg=colors.background };
      	Directory=           { fg=colors.grey1, bg=colors.none };
      	debugBreakpoint=     { fg=colors.background, bg=colors.red };
      	EndOfBuffer=         { fg=colors.background, bg=colors.none };
      	ErrorMsg=            { fg=colors.red, bg=colors.none, style='bold' };
      	FoldColumn=          { fg=colors.foreground, bg=colors.background };
      	Folded=              { fg=colors.grey1, bg=colors.grey1 };
      	iCursor=             { fg=colors.none, bg=colors.none, style='reverse' };
      	IncSearch=           { fg=colors.grey1, bg=colors.yellow, style=colors.none };
      	lCursor=             { fg=colors.none, bg=colors.none, style='reverse' };
      	LineNr=              { fg=colors.grey1 };
      	ModeMsg=             { fg=colors.foreground, bg=colors.none, style='bold' };
      	MatchParen=          { fg=colors.red, bg=colors.none };
      	Normal=              { fg=colors.foreground, bg=colors.background };
      	NormalFloat=         { fg=colors.foreground, bg=colors.grey1 };
      	NonText=             { fg=colors.grey1 };
      	Pmenu=               { fg=colors.foreground, bg=colors.grey1 };
      	PmenuSel=            { fg=colors.grey1, bg=colors.blue };
      	PmenuSelBold=        { fg=colors.grey1, bg=colors.blue };
      	PmenuSbar=           { fg=colors.none, bg=colors.grey1 };
      	PmenuThumb=          { fg=colors.purple, bg=colors.green };
      	Question=            { fg=colors.yellow };
      	QuickFixLine=        { fg=colors.purple, style='bold' };
      	StatusLine=          { fg=colors.grey1, bg=colors.grey1, style=colors.none };
      	StatusLineNC=        { fg=colors.grey1, bg=colors.grey1, style=colors.none };
      	SpellBad=            { fg=colors.red, bg=colors.none, style='undercurl' };
      	SpellCap=            { fg=colors.blue, bg=colors.none, style='undercurl' };
      	SpellLocal=          { fg=colors.cyan, bg=colors.none, style='undercurl' };
      	SpellRare=           { fg=colors.purple, bg=colors.none, style='undercurl' };
      	SignColumn=          { fg=colors.foreground, bg=colors.background };
      	Search=              { fg=colors.background, bg=colors.yellow };
      	SpecialKey=          { fg=colors.grey1 };
      	TabLineSel=          { bg=colors.background };
      	Title=               { fg=colors.green, style='bold' };
      	Terminal=            { fg=colors.foreground, bg=colors.background };
      	TabLineFill=         { style=colors.none };
      	VertSplit=           { fg=colors.grey1, bg=colors.grey1 };
      	vCursor=             { fg=colors.none, bg=colors.none, style='reverse' };
      	WarningMsg=          { fg=colors.yellow, bg=colors.none, style='bold' };
      	Whitespace=          { fg=colors.grey1 };
      	WildMenu=            { fg=colors.foreground, bg=colors.green };
      	Visual=              { fg=colors.none, bg=colors.grey1 };
      	VisualNOS=           { fg=colors.background, bg=colors.foreground };
	}
	return syntax
end

--[[ function colors.load_plugin_syntax()
	local plugin_syntax = {
	-- ###############
	-- ## Git Stuff ##
	-- ###############
		diffAdded =     { fg=colors.green };
		diffRemoved =   { fg=colors.red };
		diffChanged =   { fg=colors.blue };
		diffOldFile =   { fg=colors.yellow };
		diffNewFile =   { fg=colors.yellow };
		diffFile =      { fg=colors.cyan };
		diffLine =      { fg=colors.grey1 };
		diffIndexLine = { fg=colors.purple };
	}
	return plugin_syntax
end
local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function ()
	colors.terminal_color()
	local syntax = colors.load_plugin_syntax()
	for group, color in pairs(syntax) do
		colors.highlight(group,color)
	end
	async_load_plugin:close()
end)) ]]

function colors.colorscheme()
	vim.api.nvim_command('hi clear')
	if vim.fn.exists('syntax_on') then
		vim.api.nvim_command('syntax reset')
	end
	vim.o.termguicolors = true
	vim.g.colors_name = 'colorscheme'
	local syntax = colors.load_syntax()
	for group, color in pairs(syntax) do
		colors.highlight(group, color)
	end
	-- async_load_plugin:send()
end

colors.colorscheme()

return colors























