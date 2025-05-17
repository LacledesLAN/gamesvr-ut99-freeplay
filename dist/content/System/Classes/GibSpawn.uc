class GibSpawn extends actor;

var int Ngibs;
var float GRate, DScale;
var bool bDoSpawn, bSp;
var vector cloc;
var class<carcass> pClass;

function SetLevel(int GLev, vector L, float DS, float GR, class<carcass> pC, bool bScrpawn)
{
	Ngibs = GLev;
	cloc = L;
	DScale = DS * 1.5000;
	GRate = GR;
	pClass = pC;
	bSp = bScrpawn;
	SetTimer(GRate, False);
	bDoSpawn = True;
}

function Timer()
{
	bDoSpawn = True;
}

function tick(float dt)
{
	local carcass chunky;

	if (bDoSpawn)
	{
		if ((chunky == None) && (pClass != class'UTHumanCarcass'))
		{
			chunky = Spawn(pClass,,,cloc);
		}
		if (chunky != None)
		{
			chunky.DrawScale = DScale;
			DScale -= (DScale * 0.10);
			if ((bSp) || (pClass == class'UTHumanCarcass')) chunky.Initfor(chunky);
			chunky.GotoState('Gibbing');
			chunky.ChunkUp(Ngibs * 100);
		}
		Ngibs--;
		if (Ngibs <= 0)
		{
			if (chunky != None) chunky.Destroy();
			Destroy();
		}
		SetTimer(GRate, False);
		bDoSpawn = False;		
	}
}

defaultproperties
{
     bHidden=True
}
