Version 4 of Basic Help Menu by Wade Clarke begins here.

"Adds a HELP command to your Glulx or Z-Code project for Inform 6M62 or later which brings up a menu giving some standard instructions about IF. This is a tech and content update of Emily Short's Basic Help Menu extension made for compatibility with Wade Clarke's Menus. Requires Menus by Wade Clarke (version 5 or greater) to run."

Include version 5 of Menus by Wade Clarke.

When play begins:
	now mn_master_table is table of help contents;

table of help contents
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"Introduction to [story title]"	--	"Welcome to [story title]."
"Instructions for Play"	table of instruction options	--

table of instruction options
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"About Interactive Fiction"	--	"The game you are playing is a work of Interactive Fiction. In interactive fiction you play the main character of a story. You type commands which determine the actions of the character and the flow of the plot. Some IF games include graphics, but most do not: the imagery is provided courtesy of your imagination. On the other hand, there's a wide range of action available: whereas in other games you may be restricted to shooting, movement, or searching items you can click on with a mouse, IF allows you a wide range of verbs."
"What to do with [command prompt]"	--	"The [command prompt] sign is where the game says, 'Okay, what do you want to do now?' You may respond by typing an instruction -- usually an imperative verb, possibly followed by prepositions and objects. So, for instance, LOOK, LOOK AT FISH, TAKE FISH."
"Getting Started"	--	"The first thing you want to do when starting a game is acquaint yourself with your surroundings and get a sense of your goal. To this end, you should read the introductory text carefully. Sometimes it contains clues. You will also want to look at the room you are in. Notice where the exits from the room are, and what objects are described here. If any of these seem interesting, you may want to EXAMINE them. (You can abbreviate the EXAMINE command to just X, if you want.)[paragraph break]You might also want to examine yourself (EXAMINE ME or X ME) to see whether the author has left you any clues about your character. INVENTORY (I for short) will tell you what you're carrying, as well.[paragraph break]Once you've gotten your bearings, you may want to explore. Move from room to room, and check out every location available."
"Rooms and Travel"	--	"At any given time, you are in a specific location, or room. When you go into a room, the game will print a description of what you can see there. This description will contain two vital kinds of information: things in the room you can interact with or take, and a list of exits, or ways out. If you want to see the description again, you may just type LOOK (L for short). [paragraph break]When you want to leave a location and go to another one, you may communicate this to the game using compass directions: eg, GO NORTH. For simplicity's sake, you are allowed to omit the word GO, and to abbreviate the compass directions. So you may use NORTH, SOUTH, EAST, WEST, NORTHEAST, SOUTHEAST, NORTHWEST, SOUTHWEST, UP, and DOWN, or in short form N, S, E, W, NE, SE, NW, SW, U, and D.[paragraph break]In some locations, IN and OUT will also be useful."
"Objects"	--	"Throughout the game there will be assorted objects that you can do things with. Most importantly, you may TAKE or GET items, and (when you are tired of them) DROP them again. INVENTORY (abbreviated I) will list the items you are currently holding. [paragraph break]There are usually assorted things you may do with these objects. OPEN, CLOSE, WEAR, EAT, LOCK, and UNLOCK are especially common.[paragraph break]Occasionally, you will find that the game does not recognize the name of an object even though it has been described as being in the room with you. If this is the case, the object is just there for scenery, and you may assume that you do not need to interact with it."
"Controlling the Game"	--	"There are a few simple commands for controlling the game itself. These are: [paragraph break]SAVE saves a snapshot of the game as it is now. [line break]RESTORE puts the game back to a previous saved state. You may keep as many saved games as you like. [line break]RESTART puts the game back to the way it was at the beginning. [line break]QUIT ends the game."
"How the World is Assembled"	table of IF elements	--
"If You Get Stuck"	table of stuckness advice	--

