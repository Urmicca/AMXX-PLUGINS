/* Script generated by Pawn Studio */

#include <amxmodx>
#include <amxmisc>
#include <colorchat>

#define PLUGIN	"Durum Eklentisi"
#define AUTHOR	"CSmiLeFaCe"
#define VERSION	"1.0"


public plugin_init()
{
	register_plugin(PLUGIN, VERSION, AUTHOR)
	register_clcmd("say /durum", "durum")
	register_clcmd("say !durum", "durum")
	register_clcmd("say .durum", "durum")
}

public durum(id){
	new ff[32],alltalk[32],sxe[32]
	
	if(get_cvar_num("mp_friendlyfire") == 1){
		format(ff,31,"Acik")
	}
	else{
		format(ff,31,"Kapali")
	}
	
	if(get_cvar_num("sv_alltalk") == 1){
		format(alltalk,31,"Acik")
	}
	else{
		format(alltalk,31,"Kapali")
	}
	
	if(get_cvar_num("__sxei_required") == -1){
		format(sxe,31,"Kapali")
	}
	if(get_cvar_num("__sxei_required") == 0){
		format(sxe,31,"Opsiyonel")
	}
	if(get_cvar_num("__sxei_required") == 1){
		format(sxe,31,"Acik")
	}
	
	ColorChat(id,NORMAL,"^3DostAtesi ^1: ^4%s ^1| ^3Alltalk ^1: ^4%s ^1|  ^3Sxe Durumu ^1: ^4%s",ff,alltalk,sxe)
}
