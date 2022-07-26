Version 2.2 of Postures by Emily Short begins here.

"Postures defines three postures -- seated, standing, and reclining -- and allows pieces of furniture to specify which postures are possible and preferred when the player is on those furnishings."

Chapter - Miscellaneous Definitions

Use posture visibility checks translates as (- Constant POSTURE_VISIBILITY_CHECKS; -).

Section 1 - The Concenpt

A posture is a kind of value. The postures are seated, standing, and reclining.

A person has a posture. The posture of a person is usually standing.

Section 2 - Posture Permission

A supporter has a posture. A container has a posture.

Posture-permission relates various things to various postures. The verb to allow (it allows, they allow, it allowed, it is allowed) implies the posture-permission relation.

Section 3 - Rooms and Postures

A room can be posture-friendly or posture-unfriendly. A room is usually posture-friendly.

Section 4 - Sitting, Lying, and Standing On Commands

Understand the commands "stand" and "sit" and "lie" as something new.

Understand "sit on/in [something]" as sitting on.
Understand "sit down on/in [something]" as sitting on.
Understand "lie on/in [something]" as lying on.
Understand "lie down on/in [something]" as lying on.
Understand "stand on/in [something]" as standing up on.

Sitting on is an action applying to one thing.
Lying on is an action applying to one thing.
Standing up on is an action applying to one thing.

Carry out an actor sitting on (this is the standard carry out sitting on rule):
	if the holder of the actor is the noun:
		if the actor is seated:
			unless the posture visibility checks option is active and the actor is not visible:
				say "[The actor] [are] already sitting on [the noun].";
		otherwise:
			try the actor taking position seated;
	otherwise:
		if the noun allows seated:
			silently try the actor entering the noun;
			if the holder of the actor is the noun:
				if the actor is not seated:
					try the actor taking position seated;
				otherwise:
					follow the report taking position rules;
		otherwise:
			unless the posture visibility checks option is active and the actor is not visible:
				say "[The actor] [can't] sit on [the noun].";

Carry out an actor lying on (this is the standard carry out lying on rule):
	if the holder of the actor is the noun:
		if the actor is reclining:
			unless the posture visibility checks option is active and the actor is not visible:
				say "[The actor] [are] already reclining on [the noun].";
		otherwise:
			try the actor taking position reclining;
	otherwise:
		if the noun allows reclining:
			silently try the actor	entering the noun;
			if the holder of the actor is the noun:
				if the actor is not reclining:
					try the actor taking position reclining;
				otherwise:
					follow the report taking position rules;
		otherwise:
			unless the posture visibility checks option is active and the actor is not visible:
				say "[The actor] [can't] lie on [the noun].";

Carry out an actor standing up on (this is the standard carry out standing up on rule):
	if the holder of the actor is the noun:
		if the actor is standing:
			unless the posture visibility checks option is active and the actor is not visible:
				say "[The actor] [are] already standing on [the noun].";
		otherwise:
			try the actor taking position standing;
	otherwise:
		if the noun allows standing:
			silently try the actor entering the noun;
			if the holder of the actor is the noun:
				if the actor is not standing:
					try the actor taking position standing;
				otherwise:
					follow the report taking position rules;
		otherwise:
			unless the posture visibility checks option is active and the actor is not visible:
				say "[The actor] [can't] stand on [the noun].";

Section 5 - Sitting, Lying, and Standing with Default Objects

Understand "lie down" or "lie" as lying down.
Understand "sit down" or "sit" or "sit up" as sitting down.
Understand "stand" or "stand up" as standing up.

Lying down is an action applying to nothing.
Sitting down is an action applying to nothing.
Standing up is an action applying to nothing.

To decide whether (N - a person) can lie here:
	if the holder of N is a thing and the holder of N allows reclining:
		yes;
	if the location of N is posture-friendly:
		yes;
	no.

Instead of an actor lying down (this is the convert lying down rule):
	if the holder of the actor contains something (called target) which allows reclining:
		if the holder of the actor contains an enterable reclining thing (called the better target):
			now the target is the better target;
		try the actor lying on the target;
		if the posture of the actor is reclining and the actor is on the target:
			rule succeeds;
		rule fails;
	if the actor can lie here:
		try the actor taking position reclining;
		if the posture of the actor is reclining:
			rule succeeds;
	otherwise:
		unless the posture visibility checks option is active and the actor is not visible:
			if the holder of the actor is a thing:
				say "[The actor] [can't] lie down on [the holder of the actor].";
			otherwise:
				say "There [are] nothing [here] to lie on.";
		rule succeeds.

