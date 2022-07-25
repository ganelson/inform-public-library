Version 12 of Tailored Room Description by Emily Short begins here.

"An extension to go with Room Description Control, providing a different style of room description than the default. Parenthetical remarks such as (open) and (in which are...) are omitted in favor of full English sentences. Removes the requirement for Text Variations."

Include Room Description Control by Emily Short. 
 
Section 1 - Verbs

To sit is a verb. To hold is a verb. To contain is a verb.

Section 2 - Rankings

[These rankings give priority to items that have an interesting initial appearance and those that support or contain a large number of other items.]

A thing has some text called a flexible appearance. The flexible appearance of a thing is usually "blank".

Definition: a thing is flexibly-described if the flexible appearance of it is not "blank".

[A ranking rule for something (called special-target) which is in a room:
	increase the description-rank of the special-target by 1.]

A ranking rule for something (called special-target) which is not in the holder of the player:
	decrease the description-rank of the special-target by 2.

A ranking rule for a flexibly-described thing (called special-target): 
	increase description-rank of the special-target by 4.

Definition: a thing is initially-described if it is not handled and its initial appearance is not "".

A ranking rule for an initially-described thing (called special-target): 
	increase description-rank of the special-target by 5.
	
A ranking rule for something (called special-target):
	let N be the number of mentionable things enclosed by special-target; 
	increase the description-rank of the special-target by N.    


Section 3 - The current-paragraph

[The concept of the current-paragraph is that a marker keeps track of every item we mention within a given paragraph. This allows us to group together items that might otherwise not share the same priority rank -- for instance, if we say

A platter is on the table.

...then "platter" and "table" are marked as being referenced by this paragraph, and appropriate other sentences about these items will be added to the same paragraph. For instance: "The platter supports a tea kettle and a bottle of water. There is also a roast chicken on the table."]

current-paragraph is a thing. Referencing relates one thing to various things. The verb to reference (it references, he references, he referenced, it is referenced, it is referencing) implies the referencing relation.

Before printing the name of something (called special-target) while writing a paragraph about:
	now the current-paragraph references special-target. 

Before writing a paragraph about something:
	now current-paragraph does not reference anything;   

Section 4 - Writing Paragraph Rules
		
Rule for writing a paragraph about a deeply dull thing (called special-target) (this is the ordinary items rule):
	carry out the disclosing contents activity with the holder of the special-target;
	carry out the giving surrounding details activity with the special-target;
	now held-break is true;
	say "[run paragraph on]" (A); 

Definition: a thing is deeply dull if it lacks relative interest.

To decide whether (special-target - a thing) lacks relative interest:
	if the special-target is initially-described:
		no;
	if the special-target is flexibly-described:
		no; [make sure to account for all flexibly described things]
	let bias be lowest-rank plus 2;
	if the description-rank of special-target is greater than bias:
		decide no; [allow for the possibility that objects in a container may deserve to be listed together in a single sentence]
	let N be the holder of the special-target;
	if N is a container or N is a room:
		repeat with other-target running through mentionable things which are in N:
			if the description-rank of other-target is less than the description-rank of special-target:
				decide no;
	otherwise if N is a supporter:
		repeat with other-target running through mentionable things which are on N:
			if the description-rank of other-target is less than the description-rank of special-target:
				decide no; 
	decide yes.
	
Rule for writing a paragraph about something (called special-target) (this is the standard paragraphs rule):
	now the special-target is mentioned;  
	have the parser notice the special-target;
	carry out the writing a topic sentence about activity with the special-target;
	if the holder of the special-target is not the location and the holder of the special-target is not referenced by current-paragraph:
		carry out the disclosing exterior activity with the special-target; 
	carry out the giving surrounding details activity with the special-target;
	now held-break is true;
	say "[run paragraph on]" (A)

giving surrounding details for something is an activity on objects.

Rule for giving surrounding details for something (called the special-target) (this is the standard surroundings rule):
	while a surprising thing (called second special-target) is referenced by the current-paragraph:
		carry out the disclosing contents activity with the second special-target;
		now every thing contained by the second special-target is mentioned;
		now every thing supported by the second special-target is mentioned;
		now every thing held by the second special-target is mentioned;
		now every thing which is part of the second special-target is mentioned; 

