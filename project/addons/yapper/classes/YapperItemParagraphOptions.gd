extends YapperItemOptions
class_name YapperItemParagraphOptions



enum YapperItemOptionAlignment {
	LEFT,
	CENTER,
	RIGHT,
	FILL,
}

enum YapperItemOptionBiDiOverride {
	DEFAULT,
	URI,
	FILE,
	EMAIL,
	LIST,
	NONE,
	CUSTOM,
}

enum YapperItemOptionJustificationFlags {
	KASHIDA,
	WORD,
	TRIM,
	AFTER_LAST_TAB,
	SKIP_LAST,
	SKIP_LAST_WITH_CHARS,
	DO_NOT_SKIP_SINGLE,
}

enum YapperItemOptionDirection {
	LTR,
	RTL,
	AUTO,
}

enum YapperItemOptionLanguage {
	AA, AB, ACE, ACH, ADA, ADY, AE, AEB, AF, AFH, AGQ, AIN, AGR, AK, AKK, AKZ, ALE, ALN, ALT, AM, AN,
	ANG, ANP, AR, ARC, ARN, ARO, ARP, ARQ, ARS, ARW, ARY, ARZ, AS, ASA, ASE, AST, AV, AVK, AWA, AYC,
	AY, AZ, BA, BAL, BAN, BAR, BAS, BAX, BBC, BBJ, BE, BEJ, BEM, BER, BEW, BEZ, BFD, BFQ, BG, BHB, BGN,
	BHO, BI, BIK, BIN, BJN, BKM, BLA, BM, BN, BO, BPY, BQI, BR, BRH, BRX, BS, BSS, BUA, BUG, BUM, BYN,
	BYV, CA, CAD, CAR, CAY, CCH, CCP, CE, CEB, CGG, CH, CHB, CHG, CHK, CHM, CHN, CHO, CHP, CHR, CHY,
	CIC, CKB, CMN, CO, COP, CPS, CR, CRH, CRS, CS, CSB, CU, CV, CY, DA, DAK, DAR, DAV, DE, DEL, DEN,
	DGR, DIN, DJE, DOI, DSB, DTP, DUA, DUM, DV, DYO, DYU, DZ, DZG, EBU, EE, EFI, EGL, EGY, EKA, EL,
	ELX, EN, ENM, EO, ES, ESU, ET, EU, EWO, EXT, FA, FAN, FAT, FF, FI, FIL, FIT, FJ, FO, FON, FR, FRC,
	FRM, FRO, FRP, FRR, FRS, FUR, FY, GA, GAA, GAG, GAN, GAY, GBA, GBZ, GD, GEZ, GIL, GL, GLK, GMH,
	GN, GOH, GOM, GON, GOR, GOT, GRB, GRC, GSW, GU, GUC, GUR, GUZ, GV, GWI, HA, HAI, HAK, HAW, HE, IW,
	HI, HIF, HIL, HIT, HMN, HO, HNE, HR, HSB, HSN, HT, HU, HUP, HUS, HY, HZ, IA, IBA, IBB, ID, IN, IE,
	IG, II, IK, ILO, INH, IO, IS, IT, IU, IZH, JA, JAM, JBO, JGO, JMC, JPR, JRB, JUT, JV, KA, KAA, KAB,
	KAC, KAJ, KAM, KAW, KBD, KBL, KCG, KDE, KEA, KEN, KFO, KG, KGP, KHA, KHO, KHQ, KHW, KI, KIU, KJ,
	KK, KKJ, KL, KLN, KM, KMB, KN, KO, KOI, KOK, KOS, KPE, KR, KRC, KRI, KRJ, KRL, KRU, KS, KSB, KSF,
	KSH, KU, KUM, KUT, KV, KW, KY, LA, LAD, LAG, LAH, LAM, LB, LEZ, LFN, LG, LI, LIJ, LIV, LKT, LMO,
	LN, LO, LOL, LOU, LOZ, LRC, LT, LTG, LU, LUA, LUI, LUN, LUO, LUS, LUY, LV, LZH, LZZ, MAD, MAF, MAG,
	MAI, MAK, MAN, MAS, MDE, MDF, MDR, MEN, MER, MFE, MG, MGA, MGH, MGO, MH, MHR, MI, MIC, MIN, MIQ,
	MJW, MK, ML, MN, MNC, MNI, MNW, MOS, MOH, MR, MRJ, MS, MT, MUA, MUS, MWL, MWR, MWV, MY, MYE, MYV,
	MZN, NA, NAH, NAN, NAP, NAQ, NB, NO, ND, NDS, NE, NEW, NHN, NG, NIA, NIU, NJO, NL, NMG, NN, NNH,
	NOG, NON, NOV, NQO, NR, NSO, NUS, NV, NWC, NY, NYM, NYN, NYO, NZI, OC, OJ, OM, OR, OS, OSA, OTA,
	PA, PAG, PAL, PAM, PAP, PAU, PCD, PCM, PDC, PDT, PEO, PFL, PHN, PI, PL, PMS, PNT, PON, PR, PRG,
	PRO, PRS, PS, PT, QU, QUC, QUG, QUY, QUZ, RAJ, RAP, RAR, RGN, RIF, RM, RN, RO, ROF, ROM, RTM, RU,
	RUE, RUG, RUP, RW, RWK, SA, SAD, SAH, SAM, SAQ, SAS, SAT, SAZ, SBA, SBP, SC, SCN, SCO, SD, SDC,
	SDH, SE, SEE, SEH, SEI, SEL, SES, SG, SGA, SGS, SH, SHI, SHN, SHS, SHU, SI, SID, SK, SL, SLI, SLY,
	SM, SMA, SMJ, SMN, SMS, SN, SNK, SO, SOG, SON, SQ, SR, SRN, SRR, SS, SSY, ST, STQ, SU, SUK, SUS,
	SUX, SV, SW, SWB, SWC, SYC, SYR, SZL, TA, TCY, TE, TEM, TEO, TER, TET, TG, TH, THE, TI, TIG, TIV,
	TK, TKL, TKR, TL, TLH, TLI, TLY, TMH, TN, TO, TOG, TPI, TR, TRU, TRV, TS, TSD, TSI, TT, TTT, TUM,
	TVL, TW, TWQ, TY, TYV, TZM, UDM, UG, UGA, UK, UMB, UNM, UR, UZ, VAI, VE, VEC, VEP, VI, VLS, VMF,
	VO, VOT, VRO, VUN, WA, WAE, WAL, WAR, WAS, WBP, WO, WUU, XAL, XH, XMF, XOG, YAO, YAP, YAV, YBB,
	YI, YO, YRL, YUE, YUW, ZA, ZAP, ZBL, ZEA, ZEN, ZGH, ZH, ZU, ZUN, ZZA,
}



var align : YapperItemOptionAlignment = YapperItemOptionAlignment.LEFT
var bidi_override : YapperItemOptionBiDiOverride = YapperItemOptionBiDiOverride.DEFAULT
var justification_flags : Array[YapperItemOptionJustificationFlags] = [
	YapperItemOptionJustificationFlags.WORD,
	YapperItemOptionJustificationFlags.KASHIDA,
	YapperItemOptionJustificationFlags.SKIP_LAST,
	YapperItemOptionJustificationFlags.DO_NOT_SKIP_SINGLE ]
var direction : YapperItemOptionDirection # TODO : set inherited
var language : YapperItemOptionLanguage # TODO : set inherited or default game language
var tab_stops : float = NAN # TODO : default to "Width of the space character in the font.
