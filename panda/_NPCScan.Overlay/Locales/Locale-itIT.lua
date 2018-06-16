--[[****************************************************************************
  * _NPCScan.Overlay by Saiket                                                 *
  * Locales/Locale-itIT.lua - Localized string constants (it-IT).              *
  ****************************************************************************]]


if ( GetLocale() ~= "itIT" ) then
	return;
end


-- See http://wow.curseforge.com/addons/npcscan-overlay/localization/itIT/
local private = select( 2, ... );
private.L = setmetatable( {
	NPCs = setmetatable( {
	}, { __index = private.L.NPCs; } );
}, { __index = private.L; } );

private.L.NPCs["100"] = "Gruff Morsolesto"
private.L.NPCs["10077"] = "Faucifuneste"
private.L.NPCs["10078"] = "Imp Infernale"
private.L.NPCs["10080"] = "Sandarr Razziadune"
private.L.NPCs["10081"] = "Presenza della Polvere"
private.L.NPCs["10082"] = "Zerillis"
private.L.NPCs["10119"] = "Volchan"
private.L.NPCs["10196"] = "Generale Colbatann"
private.L.NPCs["10197"] = "Mezzir la Belva"
private.L.NPCs["10198"] = "Kashoch il Razziatore"
private.L.NPCs["10199"] = "Grizzle Zampaneve"
private.L.NPCs["10200"] = "Rak'shiri"
private.L.NPCs["10202"] = "Azurous"
private.L.NPCs["10263"] = "Vilguardia Ardente"
private.L.NPCs["10356"] = "Bayne"
private.L.NPCs["10357"] = "Ressan il Pungitore"
private.L.NPCs["10358"] = "Ombra di Fellicent"
private.L.NPCs["10359"] = "Sri'skulk"
private.L.NPCs["10376"] = "Artiglio di Cristallo"
private.L.NPCs["10393"] = "Skul"
private.L.NPCs["10509"] = "Jed Guardiarune"
private.L.NPCs["10558"] = "Forresten il Cantastorie"
private.L.NPCs["10559"] = "Dama Vespia"
private.L.NPCs["1063"] = "Giada"
private.L.NPCs["10639"] = "Rorgish Jowl"
private.L.NPCs["10640"] = "Zampaquercia"
private.L.NPCs["10641"] = "Morsicatore dei Rami"
private.L.NPCs["10642"] = "Eck'alom"
private.L.NPCs["10644"] = "Belva delle Nebbie"
private.L.NPCs["10647"] = "Principe Raze"
private.L.NPCs["10741"] = "Sian-Rotam"
private.L.NPCs["10809"] = "Spinapietra"
private.L.NPCs["10817"] = "Duggan Granmartello"
private.L.NPCs["10818"] = "Cavaliere della Morte Custode d'Anime"
private.L.NPCs["10819"] = "Barone Sangueacre"
private.L.NPCs["10820"] = "Duca Razziarabbia"
private.L.NPCs["10821"] = "Hed'mush il Marcescente"
private.L.NPCs["10823"] = "Zul'brin Ramotorto"
private.L.NPCs["10824"] = "Cacciatore della Morte Falcolancia"
private.L.NPCs["10825"] = "Gish l'Immobile"
private.L.NPCs["10826"] = "Sire Falcenera"
private.L.NPCs["10827"] = "Necroratrice Selendre"
private.L.NPCs["10828"] = "Lynnia Abbendis"
private.L.NPCs["1106"] = "Perduto Cuoco"
private.L.NPCs["1112"] = "Vedova Succhiasangue"
private.L.NPCs["1119"] = "Spinamazza"
private.L.NPCs["1130"] = "Bjarn"
private.L.NPCs["1132"] = "Truciolo"
private.L.NPCs["1137"] = "Edan la Belva"
private.L.NPCs["11383"] = "Gran Sacerdotessa Hai'watna"
private.L.NPCs["1140"] = "Matriarca Boccaguzza"
private.L.NPCs["11447"] = "Mushgog"
private.L.NPCs["11467"] = "Tsu'zee"
private.L.NPCs["11497"] = "Razza"
private.L.NPCs["11498"] = "Skarr il Corrotto"
private.L.NPCs["11688"] = "Centauro Corrotto"
private.L.NPCs["12037"] = "Ursol'lok"
private.L.NPCs["12237"] = "Meshlok il Falciatore"
private.L.NPCs["12431"] = "Zannabieca"
private.L.NPCs["12433"] = "Krethis il Filaombre"
private.L.NPCs["1260"] = "Granpadre Arctikus"
private.L.NPCs["12902"] = "Lorgus Jett"
private.L.NPCs["13896"] = "Barbascaglia"
private.L.NPCs["1398"] = "Boss Galgosh"
private.L.NPCs["1399"] = "Magosh"
private.L.NPCs["14221"] = "Gravis Slipknot"
private.L.NPCs["14222"] = "Araga"
private.L.NPCs["14223"] = "Benj l'Inquieta"
private.L.NPCs["14224"] = "7:XT"
private.L.NPCs["14225"] = "Principe Kellen"
private.L.NPCs["14226"] = "Kaskk"
private.L.NPCs["14227"] = "Hissperak"
private.L.NPCs["14228"] = "Ridolina"
private.L.NPCs["14229"] = "Lamasalmastra Maledetto"
private.L.NPCs["14230"] = "Occhiolesto"
private.L.NPCs["14231"] = "Drogoth il Vagante"
private.L.NPCs["14232"] = "Dart"
private.L.NPCs["14233"] = "Squarciascaglia"
private.L.NPCs["14234"] = "Hayoc"
private.L.NPCs["14235"] = "Il Marcio"
private.L.NPCs["14236"] = "Sire Angler"
private.L.NPCs["14237"] = "Verme Viscido"
private.L.NPCs["1424"] = "Maestro Scavatore"
private.L.NPCs["1425"] = "Kubb"
private.L.NPCs["14266"] = "Shanda il Tessitore"
private.L.NPCs["14267"] = "Emogg il Frantumatore"
private.L.NPCs["14268"] = "Sire Condar"
private.L.NPCs["14269"] = "Aqualon il Cercatore"
private.L.NPCs["14270"] = "Squiddic"
private.L.NPCs["14271"] = "Strappacostole"
private.L.NPCs["14272"] = "Sputafuoco"
private.L.NPCs["14273"] = "Cuordiroccia"
private.L.NPCs["14275"] = "Tamra Piccatonante"
private.L.NPCs["14276"] = "Sfregiapinna"
private.L.NPCs["14277"] = "Dama Zephris"
private.L.NPCs["14278"] = "Ro'Bark"
private.L.NPCs["14279"] = "Telaracna"
private.L.NPCs["14280"] = "Grande Samras"
private.L.NPCs["14281"] = "Jimmy il Dissanguatore"
private.L.NPCs["14339"] = "Ululato della Morte"
private.L.NPCs["14340"] = "Alshirr Fiatonero"
private.L.NPCs["14342"] = "Zamparabbia"
private.L.NPCs["14343"] = "Olm il Saggio"
private.L.NPCs["14344"] = "Mongress"
private.L.NPCs["14345"] = "Ongar"
private.L.NPCs["14424"] = "Pantanorax"
private.L.NPCs["14425"] = "Masticaossa"
private.L.NPCs["14426"] = "Harb Monte Infame"
private.L.NPCs["14427"] = "Gibblesnik"
private.L.NPCs["14428"] = "Uruson"
-- private.L.NPCs["14429"] = "Grimmaw"
private.L.NPCs["14430"] = "Inseguitrice del Vespro"
private.L.NPCs["14431"] = "Shelda la Furia"
private.L.NPCs["14432"] = "Threggil"
private.L.NPCs["14433"] = "Sludginn"
private.L.NPCs["14445"] = "Capitano Wyrmak"
private.L.NPCs["14446"] = "Fingat"
private.L.NPCs["14447"] = "Gilmorian"
private.L.NPCs["14448"] = "Molt Spinobor"
private.L.NPCs["14471"] = "Setis"
private.L.NPCs["14472"] = "Gretheer"
private.L.NPCs["14473"] = "Lapress"
private.L.NPCs["14474"] = "Zora"
private.L.NPCs["14475"] = "Rex Ashil"
private.L.NPCs["14476"] = "Krellack"
private.L.NPCs["14477"] = "Grubthor"
private.L.NPCs["14478"] = "Huricanian"
private.L.NPCs["14479"] = "Signore del Crepuscolo Everun"
private.L.NPCs["14487"] = "Gluggl"
private.L.NPCs["14488"] = "Roloch"
private.L.NPCs["14490"] = "Rippa"
private.L.NPCs["14491"] = "Kurmokk"
private.L.NPCs["14492"] = "Verifonix"
private.L.NPCs["1531"] = "Anima Perduta"
private.L.NPCs["1533"] = "Spirito Tormentato"
private.L.NPCs["1552"] = "Ventre Ruvido"
private.L.NPCs["16179"] = "Hyakiss il Guardingo"
private.L.NPCs["16180"] = "Shadikith il Planante"
private.L.NPCs["16181"] = "Rokad il Devastatore"
private.L.NPCs["16184"] = "Sovrintendente Nerubiano"
private.L.NPCs["16854"] = "Eldinarcus"
private.L.NPCs["16855"] = "Tregla"
private.L.NPCs["17144"] = "Zannatruce"
private.L.NPCs["18241"] = "Crostoly"
private.L.NPCs["1837"] = "Giudice Scarlatto"
private.L.NPCs["1838"] = "Interrogatore Scarlatto"
private.L.NPCs["1839"] = "Alto Chierico Scarlatto"
private.L.NPCs["1841"] = "Esecutore Scarlatto"
private.L.NPCs["1843"] = "Caposquadra Jerris"
private.L.NPCs["1844"] = "Caposquadra Marcrid"
private.L.NPCs["1847"] = "Mantomarcio"
private.L.NPCs["1848"] = "Sire Maldazzar"
private.L.NPCs["1849"] = "Soffioscuro"
private.L.NPCs["1850"] = "Putridius"
private.L.NPCs["1851"] = "Tendinor"
private.L.NPCs["18677"] = "Mekthorg il Selvaggio"
private.L.NPCs["18678"] = "Faucipiene"
private.L.NPCs["18679"] = "Vorakem Sortenera"
private.L.NPCs["18680"] = "Marticar"
private.L.NPCs["18681"] = "Emissaria Spiraguzza"
private.L.NPCs["18682"] = "Guardingo del Pantano"
private.L.NPCs["18683"] = "Cacciatore del Vuoto Yar"
private.L.NPCs["18684"] = "Bro'Gaz lo Sporco"
private.L.NPCs["18685"] = "Okrek"
private.L.NPCs["18686"] = "Jurim il Vate della Rovina"
private.L.NPCs["18689"] = "Mutilator"
private.L.NPCs["18690"] = "Morsfond"
private.L.NPCs["18692"] = "Hemathion"
private.L.NPCs["18693"] = "Oratore Mar'grom"
private.L.NPCs["18694"] = "Collidus il Guardiano Distorcente"
private.L.NPCs["18695"] = "Ambasciatore Jerrikar"
private.L.NPCs["18696"] = "Kraator"
private.L.NPCs["18697"] = "Capo Ingegnere Lorthander"
private.L.NPCs["18698"] = "Nucleoeterno il Punitore"
private.L.NPCs["1885"] = "Fabbro Scarlatto"
private.L.NPCs["1910"] = "Muad"
private.L.NPCs["1911"] = "Deeb"
private.L.NPCs["1936"] = "Contadino Solliden"
private.L.NPCs["2090"] = "Ma'ruk Scuoiadraghi"
private.L.NPCs["20932"] = "Nuramoc"
private.L.NPCs["2108"] = "Garneg Teschioarso"
private.L.NPCs["2162"] = "Agal"
private.L.NPCs["2172"] = "Madre del Covo Camminatrice"
private.L.NPCs["21724"] = "Cacciafalchi"
private.L.NPCs["2175"] = "Ombrartiglio"
private.L.NPCs["2184"] = "Dama Scrutaluna"
private.L.NPCs["2186"] = "Carnivus il Demolitore"
private.L.NPCs["2191"] = "Licillin"
private.L.NPCs["2192"] = "Invocatore del Fuoco Radison"
private.L.NPCs["22060"] = "Fenissa l'Assassina"
private.L.NPCs["22062"] = "Dott. Bracciopazzo"
private.L.NPCs["2258"] = "Maggarrak"
private.L.NPCs["2452"] = "Skhowl"
private.L.NPCs["2453"] = "Lo'Grosh"
private.L.NPCs["2476"] = "Gosh-Haldir"
private.L.NPCs["2541"] = "Sire Sakrasis"
private.L.NPCs["2598"] = "Darbel Montrose"
private.L.NPCs["2600"] = "Singer"
private.L.NPCs["2601"] = "Panciamarcia"
private.L.NPCs["2602"] = "Ruul Monoroccia"
private.L.NPCs["2603"] = "Kovork"
private.L.NPCs["2604"] = "Molok il Frantumatore"
private.L.NPCs["2605"] = "Zalas Scorzasecca"
private.L.NPCs["2606"] = "Nimar il Sicario"
private.L.NPCs["2609"] = "Geomante Dagaselce"
private.L.NPCs["2744"] = "Comandante di Forgiascura"
private.L.NPCs["2749"] = "Barricata"
private.L.NPCs["2751"] = "Golem da Guerra"
private.L.NPCs["2752"] = "Elementale Tellurico"
private.L.NPCs["2753"] = "Barnabus"
private.L.NPCs["2754"] = "Anathemus"
private.L.NPCs["2779"] = "Principe Nazjak"
private.L.NPCs["2850"] = "Zanna Rotta"
private.L.NPCs["2931"] = "Zaricotl"
private.L.NPCs["3058"] = "Arra'chea"
private.L.NPCs["3068"] = "Mazzranache"
private.L.NPCs["32357"] = "Vecchio Scorzacristallo"
private.L.NPCs["32358"] = "Fumblub Ventobrugola"
private.L.NPCs["32361"] = "Cornogelido"
private.L.NPCs["32377"] = "Perobas il Sanguinario"
private.L.NPCs["32386"] = "Vigdis l'Ancella della Guerra"
private.L.NPCs["32398"] = "Re Ping"
private.L.NPCs["32400"] = "Tukemuth"
private.L.NPCs["32409"] = "Sopravvissuto di Indu'le Frenetico"
private.L.NPCs["32417"] = "Gran Signore Scarlatto Daion"
private.L.NPCs["32422"] = "Grocklar"
private.L.NPCs["32429"] = "Odio Ribollente"
private.L.NPCs["32435"] = "Vern"
private.L.NPCs["32438"] = "Syreian il Trinciaossa"
private.L.NPCs["32447"] = "Sentinella di Zul'Drak"
private.L.NPCs["32471"] = "Griegen"
private.L.NPCs["32475"] = "Filatore del Terrore"
private.L.NPCs["32481"] = "Aotona"
private.L.NPCs["32485"] = "Re Krush"
private.L.NPCs["32487"] = "Putridus l'Antico"
private.L.NPCs["32491"] = "Proto Draco Preistorico"
private.L.NPCs["32495"] = "Hildana Rubamorte"
private.L.NPCs["32500"] = "Dirkee"
private.L.NPCs["32501"] = "Gran Thane Jorfus"
private.L.NPCs["32517"] = "Loque'nahak"
private.L.NPCs["3253"] = "Falciatore Silitide"
private.L.NPCs["32630"] = "Vyragosa"
private.L.NPCs["3270"] = "Mistico Lamagrugno Anziano"
private.L.NPCs["3295"] = "Anomalia Poltigliosa"
private.L.NPCs["33776"] = "Gondria"
private.L.NPCs["3398"] = "Gesharahan"
private.L.NPCs["3470"] = "Rathorian"
private.L.NPCs["35189"] = "Skoll"
-- private.L.NPCs["3535"] = "Blackmoss the Fetid"
private.L.NPCs["3581"] = "Mostro delle Fogne"
private.L.NPCs["3652"] = "Trigore la Sferzatrice"
private.L.NPCs["3672"] = "Boahn"
private.L.NPCs["3735"] = "Speziale Falthis"
private.L.NPCs["3736"] = "Assassino Oscuro Mordenthal"
private.L.NPCs["3773"] = "Akkrilus"
private.L.NPCs["3792"] = "Signore del Branco Sbranafiere"
private.L.NPCs["38453"] = "Arcturis"
private.L.NPCs["3872"] = "Capitano Congiurato"
private.L.NPCs["39183"] = "Scorpitar"
private.L.NPCs["39185"] = "Zannaschiava"
private.L.NPCs["39186"] = "Scrutainferno"
private.L.NPCs["4066"] = "Nal'taszar"
private.L.NPCs["4132"] = "Krkk'kx"
private.L.NPCs["4339"] = "Alasulfurea"
private.L.NPCs["43488"] = "Mordei il Fenditerra"
private.L.NPCs["43613"] = "Vate della Rovina Passo Saggio"
-- private.L.NPCs["43720"] = "\"Pokey\" Thornmantle"
private.L.NPCs["4380"] = "Vedova Brumafosca"
private.L.NPCs["44224"] = "Duedita"
private.L.NPCs["44225"] = "Rufus Colpocupo"
private.L.NPCs["44226"] = "Dentesauro"
private.L.NPCs["44227"] = "Gazz il Cacciatore del Loch"
private.L.NPCs["4425"] = "Cacciatore Cieco"
-- private.L.NPCs["44714"] = "Fronkle the Disturbed"
private.L.NPCs["44722"] = "Riflesso Contorto di Narain"
private.L.NPCs["44750"] = "Califfo Scorpiaculeo"
private.L.NPCs["44759"] = "Andre Barbafiamma"
private.L.NPCs["44761"] = "Aquementas lo Scatenato"
private.L.NPCs["44767"] = "Occulus il Corrotto"
private.L.NPCs["45257"] = "Mordak Pieganotte"
private.L.NPCs["45258"] = "Cassia la Regina Strisciante"
private.L.NPCs["45260"] = "Foglianera"
private.L.NPCs["45262"] = "Narixxus l'Araldo della Rovina"
private.L.NPCs["45369"] = "Morick Birranera"
private.L.NPCs["45380"] = "Codacenere"
private.L.NPCs["45384"] = "Zampasaggia"
private.L.NPCs["45398"] = "Grizlak"
private.L.NPCs["45399"] = "Optimo"
private.L.NPCs["45401"] = "Pinnabianca"
private.L.NPCs["45402"] = "Nix"
private.L.NPCs["45404"] = "Forgiaterra Maren"
private.L.NPCs["45739"] = "Il Milite Ignoto"
private.L.NPCs["45740"] = "Guardiano Eva"
private.L.NPCs["45771"] = "Marus"
private.L.NPCs["45785"] = "Zuccaccia"
private.L.NPCs["45801"] = "Eliza"
private.L.NPCs["45811"] = "Marina DeSirrus"
private.L.NPCs["462"] = "Vultros"
private.L.NPCs["46981"] = "Sferzanotte"
-- private.L.NPCs["46992"] = "Berard the Moon-Crazed"
private.L.NPCs["47003"] = "Bolgaff"
private.L.NPCs["47008"] = "Fenwick Thatros"
private.L.NPCs["47009"] = "Aquarius l'Incontenibile"
private.L.NPCs["47010"] = "Indigos"
private.L.NPCs["47012"] = "Effritus"
private.L.NPCs["47015"] = "Figlio Perduto di Arugal"
private.L.NPCs["47023"] = "Thule Zampacorvo"
private.L.NPCs["471"] = "Madre Zanna"
private.L.NPCs["472"] = "Mangiafinocchi"
private.L.NPCs["47386"] = "Ainamiss la Regina dell'Alveare"
private.L.NPCs["47387"] = "Harakiss l'Infestante"
private.L.NPCs["4842"] = "Invocatrice della Terra Halmgar"
private.L.NPCs["49822"] = "Grinfiagiada"
private.L.NPCs["49913"] = "Dama Ga-Ga"
private.L.NPCs["50005"] = "Poseidus"
private.L.NPCs["50009"] = "Mobus"
private.L.NPCs["50050"] = "Shok'sharak"
private.L.NPCs["50051"] = "Strisciaombre"
private.L.NPCs["50052"] = "Burgy Cuorenero"
private.L.NPCs["50053"] = "Thartuk l'Esiliato"
private.L.NPCs["50056"] = "Garr"
private.L.NPCs["50057"] = "Alafiamma"
private.L.NPCs["50058"] = "Tartafuoco"
private.L.NPCs["50059"] = "Golgarok"
private.L.NPCs["50060"] = "Terborus"
private.L.NPCs["50061"] = "Xariona"
private.L.NPCs["50062"] = "Aeonaxx"
private.L.NPCs["50063"] = "Akma'hat"
private.L.NPCs["50064"] = "Cyrus il Nero"
private.L.NPCs["50065"] = "Armagedillo"
private.L.NPCs["50085"] = "Supremo Fendifuria"
private.L.NPCs["50086"] = "Tarvus il Vile"
private.L.NPCs["50089"] = "Julak"
private.L.NPCs["50138"] = "Karoma"
private.L.NPCs["50154"] = "Madexx"
private.L.NPCs["50159"] = "Sambas"
private.L.NPCs["50328"] = "Fangor"
private.L.NPCs["50329"] = "Rrakk"
private.L.NPCs["50330"] = "Kree"
private.L.NPCs["50331"] = "Go-Kan"
private.L.NPCs["50332"] = "Korda Torros"
private.L.NPCs["50333"] = "Lon il Toro"
private.L.NPCs["50334"] = "Dak il Distruttore"
private.L.NPCs["50335"] = "Alitus"
private.L.NPCs["50336"] = "Yorik Occhio Arguto"
private.L.NPCs["50337"] = "Cackle"
private.L.NPCs["50338"] = "Kor'nas Predanotte"
private.L.NPCs["50339"] = "Sulik'shor"
private.L.NPCs["50340"] = "Gaarn il Tossico"
private.L.NPCs["50341"] = "Borginn Pugnonero"
private.L.NPCs["50342"] = "Heronis"
private.L.NPCs["50343"] = "Quall"
private.L.NPCs["50344"] = "Norlaxx"
private.L.NPCs["50345"] = "Alit"
private.L.NPCs["50346"] = "Ronak"
private.L.NPCs["50347"] = "Karr l'Oscuratore"
private.L.NPCs["50348"] = "Norissis"
private.L.NPCs["50349"] = "Kang il Ladro d'Anime"
private.L.NPCs["50350"] = "Morgrinn Zannalacera"
private.L.NPCs["50351"] = "Jonn-Dar"
private.L.NPCs["50352"] = "Qu'nas"
private.L.NPCs["50353"] = "Manas"
private.L.NPCs["50354"] = "Havak"
private.L.NPCs["50355"] = "Kah'tir"
private.L.NPCs["50356"] = "Krol la Lama"
private.L.NPCs["50357"] = "Alasole"
private.L.NPCs["50358"] = "Costrutto dei Predatori del Sole Fuori Controllo"
private.L.NPCs["50359"] = "Urgolax"
private.L.NPCs["50361"] = "Ornat"
private.L.NPCs["50362"] = "Bragonero l'Artiglio"
private.L.NPCs["50363"] = "Krax'ik"
private.L.NPCs["50364"] = "Nal'lak lo Squartatore"
private.L.NPCs["50370"] = "Karapax"
private.L.NPCs["50388"] = "Torik-Ethis"
private.L.NPCs["50409"] = "Statuetta di Dromedario Misteriosa"
private.L.NPCs["506"] = "Sergente Zampaferrea"
private.L.NPCs["507"] = "Fenros"
private.L.NPCs["50724"] = "Strisciaspina"
private.L.NPCs["50725"] = "Azelisk"
private.L.NPCs["50726"] = "Kalixx"
private.L.NPCs["50727"] = "Strix lo Spinoso"
private.L.NPCs["50728"] = "Assaltamorte"
private.L.NPCs["50730"] = "Spinavenefica"
private.L.NPCs["50731"] = "Zannafine"
private.L.NPCs["50733"] = "Ski'thik"
private.L.NPCs["50734"] = "Lith'ik l'Inseguitore"
private.L.NPCs["50735"] = "Traslaocchi il Viscido"
private.L.NPCs["50737"] = "Acroniss"
private.L.NPCs["50738"] = "Scaglialucida"
private.L.NPCs["50739"] = "Gar'lok"
private.L.NPCs["50741"] = "Kaxx"
private.L.NPCs["50742"] = "Qem"
private.L.NPCs["50743"] = "Manax"
private.L.NPCs["50744"] = "Qu'rik"
private.L.NPCs["50745"] = "Losaj"
private.L.NPCs["50746"] = "Bornix lo Scavaterra"
private.L.NPCs["50747"] = "Tix"
private.L.NPCs["50748"] = "Nyaj"
private.L.NPCs["50749"] = "Kal'tik la Piaga"
private.L.NPCs["50750"] = "Aethis"
private.L.NPCs["50752"] = "Tarantis"
private.L.NPCs["50759"] = "Iriss la Vedova"
private.L.NPCs["50763"] = "Inseguitore dell'Ombra"
private.L.NPCs["50764"] = "Paraliss"
private.L.NPCs["50765"] = "Miasmiss"
private.L.NPCs["50766"] = "Sele'na"
private.L.NPCs["50768"] = "Cournith Calcalaghi"
private.L.NPCs["50769"] = "Zai l'Esiliato"
private.L.NPCs["50770"] = "Zorn"
private.L.NPCs["50772"] = "Eshelon"
private.L.NPCs["50775"] = "Likk la Cacciatrice"
private.L.NPCs["50776"] = "Nalash Verdantis"
private.L.NPCs["50777"] = "Pungolo"
private.L.NPCs["50778"] = "Tessiferro"
private.L.NPCs["50779"] = "Sporeggon"
private.L.NPCs["50780"] = "Sahn Cacciamaree"
private.L.NPCs["50782"] = "Sarnak"
private.L.NPCs["50783"] = "Esploratore da Guerra di Salyis"
private.L.NPCs["50784"] = "Anith"
private.L.NPCs["50785"] = "Ombrocielo"
private.L.NPCs["50786"] = "Alabrillante"
private.L.NPCs["50787"] = "Arness la Scaglia"
private.L.NPCs["50788"] = "Quetzl"
private.L.NPCs["50789"] = "Nessos l'Oracolo"
private.L.NPCs["50790"] = "Ionis"
private.L.NPCs["50791"] = "Siltriss l'Affilatore"
private.L.NPCs["50792"] = "Chiaa"
private.L.NPCs["50797"] = "Yukiko"
private.L.NPCs["50803"] = "Tritaossa"
private.L.NPCs["50804"] = "Alalacera"
private.L.NPCs["50805"] = "Omnis Grinlok"
private.L.NPCs["50806"] = "Moldo il Guercio"
private.L.NPCs["50807"] = "Catal"
private.L.NPCs["50808"] = "Urobi il Camminatore"
private.L.NPCs["50809"] = "Heress"
private.L.NPCs["50810"] = "Favorito di Isiset"
private.L.NPCs["50811"] = "Nasra Manto Maculato"
private.L.NPCs["50812"] = "Arae"
private.L.NPCs["50813"] = "Fene-Mal"
private.L.NPCs["50814"] = "Mangiacarogne"
private.L.NPCs["50815"] = "Skarr"
private.L.NPCs["50816"] = "Ruun Zampa Chiara"
private.L.NPCs["50817"] = "Ahone la Nomade"
private.L.NPCs["50818"] = "Predatore Oscuro"
private.L.NPCs["50819"] = "Gelartiglio"
private.L.NPCs["50820"] = "Yul Zampa Furente"
private.L.NPCs["50821"] = "Ai-Li Specchio Celeste"
private.L.NPCs["50822"] = "Ai-Ran Nube Mutevole"
private.L.NPCs["50823"] = "Signor Feroce"
private.L.NPCs["50825"] = "Feras"
private.L.NPCs["50828"] = "Bonobos"
private.L.NPCs["50830"] = "Spriggin"
private.L.NPCs["50831"] = "Scritch"
private.L.NPCs["50832"] = "L'Urlatore"
private.L.NPCs["50833"] = "Pelovespro"
private.L.NPCs["50836"] = "Iggo-Iggo lo Scaltro"
private.L.NPCs["50837"] = "Kash"
private.L.NPCs["50838"] = "Tabbs"
private.L.NPCs["50839"] = "Segugio Cromato"
private.L.NPCs["50840"] = "Maggiore Nanners"
private.L.NPCs["50842"] = "Magmagan"
private.L.NPCs["50846"] = "Faucischiave"
private.L.NPCs["50855"] = "Jaxx il Rabbioso"
private.L.NPCs["50856"] = "Snark"
private.L.NPCs["50858"] = "Alapolvere"
private.L.NPCs["50864"] = "Thicket"
private.L.NPCs["50865"] = "Saurix"
private.L.NPCs["50874"] = "Tenok"
private.L.NPCs["50875"] = "Nychus"
private.L.NPCs["50876"] = "Avis"
private.L.NPCs["50882"] = "Chupacabros"
private.L.NPCs["50884"] = "Volofosco il Codardo"
private.L.NPCs["50886"] = "Alamarina"
private.L.NPCs["50891"] = "Boros"
private.L.NPCs["50892"] = "Cyn"
private.L.NPCs["50895"] = "Volux"
private.L.NPCs["50897"] = "Ffexk il Calcadune"
private.L.NPCs["50901"] = "Teromak"
private.L.NPCs["50903"] = "Orlix il Signore delle Paludi"
private.L.NPCs["50905"] = "Cida"
private.L.NPCs["50906"] = "Mutilax"
private.L.NPCs["50908"] = "Urlocupo"
private.L.NPCs["50915"] = "Grugno"
private.L.NPCs["50916"] = "Zampazoppa il Gemente"
private.L.NPCs["50922"] = "Warg"
private.L.NPCs["50925"] = "Zampafoglia"
private.L.NPCs["50926"] = "Ben il Selvaggio"
private.L.NPCs["50929"] = "Piccolo Bjorn"
private.L.NPCs["50930"] = "Hibernus il Dormiente"
private.L.NPCs["50931"] = "Mange"
private.L.NPCs["50937"] = "Mantocotto"
private.L.NPCs["50940"] = "Swee"
private.L.NPCs["50942"] = "Snoot il Radicatore"
private.L.NPCs["50945"] = "Scruff"
private.L.NPCs["50946"] = "Hogzilla"
private.L.NPCs["50947"] = "Varah"
private.L.NPCs["50948"] = "Codalucente"
private.L.NPCs["50949"] = "Scommessa di Finn"
private.L.NPCs["50952"] = "Jim Cirripede"
private.L.NPCs["50955"] = "Carcinak"
private.L.NPCs["50957"] = "Chelagrande"
private.L.NPCs["50959"] = "Karkin"
private.L.NPCs["50964"] = "Chops"
private.L.NPCs["50967"] = "Craw il Devastatore"
private.L.NPCs["50986"] = "Pelodoro"
private.L.NPCs["50993"] = "Gal'dorak"
private.L.NPCs["50995"] = "Buttafuori"
private.L.NPCs["50997"] = "Bornak il Sanguinario"
private.L.NPCs["51000"] = "Guscionero l'Impenetrabile"
private.L.NPCs["51001"] = "Malagrinfia"
private.L.NPCs["51002"] = "Scorpoxx"
private.L.NPCs["51004"] = "Toxx"
private.L.NPCs["51007"] = "Serkett"
private.L.NPCs["51008"] = "Orrore Spinoso"
private.L.NPCs["51010"] = "Snips"
private.L.NPCs["51014"] = "Terrapis"
private.L.NPCs["51017"] = "Gezan"
private.L.NPCs["51018"] = "Zormus"
private.L.NPCs["51021"] = "Vorticus"
private.L.NPCs["51022"] = "Chordix"
private.L.NPCs["51025"] = "Dilennaa"
private.L.NPCs["51026"] = "Gnath"
private.L.NPCs["51027"] = "Spirocula"
private.L.NPCs["51028"] = "Perforatore Oscuro"
private.L.NPCs["51029"] = "Parasitus"
private.L.NPCs["51031"] = "Braccatore"
private.L.NPCs["51037"] = "Cane da Guerra di Gilneas Perduto"
private.L.NPCs["51040"] = "Fiuty"
private.L.NPCs["51042"] = "Cuorcupo"
private.L.NPCs["51044"] = "Piaga"
private.L.NPCs["51045"] = "Arcanus"
private.L.NPCs["51046"] = "Fidonis"
private.L.NPCs["51048"] = "Rexxus"
private.L.NPCs["51052"] = "Gib l'Incetta-Banane"
private.L.NPCs["51053"] = "Quirix"
private.L.NPCs["51057"] = "Weevil"
private.L.NPCs["51058"] = "Aphis"
private.L.NPCs["51059"] = "Zoccolo Nero"
private.L.NPCs["51061"] = "Roth-Salam"
private.L.NPCs["51062"] = "Khep-Re"
private.L.NPCs["51063"] = "Falanax"
private.L.NPCs["51066"] = "Unghialucente"
private.L.NPCs["51067"] = "Glint"
private.L.NPCs["51069"] = "Scintillex"
private.L.NPCs["51071"] = "Capitano Florence"
private.L.NPCs["51076"] = "Lopex"
private.L.NPCs["51077"] = "Codapruna"
private.L.NPCs["51078"] = "Ferdinand"
private.L.NPCs["51079"] = "Capitano Ventosudicio"
private.L.NPCs["51401"] = "Madexx"
private.L.NPCs["51402"] = "Madexx"
private.L.NPCs["51403"] = "Madexx"
private.L.NPCs["51404"] = "Madexx"
private.L.NPCs["51658"] = "Mogh il Morto"
private.L.NPCs["51661"] = "Tsul'Kalu"
private.L.NPCs["51662"] = "Mahamba"
private.L.NPCs["51663"] = "Pogeyan"
private.L.NPCs["519"] = "Slark"
private.L.NPCs["520"] = "Brack"
private.L.NPCs["521"] = "Lupos"
private.L.NPCs["52146"] = "Gricchio"
private.L.NPCs["534"] = "Nefaru"
private.L.NPCs["5343"] = "Dama Szallah"
private.L.NPCs["5345"] = "Testa di Diamante"
private.L.NPCs["5346"] = "Urlorosso l'Inseguitore"
private.L.NPCs["5347"] = "Antilus il Planante"
private.L.NPCs["5348"] = "Guardasogni Forcalingua"
private.L.NPCs["5349"] = "Arash-ethis"
private.L.NPCs["5350"] = "Qirot"
private.L.NPCs["5352"] = "Vecchio Sventracorpi"
private.L.NPCs["5354"] = "Gnarl Fratelfoglia"
private.L.NPCs["5356"] = "Ringhiatore"
private.L.NPCs["54318"] = "Ankha"
private.L.NPCs["54319"] = "Magria"
private.L.NPCs["54320"] = "Ban'thalos"
private.L.NPCs["54321"] = "Solix"
private.L.NPCs["54322"] = "Deth'tilac"
private.L.NPCs["54323"] = "Kirix"
private.L.NPCs["54324"] = "Balzafiamme"
private.L.NPCs["54338"] = "Anthriss"
private.L.NPCs["54533"] = "Principe Lakma"
private.L.NPCs["56081"] = "Benj l'Ottimista"
private.L.NPCs["572"] = "Leprithus"
private.L.NPCs["573"] = "Mietinemici 4000"
private.L.NPCs["574"] = "Naraxis"
private.L.NPCs["5785"] = "Sorella Sferzaodio"
private.L.NPCs["5786"] = "Lanciacurva"
private.L.NPCs["5787"] = "Scagnozzo di Emilgund"
private.L.NPCs["5807"] = "Graffio"
private.L.NPCs["5809"] = "Sergente Curtis"
private.L.NPCs["5822"] = "Vilmistico Scornn"
private.L.NPCs["5823"] = "Scorticatore della Morte"
private.L.NPCs["5824"] = "Capitano Zannapiatta"
private.L.NPCs["5826"] = "Geosignore Mottle"
private.L.NPCs["5828"] = "Humar il Nerobranco"
private.L.NPCs["5829"] = "Grugno lo Straziante"
private.L.NPCs["5830"] = "Sorella Rathtalon"
private.L.NPCs["5831"] = "Mantolesto"
private.L.NPCs["5832"] = "Zoccolo Tonante"
private.L.NPCs["58336"] = "Coniglio di Lunacupa"
private.L.NPCs["5834"] = "Azzere la Lama dei Cieli"
private.L.NPCs["5835"] = "Caposquadra Grills"
private.L.NPCs["5836"] = "Ingegnere Filotorto"
private.L.NPCs["5837"] = "Braccioduro"
private.L.NPCs["5838"] = "Spezzalance"
private.L.NPCs["584"] = "Kazon"
private.L.NPCs["5841"] = "Lanciadura"
private.L.NPCs["5842"] = "Takk il Saltatore"
private.L.NPCs["5847"] = "Heggin Baffoduro"
private.L.NPCs["58474"] = "Morsocruento"
private.L.NPCs["5848"] = "Malgin Maltorzo"
private.L.NPCs["5849"] = "Scavatore Forgiafiamma"
private.L.NPCs["5851"] = "Capitano Gerogg Mazzadito"
private.L.NPCs["5859"] = "Hagg Cacciatauren"
private.L.NPCs["5863"] = "Geosacerdote Gukk'rok"
private.L.NPCs["5864"] = "Porcaro Celalance"
private.L.NPCs["5865"] = "Dishu"
private.L.NPCs["58768"] = "Zannafosca"
private.L.NPCs["58769"] = "Morsovile"
private.L.NPCs["58771"] = "Quid"
private.L.NPCs["58778"] = "Aetha"
private.L.NPCs["58817"] = "Spirito di Lao-Fe"
private.L.NPCs["58949"] = "Bai-Jin il Macellaio"
private.L.NPCs["5912"] = "Drago Fatato Degenere"
private.L.NPCs["5915"] = "Fratello Quercianera"
private.L.NPCs["5928"] = "Ala del Cordoglio"
private.L.NPCs["5930"] = "Sorella Riven"
-- private.L.NPCs["5932"] = "Taskmaster Whipfang"
private.L.NPCs["5933"] = "Achellios l'Esiliato"
private.L.NPCs["5935"] = "Occhioferro l'Invincibile"
private.L.NPCs["59369"] = "Dottor Theolen Krastinov"
private.L.NPCs["5937"] = "Vilaculeo"
private.L.NPCs["596"] = "Nobile Condizionato"
private.L.NPCs["599"] = "Marisa du'Paige"
private.L.NPCs["60491"] = "Sha della Rabbia"
private.L.NPCs["61"] = "Thuros Ditaleste"
private.L.NPCs["6118"] = "Spettro di Varo'then"
private.L.NPCs["616"] = "Gracchio"
private.L.NPCs["62"] = "Gug Ceragrassa"
private.L.NPCs["6228"] = "Ambasciatore Ferroscuro"
private.L.NPCs["62346"] = "Galeone"
private.L.NPCs["62880"] = "Gochao l'Impavido"
private.L.NPCs["62881"] = "Gaohun il Tranciaspiriti"
private.L.NPCs["63101"] = "Generale Temuja"
private.L.NPCs["63240"] = "Maestro delle Ombre Sydow"
private.L.NPCs["63510"] = "Wulon"
private.L.NPCs["63691"] = "Huo-Shuang"
private.L.NPCs["63695"] = "Baolai l'Immolatore"
private.L.NPCs["63977"] = "Vyraxxis"
private.L.NPCs["63978"] = "Kri'chon"
private.L.NPCs["64403"] = "Alani"
private.L.NPCs["6581"] = "Devasauro Matriarca"
private.L.NPCs["6582"] = "Madre del Covo Zavas"
private.L.NPCs["6583"] = "Gruff"
private.L.NPCs["6584"] = "Re Mosh"
private.L.NPCs["6585"] = "Uhk'loc"
private.L.NPCs["6648"] = "Antilos"
private.L.NPCs["6649"] = "Dama Sesspira"
-- private.L.NPCs["6650"] = "General Fangferror"
private.L.NPCs["6651"] = "Custode del Portale Gridoatroce"
private.L.NPCs["68317"] = "Mavis Harms"
private.L.NPCs["68318"] = "Dalan Spezzanotte"
private.L.NPCs["68319"] = "Disha Domapaura"
private.L.NPCs["68320"] = "Ubunti l'Ombra"
private.L.NPCs["68321"] = "Kar Plasmaguerra"
private.L.NPCs["68322"] = "Muerta"
private.L.NPCs["69099"] = "Nalak"
private.L.NPCs["69664"] = "Mumta"
private.L.NPCs["69768"] = "Esploratore da Guerra Zandalari"
private.L.NPCs["69769"] = "Araldo della Guerra Zandalari"
private.L.NPCs["69841"] = "Araldo della Guerra Zandalari"
private.L.NPCs["69842"] = "Araldo della Guerra Zandalari"
private.L.NPCs["69843"] = "Zao'cho"
private.L.NPCs["69996"] = "Ku'lai l'Artiglio Celeste"
private.L.NPCs["69997"] = "Progenitus"
private.L.NPCs["69998"] = "Goda"
private.L.NPCs["69999"] = "Colosso Divino Ramuk"
private.L.NPCs["70000"] = "Al'tabim l'Onnisciente"
private.L.NPCs["70001"] = "Spaccaschiena Uru"
private.L.NPCs["70002"] = "Lu-Ban"
private.L.NPCs["70003"] = "Molthor"
private.L.NPCs["70096"] = "Dio della Guerra Dokah"
private.L.NPCs["70126"] = "Willy Wilder"
private.L.NPCs["7015"] = "Schifidor il Crudele"
private.L.NPCs["7016"] = "Dama Vespira"
private.L.NPCs["7017"] = "Sire Cacciacolpa"
-- private.L.NPCs["70238"] = "Unblinking Eye"
-- private.L.NPCs["70243"] = "Archritualist Kelada"
-- private.L.NPCs["70249"] = "Focused Eye"
private.L.NPCs["70276"] = "Oratore delle Tempeste No'ku"
private.L.NPCs["70323"] = "Krakkanon"
private.L.NPCs["70430"] = "Orrore Roccioso"
private.L.NPCs["70440"] = "Monara"
private.L.NPCs["70530"] = "Ra'sha"
private.L.NPCs["7104"] = "Dessecus"
private.L.NPCs["7137"] = "Immolatus"
private.L.NPCs["71864"] = "Cavernoculus"
private.L.NPCs["71919"] = "Zhu-Gon l'Acre"
private.L.NPCs["71992"] = "Zannastrale"
private.L.NPCs["72045"] = "Chelon"
private.L.NPCs["72048"] = "Scricchiaossa"
private.L.NPCs["72049"] = "Squartagru"
private.L.NPCs["72193"] = "Karkanos"
private.L.NPCs["72245"] = "Zesqua"
private.L.NPCs["72769"] = "Spirito di Giadafulgida"
private.L.NPCs["72775"] = "Bufo"
private.L.NPCs["72808"] = "Tsavo'ka"
private.L.NPCs["72909"] = "Gu'chi il Portatore dello Sciame"
private.L.NPCs["72970"] = "Golganarr"
private.L.NPCs["73157"] = "Guardingo Muschioso"
private.L.NPCs["73158"] = "Gru di Smeraldo"
private.L.NPCs["73160"] = "Yak Cornoferreo"
private.L.NPCs["73161"] = "Grande Tartaruga Ardiguscio"
private.L.NPCs["73163"] = "Pitone Imperiale"
private.L.NPCs["73166"] = "Spinartiglio Mostruoso"
private.L.NPCs["73167"] = "Huolon"
private.L.NPCs["73169"] = "Jakur degli Ordon"
private.L.NPCs["73170"] = "Guardiano Osu"
private.L.NPCs["73171"] = "Campione della Fiamma Nera"
private.L.NPCs["73172"] = "Signore della Fornace Gairan"
private.L.NPCs["73173"] = "Urdur il Cauterizzatore"
private.L.NPCs["73174"] = "Gran Sacerdote delle Fiamme"
private.L.NPCs["73175"] = "Calcacenere"
private.L.NPCs["73277"] = "Sanafoglia"
private.L.NPCs["73279"] = "Faucieterne"
private.L.NPCs["73281"] = "Nave Fantasma Vazuvius"
private.L.NPCs["73282"] = "Garnia"
private.L.NPCs["73293"] = "Whizzig"
private.L.NPCs["73666"] = "Gran Sacerdote delle Fiamme"
private.L.NPCs["73704"] = "Treccialorda"
private.L.NPCs["763"] = "Perduto Capo Tribù"
private.L.NPCs["7846"] = "Teremus il Divoratore"
private.L.NPCs["79"] = "Narg il Coordinatore"
private.L.NPCs["8199"] = "Gran Condottiero Krazzilak"
private.L.NPCs["8200"] = "Jin'zallah lo Spargisabbia"
private.L.NPCs["8201"] = "Omgorn il Perduto"
private.L.NPCs["8203"] = "Kregg Borbotto"
private.L.NPCs["8204"] = "Soriid il Divoratore"
private.L.NPCs["8205"] = "Haarka il Vorace"
private.L.NPCs["8207"] = "Alardente"
private.L.NPCs["8210"] = "Piumafulgida"
private.L.NPCs["8211"] = "Saltacolli Anziano"
private.L.NPCs["8212"] = "Tanfo"
private.L.NPCs["8213"] = "Guscioferro"
private.L.NPCs["8214"] = "Jalinde Dracocaldo"
private.L.NPCs["8215"] = "Grimungous"
private.L.NPCs["8216"] = "Retherokk il Berserker"
private.L.NPCs["8217"] = "Mith'rethis l'Incantatore"
-- private.L.NPCs["8218"] = "Witherheart the Stalker"
private.L.NPCs["8219"] = "Zul'arek Cacciacollera"
private.L.NPCs["8277"] = "Rekk'tilac"
private.L.NPCs["8278"] = "Smoldar"
private.L.NPCs["8279"] = "Golem da Guerra Malfunzionante"
-- private.L.NPCs["8280"] = "Shleipnarr"
private.L.NPCs["8281"] = "Scald"
private.L.NPCs["8282"] = "Gran Signore Mastrogonde"
private.L.NPCs["8283"] = "Maestro degli Schiavi Cuornero"
private.L.NPCs["8296"] = "Mojo il Contorto"
private.L.NPCs["8297"] = "Magronos l'Inflessibile"
private.L.NPCs["8298"] = "Akubar il Veggente"
private.L.NPCs["8299"] = "Scorticarabbia"
private.L.NPCs["8300"] = "Devasto"
private.L.NPCs["8301"] = "Clack il Razziatore"
private.L.NPCs["8302"] = "Occhionero"
private.L.NPCs["8303"] = "Grunter"
private.L.NPCs["8304"] = "Maloscherno"
private.L.NPCs["8503"] = "Verdegnomo"
private.L.NPCs["8660"] = "Evalcharr"
private.L.NPCs["8923"] = "Panzor l'Invincibile"
private.L.NPCs["8924"] = "Behemoth"
private.L.NPCs["8976"] = "Hematos"
private.L.NPCs["8978"] = "Thauris Balgarr"
private.L.NPCs["8979"] = "Gruklash"
private.L.NPCs["8981"] = "Razziatore Malfunzionante"
private.L.NPCs["9217"] = "Signore dei Magus Spiraroccia"
private.L.NPCs["9218"] = "Signore della Battaglia Spiraroccia"
private.L.NPCs["9219"] = "Macellaio Spiraroccia"
private.L.NPCs["947"] = "Rohh il Silente"
private.L.NPCs["9596"] = "Bannok Asciatetra"
private.L.NPCs["9602"] = "Hahk'Zor"
private.L.NPCs["9604"] = "Gorgon'och"
private.L.NPCs["9718"] = "Ghok Granbastone"
private.L.NPCs["9736"] = "Quartermastro Zigris"
private.L.NPCs["99"] = "Morgaine la Furba"