Held-break is a truth state that varies. Held-break is false.

Last after writing a paragraph about something when held-break is true (this is the finish with a carriage return rule):
	now held-break is false;
	say "[paragraph break]" (A)

Writing a topic sentence about something is an activity.

Rule for writing a topic sentence about something (called the special-target) (this is the default topic sentence rule):  
	if the special-target is initially-described:
		say "[initial appearance of the special-target]" (A); 
		say " " (B);
	otherwise if the special-target is flexibly-described:
		say "[flexible appearance of the special-target]" (C);
		say " " (D);
	otherwise:
		now the current-subject is special-target;
		choose a random row in the current-topic-sentences-table; 
		say "[disclosure entry][run paragraph on]" (E);
	now the current-paragraph references the special-target.


current-subject is an object that varies.
current-exterior is an object that varies.
first-subject is an object that varies.
count-of-mentionable-contents is a number that varies.
count-of-mentioned-contents is a number that varies.
	
Definition: a thing is surprising if it is mentionable.
	  
Definition: a supporter is surprising if it supports a mentionable thing.

Definition: a container is surprising if it contains a mentionable thing.

Definition: a person is surprising:
	if it carries a mentionable thing, yes;
	if it wears a mentionable thing, yes.

Disclosing contents of something is an activity. Disclosing exterior of something is an activity.
 
Rule for disclosing exterior of something (called special-target) (this is the standard-exterior rule):
	now current-subject is special-target; [so that printing routines can refer to it]
	now first-subject is special-target;
	let nesting be false;
	while the holder of the current-subject is not a room:
		if nesting is false:
			choose a random row in the current-subject-introductions-table;
			say "[disclosure entry][run paragraph on]" (A);
		now current-exterior is the holder of current-subject;
		now count-of-mentionable-contents is the number of mentionable things held by the current-exterior;
		now count-of-mentioned-contents is the number of mentioned things held by the current-exterior;
		now nesting is false;
		let the chosen table be the current-NE-table; 
		if the holder of the current-subject is a person:
			let the chosen table be current-NC-table; 
		choose a random row in the chosen table;
		say "[disclosure entry][run paragraph on]" (B);
		if the count-of-mentionable-contents is greater than 0 and the current-exterior is in a room and the current-subject is the first-subject:
			choose a random row in the current-ao-table;
			say "[disclosure entry][run paragraph on]" (C); 
		otherwise if the current-exterior is not in a room:
			choose a random row in the current-connectives-table;
			say "[disclosure entry][run paragraph on]" (D);
			now nesting is true;
		otherwise:
			say ". " (E);
		now current-subject is the holder of current-subject; 
		

To say (N - a thing) as a possibly-known item:
	if N is mentioned, say "[the N]";
	otherwise say "[a N]".

To say in-on (N - a thing):
	if the current-subject is part of N:
		say "part of [the N]";
	otherwise if N is a container:
		say "in [the N]";
	otherwise:
		say "on [the N]".

To say in-on (N - a thing) as a possibly-known item:
	if the current-subject is part of N:
		say "part of ";
	otherwise if N is a container:
		say "in ";
	otherwise:
		say "on ";
	say N as a possibly-known item.

Rule for disclosing contents of a room (called special-target) (this is the disclosing-rooms rule): 
	now the current-subject is special-target;
	now count-of-mentionable-contents is the number of mentionable things held by the special-target;
	now count-of-mentioned-contents is the number of mentioned things held by the special-target;
	choose a random row in the current-room-content-table;
	say "[disclosure entry][run paragraph on]" (A). 
	 
Rule for disclosing contents of something (called special-target) (this is the disclosing-contents-of-holders rule): 
	now the current-subject is special-target;
	now count-of-mentionable-contents is the number of mentionable things held by the special-target;
	now count-of-mentioned-contents is the number of mentioned things held by the special-target;
	choose a random row in the relevant table;
	say "[disclosure entry][run paragraph on]" (A). 

To say optional also:
	if count-of-mentioned-contents is greater than zero, say "also ". 

