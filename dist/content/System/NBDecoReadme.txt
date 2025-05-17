  ==================================
===     NBDeco mod' for Unreal     ===
=== by Beppo (Norbert Bogenrieder) ===
  ==================================

e-mail:		nb_beppo@gmx.net or beppo@planetunreal.com

homepage:	www.planetunreal.com/beppo

-----------
build date:	12-11-99
version   :     1.00
-----------

----------------
updates & infos:
----------------
-------------
version 1.00:
-------------
short description:
NBDecoration is a Decoration class that can be destroyed and that respawns after an amount of time!

----------
used Vars:
----------
NBDecoration:
.Damage			= Damage that this Object can cause if destroyed (<=0 = None)
.DamageRadius		= should explain by itself
.FragChunks		= number of FragChunks to be spawned if destroyed
.FragClass		= Fragmentation Class (Projectile) to be used
.FragSize		= size of the Chunks
.Health			= who much can it take before blowing up
.ReSpawnEffect		= choose an Effect to spawn if Respawns
.TimeToSleep		= how long does the object stay hidden after beeing 'destroyed'
			  if <= 0.0 the object will not respawn!!

Decoration:
.bPushable		= can someone push the Deco
.content(s,2,3)		= one of them will be spawned if destroyed
.EffectWhenDestroyed	= spawn this effect if destroyed (ie. Explosion)
.(End)PushSound		= if pushable use this sounds

Display:
.Mesh			= choose the Mesh (how should it look like)
.Skin			= skin to use for the FragChunks

Collision:
.CollisionHeight	= use the original CollisionHeight of the used Mesh
.CollisionRadius	= same as above

-------------

If you encounter any problems, are in need of additional information
or have some cool ideas what I could include inside the next version...
feel free to send an e-mail to:

nb_beppo@gmx.net or beppo@planetunreal.com

see ya,

Beppo

Have fun and enjoy !! :)

================================================================
Copyright / Permissions
-----------------------
Authors may USE this mod inside theirs levels, but NOT without
appropriate credits applied. :)

You are NOT allowed to commercially exploit this mod, i.e. put it on a
CD or any other electronic medium that is sold for money without my
explicit permission!

You MAY distribute this mod through any electronic network (internet,
FIDO, local BBS etc.), provided you include this file and leave the
archive intact.

================================================================
----------------------
UNREAL (c)1998 Epic Megagames, Inc.  All Rights Reserved.  Distributed
by GT Interactive Software, Inc. under license.  UNREAL and the UNREAL
logo are registered trademarks of Epic Megagames, Inc. All other
trademarks and trade names are properties of their respective owners.
----------------------