private.L["BUTTON_TOOLTIP_LINE1"] = "|cffffee00 _NPCScan.Overlay|r"
private.L["BUTTON_TOOLTIP_LINE2"] = "|cffd6ff00 Clic: |r Attiva Percorsi Mappa del Mondo" -- Needs review
private.L["BUTTON_TOOLTIP_LINE3"] = "|cffd6ff00 Shift+Clic: |r Attiva Chiave Mappa del Mondo" -- Needs review
private.L["BUTTON_TOOLTIP_LINE4"] = "|cffd6ff00 Clic Destro: |r Attiva Percorsi Minimappa" -- Needs review
private.L["BUTTON_TOOLTIP_LINE5"] = "|cffaaf200 Clic di Mezzo: |r Attiva visualizzazione sia della minimappa che della Mappa del Mondo" -- Needs review
private.L["BUTTON_TOOLTIP_LINE6"] = "|cff6cff00 Shift+Clic di Mezzo:: |r Apre Menu Opzioni" -- Needs review
private.L["CONFIG_ALPHA"] = "Alfa"
private.L["CONFIG_COLORLIST_INST"] = "Clicca sul titolo del mostro per sceglierne il colore."
private.L["CONFIG_COLORLIST_LABEL"] = "Sovrapposizione Tabella Colorata dei Percorsi"
private.L["CONFIG_COLORLIST_PLACEHOLDER"] = "Mostro Chiave "
private.L["CONFIG_DESC"] = "Controlla quali mappe mostreranno la sovrapposizione del percorso del mostro. La maggior parte degli addon che modificano la minimappa si configurano dalle opzioni della Mappa del Mondo."
private.L["CONFIG_LOCKSWAP"] = "Inverti Controlli del Movimento Chiave Percorsi delle Creature."
private.L["CONFIG_LOCKSWAP_DESC"] = "Imposta lo spostamento della Chiave Percorsi delle Creature quando posrti sopra il mouse e premi <Shift> per impedirne lo spostamento accidentale."
private.L["CONFIG_SETCOLOR"] = "Imposta Colori Percorso"
private.L["CONFIG_SETCOLOR_DESC"] = "Clicca per impostare la chiave per la Mappa e i Colori dei PErcorsi."
private.L["CONFIG_SHOWALL"] = "Mostra sempre tutti i percorsi"
private.L["CONFIG_SHOWALL_DESC"] = "In genere, quando un mostro non viene cercato, il suo percorso non viene mostrato sulla mappa. Attivare questa opzione per mostrare sempre il percorso conosciuto in ogni situazione."
private.L["CONFIG_SHOWKEY"] = "Mostra Chiave Percorsi delle Creature."
private.L["CONFIG_SHOWKEY_DESC"] = "Attiva la visualizzazione della Chiave Percorsi delle Creature nella mappa del mondo."
private.L["CONFIG_TITLE"] = "Sovrapposizione"
private.L["CONFIG_TITLE_STANDALONE"] = "_|cffCCCC88NPCScan|r.Overlay"
private.L["MODULE_ALPHAMAP3"] = "AddOn AlphaMap3"
private.L["MODULE_BATTLEFIELDMINIMAP"] = "Minimappa del Campo di Battaglia."
private.L["MODULE_MINIMAP"] = "Minimappa"
private.L["MODULE_OMEGAMAP"] = "Addon OmegaMap"
private.L["MODULE_RANGERING_DESC"] = "Nota: il cerchio della distanza appare solo nelle zone dove si possono trovare mostri rari."
private.L["MODULE_RANGERING_FORMAT"] = "Mostra un cerchio di %d metri per approssimare il raggio di ricerca."
private.L["MODULE_WORLDMAP"] = "Mappa del Mondo principale"
private.L["MODULE_WORLDMAP_KEY_FORMAT"] = "• %s"
private.L["MODULE_WORLDMAP_KEYTOGGLE"] = "Attiva Chiave Percorsi delle Creature."
private.L["MODULE_WORLDMAP_KEYTOGGLE_DESC"] = "Attiva Chiave Percorsi."
private.L["MODULE_WORLDMAP_TOGGLE"] = "PNG"
private.L["MODULE_WORLDMAP_TOGGLE_DESC"] = "Attiva o disattiva il percorso dei PNG su _|cffCCCC88NPCScan|r.Overlay"