Section 5 - Template Tables

To decide which table-name is the relevant table:
	if the current-subject is a supporter which supports a mentioned thing and the current-subject is not mentioned, decide on the current-prementioned-supporters-table;
	if the current-subject is a container which contains a mentioned thing and the current-subject is not mentioned, decide on the current-prementioned-containers-table;
	if the current-subject is a supporter, decide on the current-supporter-content-table;
	if the current-subject is a container, decide on the current-container-content-table;
	if the current-subject is a person, decide on the current-person-content-table.


The current-topic-sentences-table is a table-name that varies. The current-topic-sentences-table is the Table of Basic Sentences.

Table of Basic Sentences
disclosure
"[if the current-subject is a person][The current-subject] [are] here. [otherwise][We] [can] see [a current-subject] here. [end if]"

current-ao-table is a table-name that varies. The current-ao-table is the Table of Adjacent Objects.
current-connectives-table is a table-name that varies. The current-connectives-table is the Table of Connectives.
current-subject-introductions-table is a table-name that varies. The current-subject-introductions-table is the Table of Subject Introductions.
current-NC-table is a table-name that varies. The current-NC-table is the Table of Nesting Carriers.
current-NE-table is a table-name that varies. The current-NE-table is the Table of Nesting Exteriors.

Table of Adjacent Objects
disclosure
", alongside [a list of mentionable things held by the current-exterior]. "

Table of Connectives
disclosure
", [if the current-exterior is a person]who[otherwise]which[end if] [regarding current-subject][are] ".

Table of Subject Introductions
disclosure
"[if the current-subject is the first-subject][regarding current-subject][They][otherwise][The current-subject][end if] [sit] "

Table of Nesting Carriers
disclosure
"[if the current-subject is carried by someone]carried[otherwise]worn[end if] by [current-exterior as a possibly-known item]"

Table of Nesting Exteriors
disclosure
"[in-on the current-exterior as a possibly-known item][if the current-exterior holds the player] beside [us][end if]" 

current-room-content-table is a table-name that varies. current-room-content-table is the Table of Room Content Disclosures.

Table of Room Content Disclosures
disclosure 
"[We] [can] [optional also]see [a list of mentionable things in the current-subject] [if current-subject is the location]here[otherwise]in [the current-subject][end if]. ".

current-person-content-table is a table-name that varies. current-person-content-table is the Table of Person Content Disclosures.

Table of Person Content Disclosures
disclosure
"[holding-and-wearing][run paragraph on]"

To say holding-and-wearing:
	say "[if the prior named noun is the current-subject][regarding current-subject][They][otherwise][The current-subject][end if] ";
	if the current-subject carries something mentionable and the current-subject wears something mentionable
	begin;
		if the number of mentionable things held by the current-subject is greater than 5
		begin;
			say "[regarding current-subject][have] [a list of things carried by the current-subject]. [Cap it-they of current-subject] [wear] [a list of things worn by the current-subject]. [run paragraph on]";
		otherwise;
			say "[regarding current-subject][are] carrying [a list of things carried by the current-subject] and wearing [a list of things worn by the current-subject]. [run paragraph on]";
		end if;
	otherwise if the current-subject carries something mentionable;
		if a random chance of 1 in 2 succeeds, say "[regarding current-subject][are] [optional also][one of]holding[or]carrying[at random] ";
		otherwise say "[regarding current-subject][have][run paragraph on] ";
		say "[a list of mentionable things carried by the current-subject]. [run paragraph on]";
	otherwise if the current-subject wears something mentionable;
		say "[regarding current-subject][are] wearing [a list of mentionable things worn by the current-subject]. [run paragraph on]";
	end if.

current-container-content-table is a table-name that varies. current-container-content-table is the Table of Container Content Disclosures.

Table of Container Content Disclosures
disclosure
"[The current-subject] [optional also][contain] [a list of mentionable things in the current-subject]. "
"In [the current-subject] [regarding mentionable things in the current-subject][are] [a list of mentionable things in the current-subject]. "
"[regarding mentionable things in the current-subject]There [are] [optional also][a list of mentionable things in the current-subject] in [the current-subject]. "


