" Vim Colour Scheme based on EasyColour Plugin

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

call EasyColour#ColourScheme#LoadColourScheme('dbs')
