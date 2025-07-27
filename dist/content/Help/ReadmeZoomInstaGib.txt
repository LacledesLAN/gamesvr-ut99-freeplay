Zoom InstaGib Arena Mutator (v1.0)
---------------------------------------------
Author: Mark Matzke & Matt Dunphy--abesapien@mindspring.com
---------------------------------------------

ABOUT: This mutator is heavily based on some of the other tutorials and mutators we've seen out there. A big thanks to the example set by the other mod/mutator authors and site maintainers at www.planetunreal.com, especially ca and JbP.

This mutator simply adds the zoom functionality to the Enhanced Shock Rifle. Thus, you get an arena with no powerups or ammo items lying around, and a gun with an infinite ammo supply that scores a one-shot kill and can zoom like the sniper rifle. What could be finer?

Mark has also done some tweaking on the shot placement of the bolt in zoom mode, to make it less offset and more accurate. It should work almost exactly like the sniper rifle (that's where he copied all the code from). However, he warns that it may not be 100% accurate to the crosshairs at all zoom levels. On the other hand, if you can't score a hit with this due to such a trivial problem, then you really suck and SHOULD learn how to aim.

There are essentially two parts to this--one being the arena mutator which takes care of eliminating all the other weapons/powerups/ammo, and the ZoomShockRifle object which inherits the functionality of the Super Shock Rifle and and copies the zoom of the Sniper Rifle. 

It is in the ZoomShockRifle object that the ammo count is reset to 100 after every firing, so if you want to use this object in your own mods with a finite amount of ammo, be sure you ferret that line out and dispose of it appropriately.

For this to work over a network, the UnrealTournament.ini file needs to have a line added under the [Engine.GameEngine] section thusly:

[Engine.GameEngine]

(...other entries...)

ServerPackages=ZoomShockRifle

...although installing this via the .UMOD should have edited your .ini file already.

As usual, don't use this for evil devious moneymaking purposes, give credit where credit is due, sit up, eat your vegetables and stop mumbling. We are not supporting this in any way shape or form, and have no idea if we'll be making any other mutators, although we have some ideas. You can send your comments and flames to abesapien@mindspring.com if you REALLY want to.

Have fun!

Mark and Matt