current-supporter-content-table is a table-name that varies. current-supporter-content-table is the Table of Supporter Content Disclosures.

Table of Supporter Content Disclosures
disclosure 
"On [the current-subject] [regarding mentionable things on the current-subject][are] [a list of mentionable things on the current-subject]. "
"[regarding mentionable things in the current-subject]There [are] [optional also][a list of mentionable things on the current-subject] on [the current-subject]. "


current-prementioned-supporters-table is a table-name that varies.  current-prementioned-supporters-table is the Table of Prementioned Supporters.

Table of Prementioned Supporters
disclosure
"[The list of mentioned things which are on the current-subject] [are] on [a current-subject][if current-subject supports something mentionable], which also [hold] [a list of mentionable things on the current-subject][end if]. "  


current-prementioned-containers-table is a table-name that varies.  current-prementioned-containers-table is the Table of Prementioned Containers.

Table of Prementioned Containers
disclosure
"[The list of mentioned things which are in the current-subject] [are] in [a current-subject][if current-subject contains something mentionable], which also [hold] [a list of mentionable things in the current-subject][end if]. " 

Section 6 - Excluding concealed items

Rule for deciding whether all includes something (called special-target) while taking (this is the excluding concealed items rule): 
	now special-target is marked for listing;
	follow the mentioning tedious things rule;
	follow the determining concealment rule;
	if the special-target is not marked for listing, it does not;
	make no decision.

Tailored Room Description ends here.

---- Documentation ----

Tailored Room Description is an extension for use with Emily Short's Room Description Control. Tailored Room Descriptions provides a set of rules for writing paragraphs about objects.

Chapter: Using Tailored Room Description

Section: Overview of Tailored Room Description's Process

The behavior of Tailored Room Description is to go through the list of Seen Things prepared by Room Description Control and follow this protocol:

	(a) if the item in question has an initial appearance and has not been moved, print the initial appearance; otherwise, if it has a flexible appearance (see below), print the flexible appearance; otherwise, say that you see the item.

	(b) if the item is on or in something other than the location, mention the holder of the item and any other objects also in the holder of the item.

	(c) if the paragraph so generated has mentioned any containers or supporters that themselves hold unmentioned items, generate sentences mentioning the contents of those things, until everything referenced by the paragraph has been adequately revealed.

	(d) as an exceptional case, if the item is considered "deeply dull", a sentence will instead be printed listing the item together with all other "deeply dull" objects in a single sentence, as in "You also see here the wrench, the monkey, and the weasel." Items are only deeply dull if they share in having the lowest possible description-rank; according to the ranking rules of this extension, that means that they neither contain nor support anything, have no initial appearance, and have not been rendered interesting by any other ranking rule. It is possible to add further definitions to affect whether specific kinds of things are considered deeply dull; see the "Doors and doors" example below.

Section: Initial appearance, flexible appearance

Initial appearance is a description of something that is printed when the player looks and the object has not been moved. Tailored Room Description adds a "flexible appearance", which will be printed even if the object in question has been moved. So we might say

	The initial appearance of the cup is "Someone has casually tossed away a paper cup here."

so that after being moved it will simply be described in the collection of random objects; but
	
	The flexible appearance of the tripod is "A tripod is set up [if the location is indoors]on the floor[otherwise]on the ground[end if]."

so that the tripod will always have its own treatment, even if moved from room to room. If an item has both an initial appearance and a flexible appearance, the initial appearance will be consulted until the item is moved, and the flexible appearance afterward.

Section: Overriding the default for specific objects

The entire protocol can be overwritten by providing a more particular rule for writing a paragraph about for specific items; so for instance
	
	Rule for writing a paragraph about a person (called dude):
		say "[The dude] is standing way too close to you."

would print this sentence and omit all other results.

The printing of an item's holder is managed by the disclosing exterior activity. We can change the way this is handled by writing a new rule for disclosing exterior of something. For instance:
	
	Rule for disclosing exterior of tripod:
		say "[The tripod] is perched awkwardly on [the holder of the tripod]. "

Rules for disclosing exterior should ideally end with a period and a single space, in case the paragraph needs to continue thereafter.

