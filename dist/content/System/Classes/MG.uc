//=========================================================================================
// MoreGore Plus Mutator by Mr.Loathsome.  Based on MoreGore2 by shiftre from Clan 404
//=========================================================================================
class MG expands Mutator;

var int goreLevel;
var float SpawnRate, GibRate;
var bool bInitialized, bDoSpawn;

function PostBeginPlay()
{
	if (bInitialized) return; else bInitialized = true;
	bDoSpawn = True;
	Level.Game.RegisterDamageMutator(Self);
	goreLevel = class'MoreGore2ClientWindow'.Default.goreLevel;
	SpawnRate = class'MoreGore2ClientWindow'.Default.SpawnRate;
	GibRate = class'MoreGore2ClientWindow'.Default.GibRate;
	class'UnrealShare.Fly'.Default.CarcassType = class'Unreali.PupaeCarcass';
	Super.PostBeginPlay();
}

function Timer()
{
	bDoSpawn = True;
}

function ScoreKill(Pawn Killer, Pawn Other)
{
	local GibSpawn g;

	//check whether victim is at gib status
	if ((bDoSpawn) && (Other.Health < -40))
	{
		g = Spawn(class'GibSpawn', Other);
		if (g != None)
		{
			Other.Health = -100;
			if ((ScriptedPawn(Other) != None) && (ScriptedPawn(Other).CarcassType != None))
				{ g.SetLevel(goreLevel, Other.Location, Other.DrawScale, GibRate, ScriptedPawn(Other).CarcassType, True); }
			else {
			    if ((Bot(Other) != None) && (Bot(Other).CarcassType != None))
				{ g.SetLevel(goreLevel, Other.Location, Other.DrawScale, GibRate, Bot(Other).CarcassType, False); }
			    else
				{ g.SetLevel(goreLevel, Other.Location, Other.DrawScale, GibRate, class'UTHumanCarcass', False); }
			     }
			SetTimer(SpawnRate, False);
			bDoSpawn = False;
		}
	}
	Super.ScoreKill(Killer, Other);
}

defaultproperties
{
}