table of stuckness advice
title (text)	description (text)	used (number)	bookpage (number)	localpage (number)
"Explore"	"Examine every object and look at everything in your inventory. Open all the doors you can find, and go through them. Look inside all closed containers. Make sure you've exhausted all the options in your environment. [paragraph break]Try out all your senses. If the game mentions texture, odor, or sound, try touching, smelling, listening to, or tasting objects.[paragraph break]Be thorough. If you still can't figure out what to do, try opening windows, looking under beds, etc. Sometimes objects are well-hidden."
"Read carefully"	"Reread. Look back at things you've already looked at. Sometimes this will trigger an idea you hadn't thought of. [paragraph break]Take hints from the prose of the game. Things that are described in great detail are probably more important than things that are given one-liners. Play with those objects. If a machine is described as having component parts, look at the parts, and try manipulating them. Likewise, notice the verbs that the game itself uses. Try using those yourself. Games often include special verbs -- the names of magic spells, or other special commands. There's no harm in attempting something if the game mentions it.[paragraph break]Check the whole screen. Are there extra windows besides the main window? What's going on in those? Check out the status window, if there is one -- it may contain the name of the room you're in, your score, the time of day, your character's state of health, or some other important information. If there's something up there, it's worth paying attention to that, too. When and where does it change? Why is it significant? If the bar is describing your character's health, you can bet there is probably a point at which that will be important."
"Be creative"	"Rephrase. If there's something you want to do, but the game doesn't seem to understand you, try alternative wordings. [paragraph break]Try variations. Sometimes an action doesn't work, but does produce some kind of unusual result. These are often indications that you're on the right track, even if you haven't figured out quite the right approach yet. Pressing the red button alone may only cause a grinding noise from inside the wall, so perhaps pressing the blue and then the red will open the secret door.[paragraph break]Consider the genre of the game. Mysteries, romances, and thrillers all have their own types of action and motivation. What are you trying to do, and how do conventional characters go about doing that? What's the right sort of behavior for a detective/romance heroine/spy?"
"Cooperate"	"Play with someone else. Two heads are often better than one. If that doesn't work, try emailing the author or (better yet) posting a request for hints on the 'Game Discussion, Hints and Reviews' forum at http://www.intfiction.org/forum/. For best results, put the name of the game you want help with in the subject line and describe your problem as clearly as possible in your post. Enclose the problem in the available spoiler tags (highlight the text and click the 'spoiler' button) so that no one will read about how you got to where you are in the game by accident. Someone on the forum will probably be able to tell you how to solve your problem or offer suggestions."

table of IF elements
title (text)	description (text)	used (number)	bookpage (number)	localpage (number)
"Space"	"Most IF games are set in a world made up of rooms without internal division. Movement between rooms is possible, but movement within a room does not always amount to anything. >WALK OVER TO THE DESK is rarely a useful sort of command. On the other hand, if something is described as being high or out of reach, it is sometimes relevant to stand on an object to increase your height. This kind of activity tends to be important only if prompted by the game text."
"Containment"	"One thing that IF does tend to model thoroughly is containment. Is something in or on something else? The game keeps track of this, and many puzzles have to do with where things are -- in the player's possession, lying on the floor of the room, on a table, in a box, etc."
"Types of Action"	"Most of the actions you can perform in the world of IF are brief and specific. >WALK WEST or >OPEN DOOR are likely to be provided. >TAKE A JOURNEY or >BUILD A TABLE are not. Things like >GO TO THE HOTEL are on the borderline: some games allow them, but most do not. In general, abstract, multi-stage behavior usually has to be broken down in order for the game to understand it. "
"Other Characters"	"Other characters in IF games are sometimes rather limited. On the other hand, there are also games in which character interaction is the main point of the game. You should be able to get a feel early on for the characters -- if they seem to respond to a lot of questions, remember what they're told, move around on their own, etc., then they may be fairly important. If they have a lot of stock responses and don't seem to have been the game designer's main concern, then they are most likely present either as local color or to provide the solution to a specific puzzle or set of puzzles. Characters in very puzzle-oriented games often have to be bribed, threatened, or cajoled into doing something that the player cannot do -- giving up a piece of information or an object, reaching something high, allowing the player into a restricted area, and so on."