The printing of an item's contents is managed by the disclosing contents activity. We can change the way this is handled by writing a new rule for disclosing contents of something. For instance:

	Rule for disclosing contents of the vase when at least two things are in the vase:
		say "[The list of things which are in the vase] are crammed together into [if the vase is mentioned][the vase][otherwise][a vase][end if]. "

Again, this rule should produce output ending in a period and space, allowing for further sentences to follow without pause.

Tailored Room Descriptions also excludes from TAKE ALL any items currently being concealed by our concealment rules. 

Chapter: Extra and Related Features

Section: Ordering the descriptions and excluding items

Users of Tailored Room Description sometimes ask how they can prevent something entirely from appearing in a room description. The answer is that this functionality -- choosing items that should not appear in the room description at all -- can be manipulated using TRD's base extension, Room Description Control. That extension's documentation explains how to write ranking rules and description-concealing rules for a variety of situations.

Section: Change Log

Version 3 of Tailored Room Descriptions builds on previous versions by adding description for things carried or held by non-player characters and better handling for enterable containers.

Version 7 of Tailored Room descriptions moves to a new way of managing internal text: rules to construct paragraphs, instead of constructing sentences out of small snippets of text intermingled with code, refer to tables such as

	Table of Prementioned Containers
	disclosure
	"[The list of mentioned things which are in the current-subject] [mentioned-are] in [a current-subject][if current-subject contains something mentionable], which also hold[s] [a list of mentionable things in the current-subject][end if]." 

The disclosure entry here is a template used by the extension to create a viable sentence. One of these lines is selected at random from the table to use in each situation, which means that if we would like to diversify the range of sentence options, we can simply continue the table in our own code, as in

	Table of Prementioned Containers (continued)
	disclosure
	"[The list of mentioned things which are in the current-subject] [mentioned-are] in [a current-subject], together with [a list of mentionable things in the current-subject][end if]." 

We may also swap these tables entirely for other tables of our own devising, as in

	When play begins:
		now the current-supporter-content-table is the Table of New Supporter Content.

The purpose of this change is to make the extension more flexible and more useful to authors working with alternative viewpoints (to recast the prose in first-person past tense, for instance) or in other languages. It also substantially reduces the number of individual rules and quantity of redundant code in the extension.

Version 8 tweaks the reporting of character possessions and worn items to appear more natural. It also adds section headings to the documentation.

Example: * Doors and doors - Writing paragraphs about doors to generate sentences such as "Exits include the white door and the black door. The black door is open."

	*: "Doors and doors"

	Include Tailored Room Description by Emily Short. 

	The Jurassic Room is a room. The white door is a door. It is north of Jurassic and south of Cretaceous.

	The black door is a door. It is south of the Jurassic and north of the Triassic.

	The purple door and the grey door are doors. The purple door is south of the Triassic and north of the Museum Forecourt. The grey door is southwest of the Triassic and northeast of the Parking Lot.

	Definition: a door is deeply dull: no.
	
	Rule for writing a paragraph about a door:
		let N be the number of mentionable doors;
		let O be the number of mentionable open doors;
		say "[if N is 1]The only door out is[otherwise]Exits include[end if] [the list of mentionable doors]. ";
		if N is O
		begin;
			say "[all O of them are]open.";
		otherwise if O is greater than 0; 
			say "[The list of open doors referenced by the current-paragraph] [if O is 1]is[otherwise]are[end if] open.";
		otherwise; 
			say "[all N of them are]closed.";
		end if.
	
	To say all (N - a number) of them are:
		if N is 0
		begin;
			say "None are ";
		otherwise if N is 1;
			say "[one of]It's [or]It is [purely at random]";
		otherwise if N is 2;
			say "[one of]Both of them are [or]Both are [or]They are both [or]They're both [purely at random]";
		otherwise;
			say "[one of]They are all [or]They're all [or]Every one of them is [or]All [N in words] are [purely at random]";
		end if.
	
	Test me with "open white door / look / open black door / look / n / close door / look / open door / s / s / open grey door / look / open purple door / look".
	
As a note, the extension Automated Text Generation provides a much larger selection of behavior similar to "say all () of them are", providing additional ways to refer to groups of objects.