To decide whether (N - a person) can sit here:
	if the holder of N is a thing and the holder of N allows seated:
		yes;
	if the location of N is posture-friendly:
		yes;
	no.

Instead of an actor sitting down (this is the convert sitting down rule):
	if the holder of the actor contains something enterable (called target) which allows seated:
		if the holder of the actor contains an enterable seated thing (called the better target):
			now the target is the better target;
		try the actor sitting on the target;
		if the posture of the actor is seated and the actor is on the target:
			rule succeeds;
		rule fails;
	if the actor can sit here:
		try the actor taking position seated;
		if the posture of the actor is seated:
			rule succeeds;
	otherwise:
		unless the posture visibility checks option is active and the actor is not visible:
			if the holder of the actor is a thing:
				say "[The actor] [can't] sit down on [the holder of the actor].";
			otherwise:
				say "There [are] nothing [here] to sit on.";
		rule succeeds.

Instead of an actor standing up (this is the convert standing up rule):
	let the source be the holder of the actor;
	if the source is not the location:
		if the posture of the actor is standing:
			unless the posture visibility checks option is active and the actor is not visible:
				say "[The actor] [are] already standing.";
			the rule succeeds;
		otherwise:
			try the actor exiting;
			if the holder of the actor is the source:
				rule fails;
		rule succeeds;
	otherwise:
		try the actor taking position standing;
		if the posture of the actor is standing:
			rule succeeds;
		rule fails;

Section 6 - Disambiguating Postures

Does the player mean sitting on something when the noun is enterable and the posture of the noun is seated (this is the prefer sitting on seating objects rule):
	it is very likely.

Does the player mean standing up on something when the noun is enterable and the posture of the noun is standing (this is the prefer standing on standing objects rule):
	it is very likely.

Does the player mean lying on something when the noun is enterable and the posture of the noun is reclining (this is the prefer lying on reclining objects rule):
	it is very likely.

Does the player mean asking someone to try sitting on something when the noun is enterable and the posture of the noun is seated (this is the prefer request sitting on seating objects rule):
	it is very likely.

Does the player mean asking someone to try standing up on something when the noun is enterable and the posture of the noun is standing (this is the prefer request standing on standing objects rule):
	it is very likely.

Does the player mean asking someone to try lying on something when the the noun is enterable and posture of the noun is reclining (this is the prefer request lying on reclining objects rule):
	it is very likely.

Section 7 - Taking Position Action

