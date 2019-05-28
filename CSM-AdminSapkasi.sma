#include <amxmodx>
#include <engine>

	//E�er ki admin_head modelini kullanmaya devam edecekseniz bir alt sat�rdaki #define SADECE_PRO_SAPKASI n�n ba��nda // olmayacak,
	//Ama e�er ki pelerin modeli yada abuk sabuk bir model i�in ayarlama yapacaksan�z a�a��daki #define SADECE_PRO_SAPKASI n�n ba��nda // olmal�.
	//Bunun sebebi bu eklentinin admin_head.mdl modeline uyumlu yaz�lmas�.

#define SADECE_PRO_SAPKASI

//Eklenti Hakk�nda -> Admin �apkas�n�n skin de�i�imi i�in oyuncu do�mas�n� alg�layan bir yer laz�m, hamsandwich.
#if defined SADECE_PRO_SAPKASI
#include <hamsandwich>
#endif

//Eklenti Hakk�nda -> 1.8.3 uyumunu bu �ekilde sa�lad�m, e�er ki AmxModx s�r�m� 1.8.3'�n alt�nda ise disconnected k�sm�n� disconnect olarak de�i�tirecek.
#if AMXX_VERSION_NUM < 183
	#define client_disconnected client_disconnect
#endif	




	//Admin yetkisi, kick olarak ayarlad�m ben, gerekirse de�i�tirirsiniz.
#define YETKI ADMIN_KICK


	//�apka modelinin yolu, e�er bu modeli de�i�tirecekseniz SADECE_PRO_SAPKASI ayar�ndan ��kart�n�z. Sat�r 4'� okuyunuz.
new const SAPKA_YOLU[] = "models/admin_head.mdl";

new Ent[33];

public plugin_init() {
	register_plugin("Admin Sapkasi", "1.0", "CSmiLeFaCe");
	#if defined SADECE_PRO_SAPKASI
	RegisterHam(Ham_Spawn, "player", "Spawn", true);
	//Eklenti Hakk�nda -> Spawn kullanmam�n sebebi e�er ki model de�i�ikli�i olur ise �apkan�nda ona g�re de�i�mesi.
	#endif
}
#if defined SADECE_PRO_SAPKASI
public Spawn(id) {
	if(is_valid_ent(Ent[id]) && is_user_connected(id) && is_user_alive(id)) {
		new modelID = get_model_id(id)
		entity_set_int(Ent[id], EV_INT_body, modelID);
	}
}
#endif
Kontrol(const id) {
	if(Ent[id] && is_valid_ent(Ent[id])) {
		entity_set_int(Ent[id], EV_INT_flags, FL_KILLME);
		entity_set_float(Ent[id], EV_FL_nextthink, get_gametime());
		Ent[id] = 0;
	}
}
public client_putinserver(id) {
	if(!(get_user_flags(id) & YETKI)) {
		return;
	}
	Kontrol(id);
	if((Ent[id] = create_entity("info_target"))) {
		entity_set_string(Ent[id], EV_SZ_classname, "sapka");
		entity_set_model(Ent[id], SAPKA_YOLU);
		entity_set_int(Ent[id], EV_INT_movetype, MOVETYPE_FOLLOW);
		entity_set_edict(Ent[id], EV_ENT_aiment, id);
	}
}

public client_disconnected(id) {
	Kontrol(id);
}

public plugin_precache() {
	precache_model(SAPKA_YOLU);
	#if defined SADECE_PRO_SAPKASI
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/gign/gign.mdl");
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/gsg9/gsg9.mdl");
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/sas/sas.mdl");
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/urban/urban.mdl");
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/vip/vip.mdl");
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/arctic/arctic.mdl");
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/guerilla/guerilla.mdl");
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/leet/leet.mdl");
	force_unmodified(force_model_samebounds,{0,0,0},{0,0,0},"models/player/terror/terror.mdl");
	//Buralar� bilmiyorum neden yaz�lm��, KaLoSZyFeR yazm��, kullanmaz isek ay�p olur.
	#endif
}
#if defined SADECE_PRO_SAPKASI
//Alt k�s�m adminmark eklentisinden haz�r olarak al�nm��t�r. 
//Written by KaLoSZyFeR for adminmark model file.
new modelname[9][] ={
	"gign",
	"gsg9",
	"sas",
	"urban",
	"vip",
	"arctic",
	"guerilla",
	"leet",
	"terror"
}
public get_model_id(id)
{
	new modelStr[32], iNum=32, modelID
	get_user_info(id,"model",modelStr,iNum)
	
	for(new i = 0; i < 9; i++)
	{
		if (equali (modelStr, modelname[i]) )
		{
			modelID = i
		}
	}	
	return modelID
}
#endif
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1031\\ f0\\ fs16 \n\\ par }
*/