Example: * Boatman - A sample involving modified descriptions for items in an enterable container with the player.

	*: "Boatman"
	
	Include Tailored Room Description by Emily Short. 
	
	To lean is a verb. To scramble is a verb. To see is a verb.
	
	The Salt Lake is a room. 
	
	The rowboat is an enterable container in the Salt Lake. Understand "boat" as the rowboat. It contains a boatman, a pole, and bottle of fresh water. The boatman is a man.
	
	The Salt Lake contains a single flipper. 
	
	A ranking rule for the boatman: increase the description-rank of the boatman by 10.
	 	
	Rule for writing a paragraph about the boatman when the boatman is in the rowboat:
		if entering the rowboat, say "[The boatman] [lean] to one side to provide balance as [we] [scramble] in. [paragraph break]";
		otherwise say "[The boatman] [sit] in [the rowboat], looking grim. [paragraph break]"
	
	Rule for writing a paragraph about something while entering a container (called special-target):
		say "In [the special-target] with [us], [we] [see] [the list of mentionable things in the special-target]."
	
	Rule for writing a paragraph about a deeply dull thing which is in the rowboat when the player is in the rowboat:
		say "In the bottom of the boat, [we] [see] [a list of deeply dull mentionable things which are in the rowboat]. [paragraph break]".
	
	Rule for writing a paragraph about a deeply dull thing which is in the Salt Lake:
		say "Floating on the impossibly buoyant water: [a list of deeply dull mentionable things which are in the Salt Lake]. [paragraph break]".
	
	Test me with "get flipper / put flipper in rowboat / look / enter rowboat / get pole / look / get water / look / out / look / drop all / look / get in boat / look".

Example: ** Introductions - A system whereby both things and rooms can be given an "introduction", a tag line of text that is added the first time the player sees them in the room description if they are the main topic of a paragraph, or as an addendum to the object's description the first time it's examined. Introduction text can also be reviewed by the player with a THINK ABOUT command.

	*: "Introductions"

	Include Tailored Room Description by Emily Short.
	
	Section 1 - The Rules
	
	A thing has some text called the introduction. The introduction of a thing is usually "".
	A room has some text called the introduction. The introduction of a room is usually "".
	
	Rule for writing a paragraph about an as-yet-unknown introduceable thing (called special-target):
		carry out the writing a topic sentence about activity with the special-target;
		introduce the special-target;
		say paragraph break.
		
	After examining an as-yet-unknown introduceable thing (called special-target):
		introduce the special-target;
		say paragraph break.
	
	To introduce (special-target - an object):
		now the special-target is introduced;
		say "[introduction of the special-target]".
	
	Definition: a thing is introduceable if the introduction of it is not "".
	Definition: a room is introduceable if the introduction of it is not "".
	
	A thing can be as-yet-unknown or introduced. A thing is usually as-yet-unknown.
	A room can be as-yet-unknown or introduced. A room is usually as-yet-unknown.
	
	The first time looking rule is listed after new object description rule in the carry out looking rules.
	
	This is the first time looking rule: 
		if location is introduceable and the location is as-yet-unknown
		begin;
			introduce the location;
			say paragraph break;
		end if.
	
	A description-concealing rule:
		now every thing which is held by an as-yet-unknown introduceable person is not marked for listing. 
	
	Understand "think about [any introduceable introduced thing]" or "remember [any introduceable introduced thing]" as thinking about. Understand the commands "recall" or "consider" or "recollect" or "ponder" or "contemplate" as "remember".
	
	Thinking about is an action applying to one visible thing.
	
	Carry out thinking about: 
		introduce the noun;
		say paragraph break.
	
	Section 2 - The Scenario
	
	The Maremma Breeding Ground is a room. 
	
	Logar is an animal in Maremma Breeding Ground. "Logar stands here, waiting for instructions." 
		The description is "A nine-month puppy, Logar is nonetheless a pretty sizable dog already."
		The introduction is "He's your latest acquisition in a large collection of work dogs."
	
	Logar carries a bone.
		The description of the bone is "Pretty well chewed already."
		The introduction of the bone is "That bone came out of a leg of lamb, but there's not much left on it."
	
	Test me with "z / look / x logar / think about logar / x bone".
	