[Despite the range of action names involved, all posture actions are really the same: we're setting the posture value, using the taking position action. Other related actions redirect to this one.]

Taking position is an action applying to one posture.

Check an actor taking position (this is the can't use inappropriate postures rule):
	if the holder of the actor is not a room and the holder of the actor does not allow the posture understood:
		unless the posture visibility checks option is active and the actor is not visible:
			say "[The actor] [can't] take that position [in-on the holder of the actor].";
		stop the action.

Check an actor taking position (this is the can't use already used posture rule):
	if the posture understood is the posture of the actor:
		unless the posture visibility checks option is active and the actor is not visible:
			say "[The actor] [are] already [the posture understood].";
		stop the action.

Carry out an actor taking position (this is the standard taking position rule):
	now the posture of the actor is the posture understood.

Report an actor taking position (this is the standard position report rule):
	unless the posture visibility checks option is active and the actor is not visible:
		say "[The actor] [are] now [the posture of the actor][if the holder of the actor is not the location of the actor] [in-on the holder of the actor][end if]."

To say in-on (item - a thing):
	if the item is a container, say "in [the item]";
	otherwise say "on [the item]".

Section 8 - Posture Changes Automatically When Moving

Carry out an actor exiting (this is the departure-posture rule):
	let N be the holder of the actor;
	if N is a container or N is a supporter,
		now the posture of the actor is the posture of N;
	otherwise now the posture of the actor is standing.

The departure-posture rule is listed after the standard exiting rule in the carry out exiting rulebook.
The departure-posture rule is listed after the standard getting off rule in the carry out getting off rulebook.

Carry out an actor entering something (this is the arrival-posture rule):
	if the noun is a container or the noun is a supporter,
		now the posture of the actor is the posture of the noun.

The arrival-posture rule is listed after the standard entering rule in the carry out entering rulebook.

Check an actor going somewhere (this is the can't go without standing rule):
	if the actor is in a room and the actor is not standing:
		unless the posture visibility checks option is active and the actor is not visible:
			say "([if the actor is not the player][the actor] [end if]first standing up)[command clarification break]";
		silently try the actor taking position standing;
		if the actor is not standing, stop the action.

Section 9 - Convert Exits when sitting or lying in a room

Check an actor exiting when the holder of the actor is a room and the actor is not standing (this is the convert exits to standing rule):
	try the actor taking position standing instead.

Postures ends here.

---- Documentation ----

Postures defines three postures -- seated, standing, and reclining -- and allows pieces of furniture to specify which postures are possible and preferred when the player is on those furnishings.

Chapter: Postures and Furniture

Section: Possible Postures

Each piece of furniture comes with a range of possible postures, which can be expressed with the posture-permission relation: as in

	The bunk bed allows seated and reclining.

This definition would say that we're allowed to sit or lie down on the bunk bed, but not to stand up on it. Player attempts to

	>STAND ON BUNK BED

will be rejected with

	You can't take that position on the bunk bed.

Section: Preferred Postures

In addition to permitted postures, furniture can have a "preferred" posture: it's possible to stand on a chair, but we're more likely to sit on it. Preferred postures are used to guess what the player means if he types

	>GET ON BUNK BED

without naming a posture.

Section: Entering and Leaving Furniture

If an actor attempts to leave an enterable object, his posture is automatically returned to "standing"; if he enters something without setting a posture explicitly, as in

	>GET ON SOFA

the actor's posture will automatically be set to the default posture for that piece of furniture (sitting, in this case).

Section: Defining New Furniture

To make use of the features of Postures, we may define pieces of furniture like so:

	A chair is a kind of supporter. A chair is always enterable. Every chair allows seated and standing. A chair is usually seated.

Section: Rooms and Postures

Rooms cannot enter into the posture-allowing relation. However, rooms can be set as "posture-friendly" (you can lie or sit down on the ground in those rooms) and "posture-unfriendly" (no lying down or sitting allowed). By default, they are posture-friendly.

This feature determines whether a player can take postures other than standing while in a room (that is, not on a piece of furniture). Suppose the player types

	>LIE DOWN

without naming where he wants to lie down. The game will first look for an available piece of furniture that allows reclining (ideally one whose preferred posture is reclining) and try to lie on that, but if it finds none and the room is posture-friendly, the player will lie down on the floor. If the room is posture-unfriendly and there is no suitable piece of furniture, the game will be rejected with

	There's nothing to lie on.

Section: The Posture Visibility Checks option

Before printing an error message for an NPC, such as "Clark is already sitting" when Clark is trying to sit, this extension can first check whether the player can actually see Clark. If he is in another room or in a closed opaque container, no message will be printed. As visibility checks in Inform can sometimes be slow, this feature is off by default, but can be turned on with the line

	Use posture visibility checks.

Note that this only applies to the new messages introduced by this extension. Some error messages in the Inform Standard Rules will print even if the NPC they mention is not visibile to the player.

See this discussion about other glitches that may occur when NPC actions fail, and some ideas on what to do about it: https://intfiction.org/t/postures-by-emily-short/6748/6

Section: Change Log

Version 2/180528 fixes a run-time error that could occur when typing LIE. It also always looks for a reasonable piece of furniture to sit or lie down on in a room rather than defaulting to the floor when typing just SIT or LIE, even if the room is posture-friendly. It also introduces the posture visibility checks option

Example: * Muddy Lawn - A room where the player can't sit on the ground, plus a folding chair, a safer-to-sit-on driveway, and the ubiquitous guinea-pig Clark.

	*: "Muddy Lawn"

	Include Postures by Emily Short.

	Use posture visibility checks.

	A chair is a kind of supporter. A chair is always enterable. Every chair allows seated and standing. A chair is usually seated.

	The Muddy Lawn is a posture-unfriendly room. West of the Muddy Lawn is the Driveway.

	Clark is a man in the Muddy Lawn. A persuasion rule: persuasion succeeds.

	The Muddy Lawn contains a folding chair. The description of the folding chair is "Made of metal and plastic, and intended for outdoor use." The folding chair is a chair. The folding chair is portable.

	Test me with "lie on chair / sit on chair / stand on chair / stand up / exit / sit down / look / stand up / lie down / sit on chair / west / east / Clark, sit on chair / Clark, stand / Clark, sit down / Clark, stand / Clark, lie down / Clark, stand / Clark, lie on chair / Clark, stand on chair / Clark, west / west / Clark, sit / sit / Clark, east / east / get chair / west / drop chair / sit down / get up / sit on chair".