table of setting options
title (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"The room description style is currently [if the current verbosity mode is verbose]VERBOSE[end if][if the current verbosity mode is brief]BRIEF[end if][if the current verbosity mode is superbrief]SUPERBRIEF[end if]"	switch description types rule
"Score notification is currently [if notify mode is on]ON[otherwise]OFF[end if]"	switch notification status rule

To decide whether notify mode is on:
	(- notify_mode -);

This is the switch notification status rule:
	if notify mode is on:
		try switching score notification off;
	otherwise:
		try switching score notification on;

This is the switch description types rule:
	if the current verbosity mode is verbose:
		try preferring sometimes abbreviated room descriptions;
		rule succeeds;
	if the current verbosity mode is brief:
		try preferring abbreviated room descriptions;
		rule succeeds;
	if the current verbosity mode is superbrief:
		try preferring unabbreviated room descriptions;
		rule succeeds;

Verbosity is a kind of value. The verbosities are brief, verbose, and superbrief.

To decide what verbosity is the current verbosity mode:
	let n be the current lookmode number;
	if n is 1, decide on brief;
	if n is 2, decide on verbose;
	if n is 3, decide on superbrief;
	
To decide what number is the current lookmode number:
	(- lookmode -);
	
Understand "help" or "hint" or "hints" or "about" or "info" as asking for help.
Asking for help is an action out of world.
Carry out asking for help (this is the help request rule):
	carry out the displaying activity;
	clear the screen;
	try looking;

Basic Help Menu ends here.

---- DOCUMENTATION ----

Chapter: Overview

The Basic Help Menu provides a HELP command (with synonyms HINT, HINTS, ABOUT and INFO) which will bring up a help menu system in your Glulx or Z-Code project for Inform version 6M62 or greater. The menus contain a set of introductory instructions on how to play interactive fiction.

An optional additional menu called 'the table of setting options' is included (and it's used in the example project) which adds controls for managing verbosity and score notification to the menus. This menu is not included by default because both these features are being used by fewer Inform projects these days.

Basic Help Menu is essentially an update of Emily Short's Basic Help Menu extension to make it compatible with my own new Menus extension. This extension's prose content is 99% identical to that in Emily's Basic Help Menu, so the author of the instructions which will appear in your game is really Emily Short. As Emily's Basic Help Menu is to Emily's classic Menus extension, my Basic Help Menu is to my new Menus extension.

This version 4 of Basic Help Menu depends upon the extension Menus (by Wade Clarke, version 5 at least) to function, and tries to include it in your game automatically. If you have not already done so, you will need to download Menus from Inform's Public Library and add it to your Inform extensions collection.

Version 4 of Basic Help Menu requires Inform 6M62 or greater.

Chapter: Usage

For any given game, you're likely to want to modify the menu content. This extension defines a table of help contents, the table of instruction options (which contains the help text) and the table of setting options (which lets the player turn score notification and verbosity on and off, but which is NOT included in the help system by default). You should certainly modify the introduction stub in the table of help contents, which otherwise just says 'Welcome to (your game)' when selected by a player. For the instructions on creating / editing help menus, please refer to the documentation of the Menus extension.

To add the verbosity and score notification functionality to your own project, add a submenu link in your menu system to the table of setting options.

* How to manage a modified version of this extension?

From Inform 6L02 onwards, you can save a copy of an extension you've modified for use with a particular project in that project's materials folder. Within 'materials', create an 'Extensions' folder, and inside that create a 'Wade Clarke' folder (extensions are filed by author name). If you put a copy of 'Basic Help Menu' into that Wade Clarke folder, you can hack it all you want to suit your project without affecting any other projects or the vanilla copy of the extension in your primary extensions colllection.

Example: * Basics - A very small game mostly consisting of help.

	*: "Basics"

	The Room of Bewilderment is a room. In the Room of Bewilderment is a panel of 57 brass buttons, a trap door, a lever marked DO NOT PULL, a brightly-gleaming sawblade, and a sheet of instructions in Mandarin.
	
	When play begins:
		say "You step into the Room of Bewilderment with the words of the host ringing in your ears: you can always ask for HELP.";
		choose row 1 in table of help contents;
		now description entry is "Basics is a very small game consisting almost entirely of its help content. Its purpose is to demonstrate the Basic Help Menu extension."
		
	
	Include Basic Help Menu by Wade Clarke. 

	table of help contents (continued)
	title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
	"Contacting the author"	--	"If you have any difficulties with [story title], please contact me at..."
	"Hints"	table of hints	--
	"Settings"		table of setting options	--

	table of hints
	title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
	"What do I do with the string?"	table of hinting	"Remember that you know how to macrame."
	"hint"	--	"Oh, come now, isn't it obvious?"