The Introductions extension provides a more complete implementation of this idea for people who would like to use it extensively in their work.

Example: ** Gobs of Mayonnaise - A scenario with various objects competing for our attention.

	*: "Gobs of Mayonnaise"

	Include Tailored Room Description by Emily Short.  

	The Farmhouse Kitchen is a room. "This place bears testament to its owners[apostrophe] patriotism, or possibly their devotion to Women's Day magazine. Pseudo-colonial decor abounds, including a multitude of tiny 13-star flags painted just under the ceiling. A heavy pedestal is located immediately opposite the door." The tiny 13-star flags are scenery in the Farmhouse Kitchen. "Stencilled all around the ceiling."

	The chair is an enterable supporter in the Farmhouse Kitchen. It is pushable between rooms. 
	
	[And speaking of the possibility that there are people around:]

	Jones is a man on the chair. The chair is portable. Persuasion rule: persuasion succeeds. [For the sake of this example, we'll make Jones an obedient type.]

	[Now, supposing we want people (all else being equal) to get prominent mention:]

	A ranking rule for a person (called special-target): 
		increase the description-rank of the special-target by 10.

	[But not as prominent as any treasures or special articles:]

	A treasure is a kind of thing. A ranking rule for a treasure (called special-target): increase the description-rank of the special-target by 75.

	The pedestal is a supporter in Farmhouse Kitchen. It is scenery. On the pedestal is a bust of Washington. The bust is a treasure. The flexible appearance of the bust is "A bust of Washington glares proudly over the room[if the holder of the bust is not a room] from [the holder of the bust][otherwise]... from about knee height[end if]. " 

	The table is in the Farmhouse Kitchen. "A rough-hewn table uses up an entire corner of the room." 

	[Grouping items together is permitted:]

	A utensil is a kind of thing. A knife is a utensil. A fork is a utensil. The knife and the fork are on the table.

	Before listing contents: group utensils together. Before grouping together utensils: say "a place setting (consisting of ". After grouping together utensils: say ")". 

	[We might also want to override the way contents of items are described in particular cases:]

	On the table is a vase. In the vase is a flower.  

	Rule for disclosing contents of the vase when at least two things are in the vase:
		if something in the vase is mentioned, say "Besides [the list of mentioned things in the vase] you can see in the vase [a list of mentionable things in the vase]. ";
		otherwise say "[The list of things which are in the vase] are crammed together into [if the vase is mentioned][the vase][otherwise][a vase][end if]. "

	On the table is a glass. In the glass is a treasure called a diamond. The flexible appearance of the diamond is "A sparkling, winking diamond commands your attention!"

	[But let's say that when the diamond is in the glass, we don't notice it -- it's just so much more transparent stuff.]

	A description-concealing rule:
		if the diamond is in the glass, now the diamond is not marked for listing. 
	
	The Closet is west of the Farmhouse Kitchen. The Closet contains a plastic box. The plastic box is closed and openable and transparent. In it are a rubber chicken and a light bulb.

	[Since our current scheme doesn't print things like (open) or (closed), we'll provide our own substitute for the plastic box:]

	Before printing the name of an openable container (called special-target) while writing a paragraph about something:
		if special-target is open, say "open "; otherwise say "closed ".

	The high shelf is a thing in the Closet. On the high shelf is a jug of mayonnaise.  The flexible appearance of the jug is "The thing that draws your eye right off is an utterly enormous jug of mayonnaise."

	[Now, supposing we don't want anything on the shelf to be visible when the player isn't on the chair:]

	A description-concealing rule when the player is not on the chair:
		now every thing enclosed by the high shelf is not marked for listing. 

	[But we do want the jug to stand out when we're in sight of it:]

	A ranking rule for the jug: 
		increase  description-rank of the jug by 100.    

	Test me with "search glass / get diamond / drop diamond / look / put diamond on pedestal / look / get bust / look / drop bust / jones, take knife / look / jones, get up / look / get all / drop all / w / e / get chair / w / drop chair / stand on chair".
		