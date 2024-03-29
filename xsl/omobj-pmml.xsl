<?xml version="1.0"?>

<!DOCTYPE xsl:stylesheet [

<!-- $Id: omobj-pmml.xsl 8010 2008-09-07 19:29:43Z kohlhase $ -->
<!-- Initial version by David Carlisle from the OpenMath Core CDs -->
<!-- modified by O. Caprotti                                      -->




<!-- MathML 1.01 entities - Auto-generated (Total in this list: 2157) -->

<!ENTITY Tab "&#x0009;">
<!ENTITY NewLine "&#x000A;">
<!ENTITY excl "&#x0021;">
<!ENTITY quot "&#x0022;">
<!ENTITY num "&#x0023;">
<!ENTITY dollar "&#x0024;">
<!ENTITY percnt "&#x0025;">
<!ENTITY amp "&#x0026;">
<!ENTITY apos "&#x0027;">
<!ENTITY lpar "&#x0028;">
<!ENTITY rpar "&#x0029;">
<!ENTITY ast "&#x002A;"> <!ENTITY midast "&#x002A;">
<!ENTITY plus "&#x002B;">
<!ENTITY comma "&#x002C;">
<!ENTITY period "&#x002E;">
<!ENTITY sol "&#x002F;">
<!ENTITY colon "&#x003A;">
<!ENTITY semi "&#x003B;">
<!ENTITY lt "&#x003C;">
<!ENTITY equals "&#x003D;">
<!ENTITY gt "&#x003E;">
<!ENTITY quest "&#x003F;">
<!ENTITY commat "&#x0040;">
<!ENTITY lbrack "&#x005B;"> <!ENTITY lsqb "&#x005B;">
<!ENTITY bsol "&#x005C;">
<!ENTITY rbrack "&#x005D;"> <!ENTITY rsqb "&#x005D;">
<!ENTITY circ "&#x005E;">
<!ENTITY lowbar "&#x005F;">
<!ENTITY DiacriticalGrave "&#x0060;"> <!ENTITY grave "&#x0060;">
<!ENTITY lbrace "&#x007B;"> <!ENTITY lcub "&#x007B;">
<!ENTITY verbar "&#x007C;"> <!ENTITY vert "&#x007C;">
<!ENTITY rbrace "&#x007D;"> <!ENTITY rcub "&#x007D;">
<!ENTITY nbsp "&#x00A0;">
<!ENTITY iexcl "&#x00A1;">
<!ENTITY cent "&#x00A2;">
<!ENTITY pound "&#x00A3;">
<!ENTITY curren "&#x00A4;">
<!ENTITY yen "&#x00A5;">
<!ENTITY brvbar "&#x00A6;">
<!ENTITY sect "&#x00A7;">
<!ENTITY die "&#x00A8;"> <!ENTITY Dot "&#x00A8;"> <!ENTITY DoubleDot "&#x00A8;"> <!ENTITY uml "&#x00A8;">
<!ENTITY copy "&#x00A9;">
<!ENTITY ordf "&#x00AA;">
<!ENTITY laquo "&#x00AB;">
<!ENTITY not "&#x00AC;">
<!ENTITY shy "&#x00AD;">
<!ENTITY circledR "&#x00AE;"> <!ENTITY reg "&#x00AE;">
<!ENTITY macr "&#x00AF;"> <!ENTITY OverBar "&#x00AF;">
<!ENTITY deg "&#x00B0;">
<!ENTITY PlusMinus "&#x00B1;"> <!ENTITY plusmn "&#x00B1;"> <!ENTITY pm "&#x00B1;">
<!ENTITY sup2 "&#x00B2;">
<!ENTITY sup3 "&#x00B3;">
<!ENTITY acute "&#x00B4;"> <!ENTITY DiacriticalAcute "&#x00B4;">
<!ENTITY micro "&#x00B5;">
<!ENTITY para "&#x00B6;">
<!ENTITY CenterDot "&#x00B7;"> <!ENTITY centerdot "&#x00B7;"> <!ENTITY middot "&#x00B7;">
<!ENTITY cedil "&#x00B8;"> <!ENTITY Cedilla "&#x00B8;">
<!ENTITY sup1 "&#x00B9;">
<!ENTITY ordm "&#x00BA;">
<!ENTITY raquo "&#x00BB;">
<!ENTITY frac14 "&#x00BC;">
<!ENTITY frac12 "&#x00BD;"> <!ENTITY half "&#x00BD;">
<!ENTITY frac34 "&#x00BE;">
<!ENTITY iquest "&#x00BF;">
<!ENTITY Agrave "&#x00C0;">
<!ENTITY Aacute "&#x00C1;">
<!ENTITY Acirc "&#x00C2;">
<!ENTITY Atilde "&#x00C3;">
<!ENTITY Auml "&#x00C4;">
<!ENTITY Aring "&#x00C5;">
<!ENTITY AElig "&#x00C6;">
<!ENTITY Ccedil "&#x00C7;">
<!ENTITY Egrave "&#x00C8;">
<!ENTITY Eacute "&#x00C9;">
<!ENTITY Ecirc "&#x00CA;">
<!ENTITY Euml "&#x00CB;">
<!ENTITY Igrave "&#x00CC;">
<!ENTITY Iacute "&#x00CD;">
<!ENTITY Icirc "&#x00CE;">
<!ENTITY Iuml "&#x00CF;">
<!ENTITY ETH "&#x00D0;">
<!ENTITY Ntilde "&#x00D1;">
<!ENTITY Ograve "&#x00D2;">
<!ENTITY Oacute "&#x00D3;">
<!ENTITY Ocirc "&#x00D4;">
<!ENTITY Otilde "&#x00D5;">
<!ENTITY Ouml "&#x00D6;">
<!ENTITY times "&#x00D7;">
<!ENTITY Oslash "&#x00D8;">
<!ENTITY Ugrave "&#x00D9;">
<!ENTITY Uacute "&#x00DA;">
<!ENTITY Ucirc "&#x00DB;">
<!ENTITY Uuml "&#x00DC;">
<!ENTITY Yacute "&#x00DD;">
<!ENTITY THORN "&#x00DE;">
<!ENTITY szlig "&#x00DF;">
<!ENTITY agrave "&#x00E0;">
<!ENTITY aacute "&#x00E1;">
<!ENTITY acirc "&#x00E2;">
<!ENTITY atilde "&#x00E3;">
<!ENTITY auml "&#x00E4;">
<!ENTITY aring "&#x00E5;">
<!ENTITY aelig "&#x00E6;">
<!ENTITY ccedil "&#x00E7;">
<!ENTITY egrave "&#x00E8;">
<!ENTITY eacute "&#x00E9;">
<!ENTITY ecirc "&#x00EA;">
<!ENTITY euml "&#x00EB;">
<!ENTITY igrave "&#x00EC;">
<!ENTITY iacute "&#x00ED;">
<!ENTITY icirc "&#x00EE;">
<!ENTITY iuml "&#x00EF;">
<!ENTITY eth "&#x00F0;">
<!ENTITY ntilde "&#x00F1;">
<!ENTITY ograve "&#x00F2;">
<!ENTITY oacute "&#x00F3;">
<!ENTITY ocirc "&#x00F4;">
<!ENTITY otilde "&#x00F5;">
<!ENTITY ouml "&#x00F6;">
<!ENTITY div "&#x00F7;"> <!ENTITY divide "&#x00F7;">
<!ENTITY oslash "&#x00F8;">
<!ENTITY ugrave "&#x00F9;">
<!ENTITY uacute "&#x00FA;">
<!ENTITY ucirc "&#x00FB;">
<!ENTITY uuml "&#x00FC;">
<!ENTITY yacute "&#x00FD;">
<!ENTITY thorn "&#x00FE;">
<!ENTITY yuml "&#x00FF;">
<!ENTITY Amacr "&#x0100;">
<!ENTITY amacr "&#x0101;">
<!ENTITY Abreve "&#x0102;">
<!ENTITY abreve "&#x0103;">
<!ENTITY Aogon "&#x0104;">
<!ENTITY aogon "&#x0105;">
<!ENTITY Cacute "&#x0106;">
<!ENTITY cacute "&#x0107;">
<!ENTITY Ccirc "&#x0108;">
<!ENTITY ccirc "&#x0109;">
<!ENTITY Cdot "&#x010A;">
<!ENTITY cdot "&#x010B;">
<!ENTITY Ccaron "&#x010C;">
<!ENTITY ccaron "&#x010D;">
<!ENTITY Dcaron "&#x010E;">
<!ENTITY dcaron "&#x010F;">
<!ENTITY Dstrok "&#x0110;">
<!ENTITY dstrok "&#x0111;">
<!ENTITY Emacr "&#x0112;">
<!ENTITY emacr "&#x0113;">
<!ENTITY Edot "&#x0116;">
<!ENTITY edot "&#x0117;">
<!ENTITY Eogon "&#x0118;">
<!ENTITY eogon "&#x0119;">
<!ENTITY Ecaron "&#x011A;">
<!ENTITY ecaron "&#x011B;">
<!ENTITY Gcirc "&#x011C;">
<!ENTITY gcirc "&#x011D;">
<!ENTITY Gbreve "&#x011E;">
<!ENTITY gbreve "&#x011F;">
<!ENTITY Gdot "&#x0120;">
<!ENTITY gdot "&#x0121;">
<!ENTITY Gcedil "&#x0122;">
<!ENTITY Hcirc "&#x0124;">
<!ENTITY hcirc "&#x0125;">
<!ENTITY Hstrok "&#x0126;">
<!ENTITY hstrok "&#x0127;">
<!ENTITY Itilde "&#x0128;">
<!ENTITY itilde "&#x0129;">
<!ENTITY Imacr "&#x012A;">
<!ENTITY imacr "&#x012B;">
<!ENTITY Iogon "&#x012E;">
<!ENTITY iogon "&#x012F;">
<!ENTITY Idot "&#x0130;">
<!ENTITY imath "&#x0131;"> <!ENTITY inodot "&#x0131;">
<!ENTITY IJlig "&#x0132;">
<!ENTITY ijlig "&#x0133;">
<!ENTITY Jcirc "&#x0134;">
<!ENTITY jcirc "&#x0135;">
<!ENTITY Kcedil "&#x0136;">
<!ENTITY kcedil "&#x0137;">
<!ENTITY kgreen "&#x0138;">
<!ENTITY Lacute "&#x0139;">
<!ENTITY lacute "&#x013A;">
<!ENTITY Lcedil "&#x013B;">
<!ENTITY lcedil "&#x013C;">
<!ENTITY Lcaron "&#x013D;">
<!ENTITY lcaron "&#x013E;">
<!ENTITY Lmidot "&#x013F;">
<!ENTITY lmidot "&#x0140;">
<!ENTITY Lstrok "&#x0141;">
<!ENTITY lstrok "&#x0142;">
<!ENTITY Nacute "&#x0143;">
<!ENTITY nacute "&#x0144;">
<!ENTITY Ncedil "&#x0145;">
<!ENTITY ncedil "&#x0146;">
<!ENTITY Ncaron "&#x0147;">
<!ENTITY ncaron "&#x0148;">
<!ENTITY napos "&#x0149;">
<!ENTITY ENG "&#x014A;">
<!ENTITY eng "&#x014B;">
<!ENTITY Omacr "&#x014C;">
<!ENTITY omacr "&#x014D;">
<!ENTITY Odblac "&#x0150;">
<!ENTITY odblac "&#x0151;">
<!ENTITY OElig "&#x0152;">
<!ENTITY oelig "&#x0153;">
<!ENTITY Racute "&#x0154;">
<!ENTITY racute "&#x0155;">
<!ENTITY Rcedil "&#x0156;">
<!ENTITY rcedil "&#x0157;">
<!ENTITY Rcaron "&#x0158;">
<!ENTITY rcaron "&#x0159;">
<!ENTITY Sacute "&#x015A;">
<!ENTITY sacute "&#x015B;">
<!ENTITY Scirc "&#x015C;">
<!ENTITY scirc "&#x015D;">
<!ENTITY Scedil "&#x015E;">
<!ENTITY scedil "&#x015F;">
<!ENTITY Scaron "&#x0160;">
<!ENTITY scaron "&#x0161;">
<!ENTITY Tcedil "&#x0162;">
<!ENTITY tcedil "&#x0163;">
<!ENTITY Tcaron "&#x0164;">
<!ENTITY tcaron "&#x0165;">
<!ENTITY Tstrok "&#x0166;">
<!ENTITY tstrok "&#x0167;">
<!ENTITY Utilde "&#x0168;">
<!ENTITY utilde "&#x0169;">
<!ENTITY Umacr "&#x016A;">
<!ENTITY umacr "&#x016B;">
<!ENTITY Ubreve "&#x016C;">
<!ENTITY ubreve "&#x016D;">
<!ENTITY Uring "&#x016E;">
<!ENTITY uring "&#x016F;">
<!ENTITY Udblac "&#x0170;">
<!ENTITY udblac "&#x0171;">
<!ENTITY Uogon "&#x0172;">
<!ENTITY uogon "&#x0173;">
<!ENTITY Wcirc "&#x0174;">
<!ENTITY wcirc "&#x0175;">
<!ENTITY Ycirc "&#x0176;">
<!ENTITY ycirc "&#x0177;">
<!ENTITY Yuml "&#x0178;">
<!ENTITY Zacute "&#x0179;">
<!ENTITY zacute "&#x017A;">
<!ENTITY Zdot "&#x017B;">
<!ENTITY zdot "&#x017C;">
<!ENTITY Zcaron "&#x017D;">
<!ENTITY zcaron "&#x017E;">
<!ENTITY fnof "&#x0192;">
<!ENTITY gacute "&#x01F5;">
<!ENTITY epsiv "&#x025B;"> <!ENTITY varepsilon "&#x025B;">
<!ENTITY caron "&#x02C7;"> <!ENTITY Hacek "&#x02C7;">
<!ENTITY Breve "&#x02D8;"> <!ENTITY breve "&#x02D8;">
<!ENTITY DiacriticalDot "&#x02D9;"> <!ENTITY dot "&#x02D9;">
<!ENTITY ring "&#x02DA;">
<!ENTITY ogon "&#x02DB;">
<!ENTITY DiacriticalTilde "&#x02DC;"> <!ENTITY tilde "&#x02DC;">
<!ENTITY dblac "&#x02DD;"> <!ENTITY DiacriticalDoubleAcute "&#x02DD;">
<!ENTITY Hat "&#x0302;">
<!ENTITY DownBreve "&#x0311;">
<!ENTITY UnderBar "&#x0332;">
<!ENTITY Aacgr "&#x0386;">
<!ENTITY Eacgr "&#x0388;">
<!ENTITY EEacgr "&#x0389;">
<!ENTITY Iacgr "&#x038A;">
<!ENTITY Oacgr "&#x038C;">
<!ENTITY Uacgr "&#x038E;">
<!ENTITY OHacgr "&#x038F;">
<!ENTITY idiagr "&#x0390;">
<!ENTITY Agr "&#x0391;">
<!ENTITY Bgr "&#x0392;">
<!ENTITY Gamma "&#x0393;"> <!ENTITY Ggr "&#x0393;">
<!ENTITY Delta "&#x0394;"> <!ENTITY Dgr "&#x0394;">
<!ENTITY Egr "&#x0395;">
<!ENTITY Zgr "&#x0396;">
<!ENTITY EEgr "&#x0397;">
<!ENTITY Theta "&#x0398;"> <!ENTITY THgr "&#x0398;">
<!ENTITY Igr "&#x0399;">
<!ENTITY Kgr "&#x039A;">
<!ENTITY Lambda "&#x039B;"> <!ENTITY Lgr "&#x039B;">
<!ENTITY Mgr "&#x039C;">
<!ENTITY Ngr "&#x039D;">
<!ENTITY Xgr "&#x039E;"> <!ENTITY Xi "&#x039E;">
<!ENTITY Ogr "&#x039F;">
<!ENTITY Pgr "&#x03A0;"> <!ENTITY Pi "&#x03A0;">
<!ENTITY Rgr "&#x03A1;">
<!ENTITY Sgr "&#x03A3;"> <!ENTITY Sigma "&#x03A3;">
<!ENTITY Tgr "&#x03A4;">
<!ENTITY Ugr "&#x03A5;">
<!ENTITY PHgr "&#x03A6;"> <!ENTITY Phi "&#x03A6;">
<!ENTITY KHgr "&#x03A7;">
<!ENTITY PSgr "&#x03A8;"> <!ENTITY Psi "&#x03A8;">
<!ENTITY OHgr "&#x03A9;"> <!ENTITY Omega "&#x03A9;">
<!ENTITY Idigr "&#x03AA;">
<!ENTITY Udigr "&#x03AB;">
<!ENTITY aacgr "&#x03AC;">
<!ENTITY eacgr "&#x03AD;">
<!ENTITY eeacgr "&#x03AE;">
<!ENTITY iacgr "&#x03AF;">
<!ENTITY udiagr "&#x03B0;">
<!ENTITY agr "&#x03B1;"> <!ENTITY alpha "&#x03B1;">
<!ENTITY beta "&#x03B2;"> <!ENTITY bgr "&#x03B2;">
<!ENTITY gamma "&#x03B3;"> <!ENTITY ggr "&#x03B3;">
<!ENTITY delta "&#x03B4;"> <!ENTITY dgr "&#x03B4;">
<!ENTITY egr "&#x03B5;"> <!ENTITY epsi "&#x03B5;"> <!ENTITY straightepsilon "&#x03B5;">
<!ENTITY zeta "&#x03B6;"> <!ENTITY zgr "&#x03B6;">
<!ENTITY eegr "&#x03B7;"> <!ENTITY eta "&#x03B7;">
<!ENTITY theta "&#x03B8;"> <!ENTITY thgr "&#x03B8;">
<!ENTITY igr "&#x03B9;"> <!ENTITY iota "&#x03B9;">
<!ENTITY kappa "&#x03BA;"> <!ENTITY kgr "&#x03BA;">
<!ENTITY lambda "&#x03BB;"> <!ENTITY lgr "&#x03BB;">
<!ENTITY mgr "&#x03BC;"> <!ENTITY mu "&#x03BC;">
<!ENTITY ngr "&#x03BD;"> <!ENTITY nu "&#x03BD;">
<!ENTITY xgr "&#x03BE;"> <!ENTITY xi "&#x03BE;">
<!ENTITY ogr "&#x03BF;">
<!ENTITY pgr "&#x03C0;"> <!ENTITY pi "&#x03C0;">
<!ENTITY rgr "&#x03C1;"> <!ENTITY rho "&#x03C1;">
<!ENTITY sfgr "&#x03C2;"> <!ENTITY sigmav "&#x03C2;"> <!ENTITY varsigma "&#x03C2;">
<!ENTITY sgr "&#x03C3;"> <!ENTITY sigma "&#x03C3;">
<!ENTITY tau "&#x03C4;"> <!ENTITY tgr "&#x03C4;">
<!ENTITY ugr "&#x03C5;"> <!ENTITY upsi "&#x03C5;"> <!ENTITY upsilon "&#x03C5;">
<!ENTITY phgr "&#x03C6;"> <!ENTITY phi "&#x03C6;"> <!ENTITY straightphi "&#x03C6;">
<!ENTITY chi "&#x03C7;"> <!ENTITY khgr "&#x03C7;">
<!ENTITY psgr "&#x03C8;"> <!ENTITY psi "&#x03C8;">
<!ENTITY ohgr "&#x03C9;"> <!ENTITY omega "&#x03C9;">
<!ENTITY idigr "&#x03CA;">
<!ENTITY udigr "&#x03CB;">
<!ENTITY oacgr "&#x03CC;">
<!ENTITY uacgr "&#x03CD;">
<!ENTITY ohacgr "&#x03CE;">
<!ENTITY thetav "&#x03D1;"> <!ENTITY vartheta "&#x03D1;">
<!ENTITY Upsi "&#x03D2;"> <!ENTITY Upsilon "&#x03D2;">
<!ENTITY phiv "&#x03D5;"> <!ENTITY varphi "&#x03D5;">
<!ENTITY piv "&#x03D6;"> <!ENTITY varpi "&#x03D6;">
<!ENTITY digamma "&#x03DC;"> <!ENTITY Gammad "&#x03DC;"> <!ENTITY gammad "&#x03DC;">
<!ENTITY kappav "&#x03F0;"> <!ENTITY varkappa "&#x03F0;">
<!ENTITY rhov "&#x03F1;"> <!ENTITY varrho "&#x03F1;">
<!ENTITY IOcy "&#x0401;">
<!ENTITY DJcy "&#x0402;">
<!ENTITY GJcy "&#x0403;">
<!ENTITY Jukcy "&#x0404;">
<!ENTITY DScy "&#x0405;">
<!ENTITY Iukcy "&#x0406;">
<!ENTITY YIcy "&#x0407;">
<!ENTITY Jsercy "&#x0408;">
<!ENTITY LJcy "&#x0409;">
<!ENTITY NJcy "&#x040A;">
<!ENTITY TSHcy "&#x040B;">
<!ENTITY KJcy "&#x040C;">
<!ENTITY Ubrcy "&#x040E;">
<!ENTITY DZcy "&#x040F;">
<!ENTITY Acy "&#x0410;">
<!ENTITY Bcy "&#x0411;">
<!ENTITY Vcy "&#x0412;">
<!ENTITY Gcy "&#x0413;">
<!ENTITY Dcy "&#x0414;">
<!ENTITY IEcy "&#x0415;">
<!ENTITY ZHcy "&#x0416;">
<!ENTITY Zcy "&#x0417;">
<!ENTITY Icy "&#x0418;">
<!ENTITY Jcy "&#x0419;">
<!ENTITY Kcy "&#x041A;">
<!ENTITY Lcy "&#x041B;">
<!ENTITY Mcy "&#x041C;">
<!ENTITY Ncy "&#x041D;">
<!ENTITY Ocy "&#x041E;">
<!ENTITY Pcy "&#x041F;">
<!ENTITY Rcy "&#x0420;">
<!ENTITY Scy "&#x0421;">
<!ENTITY Tcy "&#x0422;">
<!ENTITY Ucy "&#x0423;">
<!ENTITY Fcy "&#x0424;">
<!ENTITY KHcy "&#x0425;">
<!ENTITY TScy "&#x0426;">
<!ENTITY CHcy "&#x0427;">
<!ENTITY SHcy "&#x0428;">
<!ENTITY SHCHcy "&#x0429;">
<!ENTITY HARDcy "&#x042A;">
<!ENTITY Ycy "&#x042B;">
<!ENTITY SOFTcy "&#x042C;">
<!ENTITY Ecy "&#x042D;">
<!ENTITY YUcy "&#x042E;">
<!ENTITY YAcy "&#x042F;">
<!ENTITY acy "&#x0430;">
<!ENTITY bcy "&#x0431;">
<!ENTITY vcy "&#x0432;">
<!ENTITY gcy "&#x0433;">
<!ENTITY dcy "&#x0434;">
<!ENTITY iecy "&#x0435;">
<!ENTITY zhcy "&#x0436;">
<!ENTITY zcy "&#x0437;">
<!ENTITY icy "&#x0438;">
<!ENTITY jcy "&#x0439;">
<!ENTITY kcy "&#x043A;">
<!ENTITY lcy "&#x043B;">
<!ENTITY mcy "&#x043C;">
<!ENTITY ncy "&#x043D;">
<!ENTITY ocy "&#x043E;">
<!ENTITY pcy "&#x043F;">
<!ENTITY rcy "&#x0440;">
<!ENTITY scy "&#x0441;">
<!ENTITY tcy "&#x0442;">
<!ENTITY ucy "&#x0443;">
<!ENTITY fcy "&#x0444;">
<!ENTITY khcy "&#x0445;">
<!ENTITY tscy "&#x0446;">
<!ENTITY chcy "&#x0447;">
<!ENTITY shcy "&#x0448;">
<!ENTITY shchcy "&#x0449;">
<!ENTITY hardcy "&#x044A;">
<!ENTITY ycy "&#x044B;">
<!ENTITY softcy "&#x044C;">
<!ENTITY ecy "&#x044D;">
<!ENTITY yucy "&#x044E;">
<!ENTITY yacy "&#x044F;">
<!ENTITY iocy "&#x0451;">
<!ENTITY djcy "&#x0452;">
<!ENTITY gjcy "&#x0453;">
<!ENTITY jukcy "&#x0454;">
<!ENTITY dscy "&#x0455;">
<!ENTITY iukcy "&#x0456;">
<!ENTITY yicy "&#x0457;">
<!ENTITY jsercy "&#x0458;">
<!ENTITY ljcy "&#x0459;">
<!ENTITY njcy "&#x045A;">
<!ENTITY tshcy "&#x045B;">
<!ENTITY kjcy "&#x045C;">
<!ENTITY ubrcy "&#x045E;">
<!ENTITY dzcy "&#x045F;">
<!ENTITY ensp "&#x2002;">
<!ENTITY emsp "&#x2003;">
<!ENTITY emsp13 "&#x2004;">
<!ENTITY emsp14 "&#x2005;">
<!ENTITY numsp "&#x2007;">
<!ENTITY puncsp "&#x2008;">
<!ENTITY thinsp "&#x2009;"> <!ENTITY ThinSpace "&#x2009;">
<!ENTITY hairsp "&#x200A;"> <!ENTITY VeryThinSpace "&#x200A;">
<!ENTITY ZeroWidthSpace "&#x200B;">
<!ENTITY dash "&#x2010;"> <!ENTITY hyphen "&#x2010;">
<!ENTITY ndash "&#x2013;">
<!ENTITY mdash "&#x2014;">
<!ENTITY horbar "&#x2015;">
<!ENTITY Verbar "&#x2016;"> <!ENTITY Vert "&#x2016;">
<!ENTITY lsquo "&#x2018;"> <!ENTITY OpenCurlyQuote "&#x2018;">
<!ENTITY CloseCurlyQuote "&#x2019;"> <!ENTITY rsquo "&#x2019;"> <!ENTITY rsquor "&#x2019;">
<!ENTITY lsquor "&#x201A;">
<!ENTITY ldquo "&#x201C;"> <!ENTITY OpenCurlyDoubleQuote "&#x201C;">
<!ENTITY CloseCurlyDoubleQuote "&#x201D;"> <!ENTITY rdquo "&#x201D;"> <!ENTITY rdquor "&#x201D;">
<!ENTITY ldquor "&#x201E;">
<!ENTITY dagger "&#x2020;">
<!ENTITY Dagger "&#x2021;"> <!ENTITY ddagger "&#x2021;">
<!ENTITY bull "&#x2022;"> <!ENTITY bullet "&#x2022;">
<!ENTITY nldr "&#x2025;">
<!ENTITY hellip "&#x2026;"> <!ENTITY mldr "&#x2026;">
<!ENTITY permil "&#x2030;">
<!ENTITY pertenk "&#x2031;">
<!ENTITY prime "&#x2032;">
<!ENTITY Prime "&#x2033;">
<!ENTITY tprime "&#x2034;">
<!ENTITY backprime "&#x2035;"> <!ENTITY bprime "&#x2035;">
<!ENTITY caret "&#x2041;">
<!ENTITY hybull "&#x2043;">
<!ENTITY tdot "&#x20DB;"> <!ENTITY TripleDot "&#x20DB;">
<!ENTITY DotDot "&#x20DC;">
<!ENTITY Copf "&#x2102;">
<!ENTITY incare "&#x2105;">
<!ENTITY hamilt "&#x210B;"> <!ENTITY Hscr "&#x210B;">
<!ENTITY Hfr "&#x210C;">
<!ENTITY hslash "&#x210F;"> <!ENTITY plankv "&#x210F;">
<!ENTITY Iscr "&#x2110;">
<!ENTITY Ifr "&#x2111;"> <!ENTITY Im "&#x2111;"> <!ENTITY image "&#x2111;">
<!ENTITY lagran "&#x2112;"> <!ENTITY Lscr "&#x2112;">
<!ENTITY ell "&#x2113;">
<!ENTITY Nopf "&#x2115;">
<!ENTITY numero "&#x2116;">
<!ENTITY copysr "&#x2117;">
<!ENTITY weierp "&#x2118;"> <!ENTITY wp "&#x2118;">
<!ENTITY Popf "&#x2119;">
<!ENTITY Qopf "&#x211A;">
<!ENTITY Re "&#x211C;"> <!ENTITY real "&#x211C;"> <!ENTITY Rfr "&#x211C;">
<!ENTITY Ropf "&#x211D;">
<!ENTITY rx "&#x211E;">
<!ENTITY trade "&#x2122;">
<!ENTITY Zopf "&#x2124;">
<!ENTITY ohm "&#x2126;">
<!ENTITY mho "&#x2127;">
<!ENTITY iiota "&#x2129;">
<!ENTITY angst "&#x212B;">
<!ENTITY bernou "&#x212C;"> <!ENTITY Bscr "&#x212C;">
<!ENTITY escr "&#x212F;">
<!ENTITY Escr "&#x2130;">
<!ENTITY Fscr "&#x2131;">
<!ENTITY Mscr "&#x2133;"> <!ENTITY phmmat "&#x2133;">
<!ENTITY order "&#x2134;"> <!ENTITY oscr "&#x2134;">
<!ENTITY aleph "&#x2135;">
<!ENTITY beth "&#x2136;">
<!ENTITY gimel "&#x2137;">
<!ENTITY daleth "&#x2138;">
<!ENTITY frac13 "&#x2153;">
<!ENTITY frac23 "&#x2154;">
<!ENTITY frac15 "&#x2155;">
<!ENTITY frac25 "&#x2156;">
<!ENTITY frac35 "&#x2157;">
<!ENTITY frac45 "&#x2158;">
<!ENTITY frac16 "&#x2159;">
<!ENTITY frac56 "&#x215A;">
<!ENTITY frac18 "&#x215B;">
<!ENTITY frac38 "&#x215C;">
<!ENTITY frac58 "&#x215D;">
<!ENTITY frac78 "&#x215E;">
<!ENTITY larr "&#x2190;"> <!ENTITY LeftArrow "&#x2190;"> <!ENTITY leftarrow "&#x2190;">
<!ENTITY uarr "&#x2191;"> <!ENTITY UpArrow "&#x2191;"> <!ENTITY uparrow "&#x2191;">
<!ENTITY rarr "&#x2192;"> <!ENTITY RightArrow "&#x2192;"> <!ENTITY rightarrow "&#x2192;">
<!ENTITY darr "&#x2193;"> <!ENTITY DownArrow "&#x2193;"> <!ENTITY downarrow "&#x2193;">
<!ENTITY harr "&#x2194;"> <!ENTITY LeftRightArrow "&#x2194;"> <!ENTITY leftrightarrow "&#x2194;">
<!ENTITY UpDownArrow "&#x2195;"> <!ENTITY updownarrow "&#x2195;"> <!ENTITY varr "&#x2195;">
<!ENTITY nwarr "&#x2196;"> <!ENTITY nwarrow "&#x2196;"> <!ENTITY UpperLeftArrow "&#x2196;">
<!ENTITY nearr "&#x2197;"> <!ENTITY nearrow "&#x2197;"> <!ENTITY UpperRightArrow "&#x2197;">
<!ENTITY LowerRightArrow "&#x2198;"> <!ENTITY searr "&#x2198;"> <!ENTITY searrow "&#x2198;">
<!ENTITY LowerLeftArrow "&#x2199;"> <!ENTITY swarr "&#x2199;"> <!ENTITY swarrow "&#x2199;">
<!ENTITY nlarr "&#x219A;"> <!ENTITY nleftarrow "&#x219A;">
<!ENTITY nrarr "&#x219B;"> <!ENTITY nrightarrow "&#x219B;">
<!ENTITY Larr "&#x219E;"> <!ENTITY twoheadleftarrow "&#x219E;">
<!ENTITY Uarr "&#x219F;">
<!ENTITY Rarr "&#x21A0;"> <!ENTITY twoheadrightarrow "&#x21A0;">
<!ENTITY Darr "&#x21A1;">
<!ENTITY larrtl "&#x21A2;"> <!ENTITY leftarrowtail "&#x21A2;">
<!ENTITY rarrtl "&#x21A3;"> <!ENTITY ratail "&#x21A3;"> <!ENTITY rightarrowtail "&#x21A3;">
<!ENTITY LeftTeeArrow "&#x21A4;"> <!ENTITY mapstoleft "&#x21A4;">
<!ENTITY mapstoup "&#x21A5;"> <!ENTITY UpTeeArrow "&#x21A5;">
<!ENTITY map "&#x21A6;"> <!ENTITY mapsto "&#x21A6;"> <!ENTITY RightTeeArrow "&#x21A6;">
<!ENTITY DownTeeArrow "&#x21A7;"> <!ENTITY mapstodown "&#x21A7;">
<!ENTITY hookleftarrow "&#x21A9;"> <!ENTITY larrhk "&#x21A9;">
<!ENTITY hookrightarrow "&#x21AA;"> <!ENTITY rarrhk "&#x21AA;">
<!ENTITY larrlp "&#x21AB;"> <!ENTITY looparrowleft "&#x21AB;">
<!ENTITY looparrowright "&#x21AC;"> <!ENTITY rarrlp "&#x21AC;">
<!ENTITY harrw "&#x21AD;"> <!ENTITY leftrightsquigarrow "&#x21AD;">
<!ENTITY nharr "&#x21AE;"> <!ENTITY nleftrightarrow "&#x21AE;">
<!ENTITY Lsh "&#x21B0;"> <!ENTITY lsh "&#x21B0;">
<!ENTITY Rsh "&#x21B1;"> <!ENTITY rsh "&#x21B1;">
<!ENTITY ldsh "&#x21B2;">
<!ENTITY rdsh "&#x21B3;">
<!ENTITY cularr "&#x21B6;"> <!ENTITY curvearrowleft "&#x21B6;">
<!ENTITY curarr "&#x21B7;"> <!ENTITY curvearrowright "&#x21B7;">
<!ENTITY circlearrowleft "&#x21BA;"> <!ENTITY olarr "&#x21BA;">
<!ENTITY circlearrowright "&#x21BB;"> <!ENTITY orarr "&#x21BB;">
<!ENTITY leftharpoonup "&#x21BC;"> <!ENTITY LeftVector "&#x21BC;"> <!ENTITY lharu "&#x21BC;">
<!ENTITY DownLeftVector "&#x21BD;"> <!ENTITY leftharpoondown "&#x21BD;"> <!ENTITY lhard "&#x21BD;">
<!ENTITY RightUpVector "&#x21BE;"> <!ENTITY uharr "&#x21BE;"> <!ENTITY upharpoonright "&#x21BE;">
<!ENTITY LeftUpVector "&#x21BF;"> <!ENTITY uharl "&#x21BF;"> <!ENTITY upharpoonleft "&#x21BF;">
<!ENTITY rharu "&#x21C0;"> <!ENTITY rightharpoonup "&#x21C0;"> <!ENTITY RightVector "&#x21C0;">
<!ENTITY DownRightVector "&#x21C1;"> <!ENTITY rhard "&#x21C1;"> <!ENTITY rightharpoondown "&#x21C1;">
<!ENTITY dharr "&#x21C2;"> <!ENTITY downharpoonright "&#x21C2;"> <!ENTITY RightDownVector "&#x21C2;">
<!ENTITY dharl "&#x21C3;"> <!ENTITY downharpoonleft "&#x21C3;"> <!ENTITY LeftDownVector "&#x21C3;">
<!ENTITY RightArrowLeftArrow "&#x21C4;"> <!ENTITY rightleftarrows "&#x21C4;"> <!ENTITY rlarr "&#x21C4;">
<!ENTITY udarr "&#x21C5;"> <!ENTITY UpArrowDownArrow "&#x21C5;">
<!ENTITY LeftArrowRightArrow "&#x21C6;"> <!ENTITY leftrightarrows "&#x21C6;"> <!ENTITY lrarr "&#x21C6;">
<!ENTITY leftleftarrows "&#x21C7;"> <!ENTITY llarr "&#x21C7;">
<!ENTITY upuparrows "&#x21C8;"> <!ENTITY uuarr "&#x21C8;">
<!ENTITY rightrightarrows "&#x21C9;"> <!ENTITY rrarr "&#x21C9;">
<!ENTITY ddarr "&#x21CA;"> <!ENTITY downdownarrows "&#x21CA;">
<!ENTITY leftrightharpoons "&#x21CB;"> <!ENTITY lrhar "&#x21CB;"> <!ENTITY ReverseEquilibrium "&#x21CB;">
<!ENTITY Equilibrium "&#x21CC;"> <!ENTITY rightleftharpoons "&#x21CC;"> <!ENTITY rlhar "&#x21CC;">
<!ENTITY nlArr "&#x21CD;"> <!ENTITY nLeftarrow "&#x21CD;"> <!ENTITY nvlArr "&#x21CD;">
<!ENTITY nhArr "&#x21CE;"> <!ENTITY nLeftrightarrow "&#x21CE;"> <!ENTITY nvHarr "&#x21CE;">
<!ENTITY nrArr "&#x21CF;"> <!ENTITY nRightarrow "&#x21CF;"> <!ENTITY nvrArr "&#x21CF;">
<!ENTITY DoubleLeftArrow "&#x21D0;"> <!ENTITY lArr "&#x21D0;"> <!ENTITY Leftarrow "&#x21D0;">
<!ENTITY DoubleUpArrow "&#x21D1;"> <!ENTITY uArr "&#x21D1;"> <!ENTITY Uparrow "&#x21D1;">
<!ENTITY DoubleRightArrow "&#x21D2;"> <!ENTITY Implies "&#x21D2;"> <!ENTITY rArr "&#x21D2;"> <!ENTITY Rightarrow "&#x21D2;">
<!ENTITY dArr "&#x21D3;"> <!ENTITY DoubleDownArrow "&#x21D3;"> <!ENTITY Downarrow "&#x21D3;">
<!ENTITY DoubleLeftRightArrow "&#x21D4;"> <!ENTITY hArr "&#x21D4;"> <!ENTITY Leftrightarrow "&#x21D4;">
<!ENTITY DoubleUpDownArrow "&#x21D5;"> <!ENTITY Updownarrow "&#x21D5;"> <!ENTITY vArr "&#x21D5;">
<!ENTITY nwArr "&#x21D6;">
<!ENTITY neArr "&#x21D7;">
<!ENTITY seArr "&#x21D8;">
<!ENTITY swArr "&#x21D9;">
<!ENTITY lAarr "&#x21DA;"> <!ENTITY Lleftarrow "&#x21DA;">
<!ENTITY rAarr "&#x21DB;"> <!ENTITY Rrightarrow "&#x21DB;">
<!ENTITY dzigrarr "&#x21DD;"> <!ENTITY rarrw "&#x21DD;"> <!ENTITY rightsquigarrow "&#x21DD;">
<!ENTITY larrb "&#x21E4;"> <!ENTITY LeftArrowBar "&#x21E4;">
<!ENTITY rarrb "&#x21E5;"> <!ENTITY RightArrowBar "&#x21E5;">
<!ENTITY ForAll "&#x2200;"> <!ENTITY forall "&#x2200;">
<!ENTITY comp "&#x2201;"> <!ENTITY complement "&#x2201;">
<!ENTITY part "&#x2202;"> <!ENTITY PartialD "&#x2202;">
<!ENTITY exist "&#x2203;"> <!ENTITY Exists "&#x2203;">
<!ENTITY nexist "&#x2204;"> <!ENTITY nexists "&#x2204;"> <!ENTITY NotExists "&#x2204;">
<!ENTITY emptyv "&#x2205;"> <!ENTITY varnothing "&#x2205;">
<!ENTITY Del "&#x2207;"> <!ENTITY nabla "&#x2207;">
<!ENTITY Element "&#x2208;"> <!ENTITY in "&#x2208;"> <!ENTITY isin "&#x2208;"> <!ENTITY isinv "&#x2208;">
<!ENTITY NotElement "&#x2209;"> <!ENTITY notin "&#x2209;">
<!ENTITY ni "&#x220B;"> <!ENTITY niv "&#x220B;"> <!ENTITY ReverseElement "&#x220B;"> <!ENTITY SuchThat "&#x220B;">
<!ENTITY notni "&#x220C;"> <!ENTITY notniva "&#x220C;"> <!ENTITY NotReverseElement "&#x220C;">
<!ENTITY prod "&#x220F;"> <!ENTITY Product "&#x220F;">
<!ENTITY coprod "&#x2210;"> <!ENTITY Coproduct "&#x2210;">
<!ENTITY Sum "&#x2211;"> <!ENTITY sum "&#x2211;">
<!ENTITY minus "&#x2212;">
<!ENTITY MinusPlus "&#x2213;"> <!ENTITY mnplus "&#x2213;"> <!ENTITY mp "&#x2213;">
<!ENTITY dotplus "&#x2214;"> <!ENTITY plusdo "&#x2214;">
<!ENTITY Backslash "&#x2216;"> 
<!ENTITY setminus "&#x2216;"> 
<!ENTITY setmn "&#x2216;">
<!ENTITY lowast "&#x2217;">
<!ENTITY compfn "&#x2218;"> <!ENTITY SmallCircle "&#x2218;">
<!ENTITY radic "&#x221A;"> <!ENTITY Sqrt "&#x221A;">
<!ENTITY prop "&#x221D;"> <!ENTITY Proportional "&#x221D;"> <!ENTITY propto "&#x221D;"> <!ENTITY varpropto "&#x221D;"> <!ENTITY vprop "&#x221D;">
<!ENTITY infin "&#x221E;">
<!ENTITY angrt "&#x221F;">
<!ENTITY ang "&#x2220;"> <!ENTITY angle "&#x2220;">
<!ENTITY angmsd "&#x2221;"> <!ENTITY measuredangle "&#x2221;">
<!ENTITY angsph "&#x2222;">
<!ENTITY mid "&#x2223;"> 
<!ENTITY VerticalBar "&#x2223;">
<!ENTITY nmid "&#x2224;"> 
<!ENTITY NotVerticalBar "&#x2224;">
<!ENTITY DoubleVerticalBar "&#x2225;"> 
<!ENTITY par "&#x2225;"> 
<!ENTITY parallel "&#x2225;">
<!ENTITY NotDoubleVerticalBar "&#x2226;"> 
<!ENTITY npar "&#x2226;"> 
<!ENTITY nparallel "&#x2226;">
<!ENTITY and "&#x2227;"> 
<!ENTITY wedge "&#x2227;">
<!ENTITY or "&#x2228;"> 
<!ENTITY vee "&#x2228;">
<!ENTITY cap "&#x2229;">
<!ENTITY cup "&#x222A;">
<!ENTITY int "&#x222B;"> <!ENTITY Integral "&#x222B;">
<!ENTITY Int "&#x222C;">
<!ENTITY iiint "&#x222D;"> <!ENTITY tint "&#x222D;">
<!ENTITY conint "&#x222E;"> <!ENTITY ContourIntegral "&#x222E;"> <!ENTITY oint "&#x222E;">
<!ENTITY Conint "&#x222F;"> <!ENTITY DoubleContourIntegral "&#x222F;">
<!ENTITY Cconint "&#x2230;">
<!ENTITY cwint "&#x2231;">
<!ENTITY ClockwiseContourIntegral "&#x2232;"> <!ENTITY cwconint "&#x2232;">
<!ENTITY awconint "&#x2233;"> <!ENTITY CounterClockwiseContourIntegral "&#x2233;">
<!ENTITY there4 "&#x2234;"> <!ENTITY Therefore "&#x2234;"> <!ENTITY therefore "&#x2234;">
<!ENTITY becaus "&#x2235;"> <!ENTITY Because "&#x2235;"> <!ENTITY because "&#x2235;">
<!ENTITY ratio "&#x2236;">
<!ENTITY Colon "&#x2237;"> <!ENTITY Proportion "&#x2237;">
<!ENTITY dotminus "&#x2238;"> <!ENTITY minusd "&#x2238;">
<!ENTITY mDDot "&#x223A;">
<!ENTITY homtht "&#x223B;">
<!ENTITY sim "&#x223C;"> <!ENTITY Tilde "&#x223C;">
<!ENTITY backsim "&#x223D;"> <!ENTITY bsim "&#x223D;">
<!ENTITY mstpos "&#x223E;">
<!ENTITY VerticalTilde "&#x2240;"> <!ENTITY wr "&#x2240;"> <!ENTITY wreath "&#x2240;">
<!ENTITY NotTilde "&#x2241;"> <!ENTITY nsim "&#x2241;">
<!ENTITY eqsim "&#x2242;"> <!ENTITY EqualTilde "&#x2242;"> <!ENTITY esim "&#x2242;">
<!ENTITY sime "&#x2243;"> <!ENTITY simeq "&#x2243;"> <!ENTITY TildeEqual "&#x2243;">
<!ENTITY NotTildeEqual "&#x2244;"> <!ENTITY nsime "&#x2244;"> <!ENTITY nsimeq "&#x2244;">
<!ENTITY cong "&#x2245;"> <!ENTITY TildeFullEqual "&#x2245;">
<!ENTITY simne "&#x2246;">
<!ENTITY ncong "&#x2247;"> <!ENTITY NotTildeFullEqual "&#x2247;">
<!ENTITY ap "&#x2248;"> <!ENTITY approx "&#x2248;"> <!ENTITY TildeTilde "&#x2248;">
<!ENTITY nap "&#x2249;"> <!ENTITY napprox "&#x2249;"> <!ENTITY NotTildeTilde "&#x2249;">
<!ENTITY apE "&#x224A;"> <!ENTITY ape "&#x224A;"> <!ENTITY approxeq "&#x224A;">
<!ENTITY apid "&#x224B;">
<!ENTITY backcong "&#x224C;"> <!ENTITY bcong "&#x224C;">
<!ENTITY asymp "&#x224D;"> <!ENTITY CupCap "&#x224D;">
<!ENTITY bump "&#x224E;"> <!ENTITY Bumpeq "&#x224E;"> <!ENTITY HumpDownHump "&#x224E;">
<!ENTITY bumpe "&#x224F;"> <!ENTITY bumpeq "&#x224F;"> <!ENTITY HumpEqual "&#x224F;">
<!ENTITY doteq "&#x2250;"> <!ENTITY DotEqual "&#x2250;"> <!ENTITY esdot "&#x2250;">
<!ENTITY doteqdot "&#x2251;"> <!ENTITY eDot "&#x2251;">
<!ENTITY efDot "&#x2252;"> <!ENTITY fallingdotseq "&#x2252;">
<!ENTITY erDot "&#x2253;"> <!ENTITY risingdotseq "&#x2253;">
<!ENTITY colone "&#x2254;"> <!ENTITY coloneq "&#x2254;">
<!ENTITY ecolon "&#x2255;"> <!ENTITY eqcolon "&#x2255;">
<!ENTITY ecir "&#x2256;"> <!ENTITY eqcirc "&#x2256;">
<!ENTITY circeq "&#x2257;"> <!ENTITY cire "&#x2257;">
<!ENTITY wedgeq "&#x2259;">
<!ENTITY veeeq "&#x225A;">
<!ENTITY easter "&#x225B;">
<!ENTITY triangleq "&#x225C;"> <!ENTITY trie "&#x225C;">
<!ENTITY equest "&#x225F;"> <!ENTITY questeq "&#x225F;">
<!ENTITY ne "&#x2260;"> <!ENTITY NotEqual "&#x2260;">
<!ENTITY Congruent "&#x2261;"> <!ENTITY equiv "&#x2261;">
<!ENTITY nequiv "&#x2262;"> <!ENTITY NotCongruent "&#x2262;">
<!ENTITY le "&#x2264;"> <!ENTITY leq "&#x2264;">
<!ENTITY ge "&#x2265;"> <!ENTITY geq "&#x2265;"> <!ENTITY GreaterEqual "&#x2265;">
<!ENTITY lE "&#x2266;"> <!ENTITY leqq "&#x2266;"> <!ENTITY LessFullEqual "&#x2266;">
<!ENTITY gE "&#x2267;"> <!ENTITY geqq "&#x2267;"> <!ENTITY GreaterFullEqual "&#x2267;">
<!ENTITY lnE "&#x2268;"> <!ENTITY lne "&#x2268;"> <!ENTITY lneq "&#x2268;"> <!ENTITY lneqq "&#x2268;">
<!ENTITY gnE "&#x2269;"> <!ENTITY gne "&#x2269;"> <!ENTITY gneq "&#x2269;"> <!ENTITY gneqq "&#x2269;">
<!ENTITY ll "&#x226A;"> <!ENTITY Lt "&#x226A;"> <!ENTITY NestedLessLess "&#x226A;">
<!ENTITY gg "&#x226B;"> <!ENTITY Gt "&#x226B;"> <!ENTITY NestedGreaterGreater "&#x226B;">
<!ENTITY between "&#x226C;"> <!ENTITY twixt "&#x226C;">
<!ENTITY NotCupCap "&#x226D;">
<!ENTITY nless "&#x226E;"> <!ENTITY nlt "&#x226E;"> <!ENTITY NotLess "&#x226E;"> <!ENTITY nvlt "&#x226E;">
<!ENTITY ngt "&#x226F;"> <!ENTITY ngtr "&#x226F;"> <!ENTITY NotGreater "&#x226F;"> <!ENTITY nvgt "&#x226F;">
<!ENTITY nlE "&#x2270;"> <!ENTITY nleqq "&#x2270;"> <!ENTITY nleqslant "&#x2270;"> <!ENTITY nles "&#x2270;"> <!ENTITY NotGreaterFullEqual "&#x2270;"> <!ENTITY NotLessSlantEqual "&#x2270;"> <!ENTITY nvle "&#x2270;">
<!ENTITY ngE "&#x2271;"> <!ENTITY ngeqq "&#x2271;"> <!ENTITY ngeqslant "&#x2271;"> <!ENTITY nges "&#x2271;"> <!ENTITY NotGreaterSlantEqual "&#x2271;"> <!ENTITY nvge "&#x2271;">
<!ENTITY lap "&#x2272;"> <!ENTITY lessapprox "&#x2272;"> <!ENTITY lesssim "&#x2272;"> <!ENTITY LessTilde "&#x2272;"> <!ENTITY lsim "&#x2272;">
<!ENTITY gap "&#x2273;"> <!ENTITY GreaterTilde "&#x2273;"> <!ENTITY gsim "&#x2273;"> <!ENTITY gtrapprox "&#x2273;"> <!ENTITY gtrsim "&#x2273;">
<!ENTITY nlsim "&#x2274;"> <!ENTITY NotLessTilde "&#x2274;">
<!ENTITY ngsim "&#x2275;"> <!ENTITY NotGreaterTilde "&#x2275;">
<!ENTITY LessGreater "&#x2276;"> <!ENTITY lessgtr "&#x2276;"> <!ENTITY lg "&#x2276;">
<!ENTITY gl "&#x2277;"> <!ENTITY GreaterLess "&#x2277;"> <!ENTITY gtrless "&#x2277;">
<!ENTITY NotLessGreater "&#x2278;"> <!ENTITY ntlg "&#x2278;">
<!ENTITY NotGreaterLess "&#x2279;"> <!ENTITY ntgl "&#x2279;">
<!ENTITY pr "&#x227A;"> <!ENTITY prec "&#x227A;"> <!ENTITY Precedes "&#x227A;">
<!ENTITY sc "&#x227B;"> <!ENTITY succ "&#x227B;"> <!ENTITY Succeeds "&#x227B;">
<!ENTITY prcue "&#x227C;"> <!ENTITY preccurlyeq "&#x227C;"> <!ENTITY PrecedesSlantEqual "&#x227C;">
<!ENTITY sccue "&#x227D;"> <!ENTITY sce "&#x227D;"> <!ENTITY succcurlyeq "&#x227D;"> <!ENTITY SucceedsEqual "&#x227D;"> <!ENTITY SucceedsSlantEqual "&#x227D;"> <!ENTITY succeq "&#x227D;">
<!ENTITY prap "&#x227E;"> <!ENTITY precapprox "&#x227E;"> <!ENTITY PrecedesTilde "&#x227E;"> <!ENTITY precsim "&#x227E;"> <!ENTITY prsim "&#x227E;"> <!ENTITY scE "&#x227E;">
<!ENTITY scap "&#x227F;"> <!ENTITY scsim "&#x227F;"> <!ENTITY succapprox "&#x227F;"> <!ENTITY SucceedsTilde "&#x227F;"> <!ENTITY succsim "&#x227F;">
<!ENTITY NotPrecedes "&#x2280;"> <!ENTITY npr "&#x2280;"> <!ENTITY nprec "&#x2280;">
<!ENTITY NotSucceeds "&#x2281;"> <!ENTITY nsc "&#x2281;"> <!ENTITY nsucc "&#x2281;">
<!ENTITY sub "&#x2282;"> <!ENTITY subset "&#x2282;">
<!ENTITY sup "&#x2283;"> <!ENTITY Superset "&#x2283;"> <!ENTITY supset "&#x2283;">
<!ENTITY NotSubset "&#x2284;"> <!ENTITY nsub "&#x2284;"> <!ENTITY nsubset "&#x2284;"> <!ENTITY vnsub "&#x2284;">
<!ENTITY NotSuperset "&#x2285;"> <!ENTITY nsup "&#x2285;"> <!ENTITY nsupset "&#x2285;"> <!ENTITY vnsup "&#x2285;">
<!ENTITY subE "&#x2286;"> <!ENTITY sube "&#x2286;"> <!ENTITY subseteq "&#x2286;"> <!ENTITY subseteqq "&#x2286;"> <!ENTITY SubsetEqual "&#x2286;">
<!ENTITY supE "&#x2287;"> <!ENTITY supe "&#x2287;"> <!ENTITY SupersetEqual "&#x2287;"> <!ENTITY supseteq "&#x2287;"> <!ENTITY supseteqq "&#x2287;">
<!ENTITY NotSubsetEqual "&#x2288;"> 
<!ENTITY nsubE "&#x2288;"> 
<!ENTITY nsube "&#x2288;"> 
<!ENTITY nsubseteq "&#x2288;"> 
<!ENTITY nsubseteqq "&#x2288;">
<!ENTITY NotSupersetEqual "&#x2289;"> <!ENTITY nsupE "&#x2289;"> <!ENTITY nsupe "&#x2289;"> <!ENTITY nsupseteq "&#x2289;"> <!ENTITY nsupseteqq "&#x2289;">
<!ENTITY subnE "&#x228A;"> <!ENTITY subne "&#x228A;"> <!ENTITY subsetneq "&#x228A;"> <!ENTITY subsetneqq "&#x228A;">
<!ENTITY supnE "&#x228B;"> <!ENTITY supne "&#x228B;"> <!ENTITY supsetneq "&#x228B;"> <!ENTITY supsetneqq "&#x228B;">
<!ENTITY cupdot "&#x228D;">
<!ENTITY biguplus "&#x228E;"> <!ENTITY UnionPlus "&#x228E;"> <!ENTITY uplus "&#x228E;"> <!ENTITY xuplus "&#x228E;">
<!ENTITY sqsub "&#x228F;"> <!ENTITY sqsubset "&#x228F;"> <!ENTITY SquareSubset "&#x228F;">
<!ENTITY sqsup "&#x2290;"> <!ENTITY sqsupset "&#x2290;"> <!ENTITY SquareSuperset "&#x2290;">
<!ENTITY sqsube "&#x2291;"> <!ENTITY sqsubseteq "&#x2291;"> <!ENTITY SquareSubsetEqual "&#x2291;">
<!ENTITY sqsupe "&#x2292;"> <!ENTITY sqsupseteq "&#x2292;"> <!ENTITY SquareSupersetEqual "&#x2292;">
<!ENTITY sqcap "&#x2293;"> <!ENTITY SquareIntersection "&#x2293;">
<!ENTITY bigsqcup "&#x2294;"> <!ENTITY sqcup "&#x2294;"> <!ENTITY SquareUnion "&#x2294;"> <!ENTITY xsqcup "&#x2294;">
<!ENTITY bigoplus "&#x2295;"> <!ENTITY CirclePlus "&#x2295;"> <!ENTITY oplus "&#x2295;"> <!ENTITY xoplus "&#x2295;">
<!ENTITY CircleMinus "&#x2296;"> <!ENTITY ominus "&#x2296;">
<!ENTITY bigotimes "&#x2297;"> <!ENTITY CircleTimes "&#x2297;"> <!ENTITY otimes "&#x2297;"> <!ENTITY xotime "&#x2297;">
<!ENTITY osol "&#x2298;">
<!ENTITY bigodot "&#x2299;"> <!ENTITY CircleDot "&#x2299;"> <!ENTITY odot "&#x2299;"> <!ENTITY xodot "&#x2299;">
<!ENTITY circledcirc "&#x229A;"> <!ENTITY ocir "&#x229A;">
<!ENTITY circledast "&#x229B;"> <!ENTITY oast "&#x229B;">
<!ENTITY circleddash "&#x229D;"> <!ENTITY odash "&#x229D;">
<!ENTITY boxplus "&#x229E;"> <!ENTITY plusb "&#x229E;">
<!ENTITY boxminus "&#x229F;"> <!ENTITY minusb "&#x229F;">
<!ENTITY boxtimes "&#x22A0;"> <!ENTITY timesb "&#x22A0;">
<!ENTITY dotsquare "&#x22A1;"> <!ENTITY sdotb "&#x22A1;">
<!ENTITY RightTee "&#x22A2;"> <!ENTITY vdash "&#x22A2;">
<!ENTITY dashv "&#x22A3;"> <!ENTITY LeftTee "&#x22A3;">
<!ENTITY DownTee "&#x22A4;"> <!ENTITY top "&#x22A4;">
<!ENTITY bot "&#x22A5;"> <!ENTITY bottom "&#x22A5;"> <!ENTITY perp "&#x22A5;"> <!ENTITY UpTee "&#x22A5;">
<!ENTITY models "&#x22A7;">
<!ENTITY DoubleRightTee "&#x22A8;"> <!ENTITY vDash "&#x22A8;">
<!ENTITY Vdash "&#x22A9;">
<!ENTITY Vvdash "&#x22AA;">
<!ENTITY VDash "&#x22AB;">
<!ENTITY nvdash "&#x22AC;">
<!ENTITY nvDash "&#x22AD;">
<!ENTITY nVdash "&#x22AE;">
<!ENTITY nVDash "&#x22AF;">
<!ENTITY prurel "&#x22B0;">
<!ENTITY LeftTriangle "&#x22B2;"> <!ENTITY vartriangleleft "&#x22B2;"> <!ENTITY vltri "&#x22B2;">
<!ENTITY RightTriangle "&#x22B3;"> <!ENTITY vartriangleright "&#x22B3;"> <!ENTITY vrtri "&#x22B3;">
<!ENTITY LeftTriangleEqual "&#x22B4;"> <!ENTITY ltrie "&#x22B4;"> <!ENTITY trianglelefteq "&#x22B4;">
<!ENTITY RightTriangleEqual "&#x22B5;"> <!ENTITY rtrie "&#x22B5;"> <!ENTITY trianglerighteq "&#x22B5;">
<!ENTITY origof "&#x22B6;">
<!ENTITY imof "&#x22B7;">
<!ENTITY multimap "&#x22B8;"> <!ENTITY mumap "&#x22B8;">
<!ENTITY hercon "&#x22B9;">
<!ENTITY intcal "&#x22BA;"> <!ENTITY intercal "&#x22BA;">
<!ENTITY veebar "&#x22BB;">
<!ENTITY barwed "&#x22BC;"> <!ENTITY barwedge "&#x22BC;">
<!ENTITY barvee "&#x22BD;">
<!ENTITY vangrt "&#x22BE;">
<!ENTITY bigwedge "&#x22C0;"> <!ENTITY Wedge "&#x22C0;"> <!ENTITY xwedge "&#x22C0;">
<!ENTITY bigvee "&#x22C1;"> <!ENTITY Vee "&#x22C1;"> <!ENTITY xvee "&#x22C1;">
<!ENTITY bigcap "&#x22C2;"> <!ENTITY Intersection "&#x22C2;"> <!ENTITY xcap "&#x22C2;">
<!ENTITY bigcup "&#x22C3;"> <!ENTITY Union "&#x22C3;"> <!ENTITY xcup "&#x22C3;">
<!ENTITY diam "&#x22C4;"> <!ENTITY Diamond "&#x22C4;"> <!ENTITY diamond "&#x22C4;">
<!ENTITY sdot "&#x22C5;">
<!ENTITY sstarf "&#x22C6;"> <!ENTITY Star "&#x22C6;"> <!ENTITY star "&#x22C6;">
<!ENTITY divideontimes "&#x22C7;"> <!ENTITY divonx "&#x22C7;">
<!ENTITY bowtie "&#x22C8;">
<!ENTITY ltimes "&#x22C9;">
<!ENTITY rtimes "&#x22CA;">
<!ENTITY leftthreetimes "&#x22CB;"> <!ENTITY lthree "&#x22CB;">
<!ENTITY rightthreetimes "&#x22CC;"> <!ENTITY rthree "&#x22CC;">
<!ENTITY backsimeq "&#x22CD;"> <!ENTITY bsime "&#x22CD;">
<!ENTITY curlyvee "&#x22CE;"> <!ENTITY cuvee "&#x22CE;">
<!ENTITY curlywedge "&#x22CF;"> <!ENTITY cuwed "&#x22CF;">
<!ENTITY Sub "&#x22D0;"> <!ENTITY Subset "&#x22D0;">
<!ENTITY Sup "&#x22D1;"> <!ENTITY Supset "&#x22D1;">
<!ENTITY Cap "&#x22D2;">
<!ENTITY Cup "&#x22D3;">
<!ENTITY fork "&#x22D4;"> <!ENTITY pitchfork "&#x22D4;">
<!ENTITY epar "&#x22D5;">
<!ENTITY lessdot "&#x22D6;"> <!ENTITY ltdot "&#x22D6;">
<!ENTITY gtdot "&#x22D7;"> <!ENTITY gtrdot "&#x22D7;">
<!ENTITY Ll "&#x22D8;">
<!ENTITY Gg "&#x22D9;"> <!ENTITY ggg "&#x22D9;">
<!ENTITY lEg "&#x22DA;"> <!ENTITY leg "&#x22DA;"> <!ENTITY lesseqgtr "&#x22DA;"> <!ENTITY lesseqqgtr "&#x22DA;"> <!ENTITY LessEqualGreater "&#x22DA;">
<!ENTITY gEl "&#x22DB;"> <!ENTITY gel "&#x22DB;"> <!ENTITY GreaterEqualLess "&#x22DB;"> <!ENTITY gtreqless "&#x22DB;"> <!ENTITY gtreqqless "&#x22DB;">
<!ENTITY els "&#x22DC;"> <!ENTITY eqslantless "&#x22DC;">
<!ENTITY egs "&#x22DD;"> <!ENTITY eqslantgtr "&#x22DD;">
<!ENTITY cuepr "&#x22DE;"> <!ENTITY curlyeqprec "&#x22DE;">
<!ENTITY cuesc "&#x22DF;"> <!ENTITY curlyeqsucc "&#x22DF;">
<!ENTITY NotPrecedesSlantEqual "&#x22E0;"> <!ENTITY nprcue "&#x22E0;">
<!ENTITY NotSucceedsSlantEqual "&#x22E1;"> <!ENTITY nsccue "&#x22E1;">
<!ENTITY NotSquareSubsetEqual "&#x22E2;"> <!ENTITY nsqsube "&#x22E2;">
<!ENTITY NotSquareSupersetEqual "&#x22E3;"> <!ENTITY nsqsupe "&#x22E3;">
<!ENTITY lnsim "&#x22E6;">
<!ENTITY gnsim "&#x22E7;">
<!ENTITY precnapprox "&#x22E8;"> <!ENTITY precnsim "&#x22E8;"> <!ENTITY prnap "&#x22E8;"> <!ENTITY prnsim "&#x22E8;">
<!ENTITY scnap "&#x22E9;"> <!ENTITY scnsim "&#x22E9;"> <!ENTITY succnapprox "&#x22E9;"> <!ENTITY succnsim "&#x22E9;">
<!ENTITY nltri "&#x22EA;"> <!ENTITY NotLeftTriangle "&#x22EA;"> <!ENTITY ntriangleleft "&#x22EA;">
<!ENTITY NotRightTriangle "&#x22EB;"> <!ENTITY nrtri "&#x22EB;"> <!ENTITY ntriangleright "&#x22EB;">
<!ENTITY nltrie "&#x22EC;"> <!ENTITY NotLeftTriangleEqual "&#x22EC;"> <!ENTITY ntrianglelefteq "&#x22EC;">
<!ENTITY NotRightTriangleEqual "&#x22ED;"> <!ENTITY nrtrie "&#x22ED;"> <!ENTITY ntrianglerighteq "&#x22ED;">
<!ENTITY vellip "&#x22EE;">
<!ENTITY ctdot "&#x22EF;">
<!ENTITY utdot "&#x22F0;">
<!ENTITY dtdot "&#x22F1;">
<!ENTITY Barwed "&#x2306;"> <!ENTITY doublebarwedge "&#x2306;">
<!ENTITY lceil "&#x2308;"> <!ENTITY LeftCeiling "&#x2308;">
<!ENTITY rceil "&#x2309;"> <!ENTITY RightCeiling "&#x2309;">
<!ENTITY LeftFloor "&#x230A;"> <!ENTITY lfloor "&#x230A;">
<!ENTITY rfloor "&#x230B;"> <!ENTITY RightFloor "&#x230B;">
<!ENTITY drcrop "&#x230C;">
<!ENTITY dlcrop "&#x230D;">
<!ENTITY urcrop "&#x230E;">
<!ENTITY ulcrop "&#x230F;">
<!ENTITY bnot "&#x2310;">
<!ENTITY profline "&#x2312;">
<!ENTITY profsurf "&#x2313;">
<!ENTITY telrec "&#x2315;">
<!ENTITY target "&#x2316;">
<!ENTITY ulcorn "&#x231C;"> <!ENTITY ulcorner "&#x231C;">
<!ENTITY urcorn "&#x231D;"> <!ENTITY urcorner "&#x231D;">
<!ENTITY dlcorn "&#x231E;"> <!ENTITY llcorner "&#x231E;">
<!ENTITY drcorn "&#x231F;"> <!ENTITY lrcorner "&#x231F;">
<!ENTITY frown "&#x2322;">
<!ENTITY smile "&#x2323;">
<!ENTITY cylcty "&#x232D;">
<!ENTITY profalar "&#x232E;">
<!ENTITY topbot "&#x2336;">
<!ENTITY blank "&#x2423;">
<!ENTITY circledS "&#x24C8;"> <!ENTITY oS "&#x24C8;">
<!ENTITY boxh "&#x2500;">
<!ENTITY boxv "&#x2502;">
<!ENTITY boxdr "&#x250C;">
<!ENTITY boxdl "&#x2510;">
<!ENTITY boxur "&#x2514;">
<!ENTITY boxul "&#x2518;">
<!ENTITY boxvr "&#x251C;">
<!ENTITY boxvl "&#x2524;">
<!ENTITY boxhd "&#x252C;">
<!ENTITY boxhu "&#x2534;">
<!ENTITY boxvh "&#x253C;">
<!ENTITY boxH "&#x2550;">
<!ENTITY boxV "&#x2551;">
<!ENTITY boxdR "&#x2552;">
<!ENTITY boxDr "&#x2553;">
<!ENTITY boxDR "&#x2554;">
<!ENTITY boxdL "&#x2555;">
<!ENTITY boxDl "&#x2556;">
<!ENTITY boxDL "&#x2557;">
<!ENTITY boxuR "&#x2558;">
<!ENTITY boxUr "&#x2559;">
<!ENTITY boxUR "&#x255A;">
<!ENTITY boxuL "&#x255B;">
<!ENTITY boxUl "&#x255C;">
<!ENTITY boxUL "&#x255D;">
<!ENTITY boxvR "&#x255E;">
<!ENTITY boxVr "&#x255F;">
<!ENTITY boxVR "&#x2560;">
<!ENTITY boxvL "&#x2561;">
<!ENTITY boxVl "&#x2562;">
<!ENTITY boxVL "&#x2563;">
<!ENTITY boxHd "&#x2564;">
<!ENTITY boxhD "&#x2565;">
<!ENTITY boxHD "&#x2566;">
<!ENTITY boxHu "&#x2567;">
<!ENTITY boxhU "&#x2568;">
<!ENTITY boxHU "&#x2569;">
<!ENTITY boxvH "&#x256A;">
<!ENTITY boxVh "&#x256B;">
<!ENTITY boxVH "&#x256C;">
<!ENTITY uhblk "&#x2580;">
<!ENTITY lhblk "&#x2584;">
<!ENTITY block "&#x2588;">
<!ENTITY blk14 "&#x2591;">
<!ENTITY blk12 "&#x2592;">
<!ENTITY blk34 "&#x2593;">
<!ENTITY squ "&#x25A1;"> <!ENTITY Square "&#x25A1;"> <!ENTITY square "&#x25A1;">
<!ENTITY blacksquare "&#x25AA;"> <!ENTITY squarf "&#x25AA;"> <!ENTITY squf "&#x25AA;">
<!ENTITY rect "&#x25AD;">
<!ENTITY marker "&#x25AE;">
<!ENTITY bigtriangleup "&#x25B3;"> <!ENTITY xutri "&#x25B3;">
<!ENTITY blacktriangle "&#x25B4;"> <!ENTITY utrif "&#x25B4;">
<!ENTITY triangle "&#x25B5;"> <!ENTITY utri "&#x25B5;">
<!ENTITY blacktriangleright "&#x25B8;"> <!ENTITY rtrif "&#x25B8;">
<!ENTITY rtri "&#x25B9;"> <!ENTITY triangleright "&#x25B9;">
<!ENTITY bigtriangledown "&#x25BD;"> <!ENTITY xdtri "&#x25BD;">
<!ENTITY blacktriangledown "&#x25BE;"> <!ENTITY dtrif "&#x25BE;">
<!ENTITY dtri "&#x25BF;"> <!ENTITY triangledown "&#x25BF;">
<!ENTITY blacktriangleleft "&#x25C2;"> <!ENTITY ltrif "&#x25C2;">
<!ENTITY ltri "&#x25C3;"> <!ENTITY triangleleft "&#x25C3;">
<!ENTITY loz "&#x25CA;"> <!ENTITY lozenge "&#x25CA;">
<!ENTITY cir "&#x25CB;">
<!ENTITY tridot "&#x25EC;">
<!ENTITY bigcirc "&#x25EF;"> <!ENTITY xcirc "&#x25EF;">
<!ENTITY bigstar "&#x2605;"> <!ENTITY starf "&#x2605;">
<!ENTITY phone "&#x260E;">
<!ENTITY female "&#x2640;">
<!ENTITY male "&#x2642;">
<!ENTITY spades "&#x2660;"> <!ENTITY spadesuit "&#x2660;">
<!ENTITY hearts "&#x2661;"> <!ENTITY heartsuit "&#x2661;">
<!ENTITY clubs "&#x2663;"> <!ENTITY clubsuit "&#x2663;">
<!ENTITY diamondsuit "&#x2666;"> <!ENTITY diams "&#x2666;">
<!ENTITY sung "&#x266A;">
<!ENTITY flat "&#x266D;">
<!ENTITY natur "&#x266E;"> 
<!ENTITY natural "&#x266E;">
<!ENTITY sharp "&#x266F;">
<!ENTITY check "&#x2713;"> <!ENTITY checkmark "&#x2713;">
<!ENTITY cross "&#x2717;">
<!ENTITY malt "&#x2720;"> <!ENTITY maltese "&#x2720;">
<!ENTITY sext "&#x2736;">
<!ENTITY lang "&#x3008;"> <!ENTITY langle "&#x3008;"> <!ENTITY LeftAngleBracket "&#x3008;">
<!ENTITY rang "&#x3009;"> <!ENTITY rangle "&#x3009;"> <!ENTITY RightAngleBracket "&#x3009;">
<!ENTITY Lang "&#x300A;">
<!ENTITY Rang "&#x300B;">
<!ENTITY lbbrk "&#x3014;">
<!ENTITY rbbrk "&#x3015;">
<!ENTITY loang "&#x3018;">
<!ENTITY roang "&#x3019;">
<!ENTITY LeftDoubleBracket "&#x301A;"> <!ENTITY lobrk "&#x301A;">
<!ENTITY RightDoubleBracket "&#x301B;"> <!ENTITY robrk "&#x301B;">
<!ENTITY DoubleLongLeftArrow "&#xE200;"> <!ENTITY Longleftarrow "&#xE200;"> <!ENTITY xlArr "&#xE200;">
<!ENTITY LongLeftArrow "&#xE201;"> <!ENTITY longleftarrow "&#xE201;"> <!ENTITY xlarr "&#xE201;">
<!ENTITY DoubleLongLeftRightArrow "&#xE202;"> <!ENTITY Longleftrightarrow "&#xE202;"> <!ENTITY xhArr "&#xE202;">
<!ENTITY LongLeftRightArrow "&#xE203;"> <!ENTITY longleftrightarrow "&#xE203;"> <!ENTITY xharr "&#xE203;">
<!ENTITY DoubleLongRightArrow "&#xE204;"> <!ENTITY Longrightarrow "&#xE204;"> <!ENTITY xrArr "&#xE204;">
<!ENTITY LongRightArrow "&#xE205;"> <!ENTITY longrightarrow "&#xE205;"> <!ENTITY xrarr "&#xE205;">
<!ENTITY lBarr "&#xE206;">
<!ENTITY ac "&#xE207;"> <!ENTITY dbkarow "&#xE207;"> <!ENTITY rBarr "&#xE207;">
<!ENTITY longmapsto "&#xE208;"> <!ENTITY xmap "&#xE208;">
<!ENTITY drbkarow "&#xE209;"> <!ENTITY RBarr "&#xE209;">
<!ENTITY hkswarow "&#xE20A;"> <!ENTITY swarhk "&#xE20A;">
<!ENTITY hksearow "&#xE20B;"> <!ENTITY searhk "&#xE20B;">
<!ENTITY nwarhk "&#xE20C;">
<!ENTITY nearhk "&#xE20D;">
<!ENTITY nesear "&#xE20E;"> <!ENTITY toea "&#xE20E;">
<!ENTITY seswar "&#xE20F;"> <!ENTITY tosa "&#xE20F;">
<!ENTITY swnwar "&#xE210;">
<!ENTITY nwnear "&#xE211;">
<!ENTITY Map "&#xE212;">
<!ENTITY lfisht "&#xE214;">
<!ENTITY rfisht "&#xE215;">
<!ENTITY DownArrowUpArrow "&#xE216;"> <!ENTITY duarr "&#xE216;">
<!ENTITY duhar "&#xE217;"> <!ENTITY ReverseUpEquilibrium "&#xE217;">
<!ENTITY udhar "&#xE218;"> <!ENTITY UpEquilibrium "&#xE218;">
<!ENTITY rdca "&#xE219;">
<!ENTITY ldca "&#xE21A;">
<!ENTITY nrarrw "&#xE21B;">
<!ENTITY rarrc "&#xE21C;">
<!ENTITY nrarrc "&#xE21D;">
<!ENTITY rarrpl "&#xE21E;">
<!ENTITY larrbfs "&#xE220;">
<!ENTITY rarrbfs "&#xE221;">
<!ENTITY larrfs "&#xE222;">
<!ENTITY rarrfs "&#xE223;">
<!ENTITY rHar "&#xE224;">
<!ENTITY lHar "&#xE225;">
<!ENTITY uHar "&#xE226;">
<!ENTITY dHar "&#xE227;">
<!ENTITY ldrushar "&#xE228;">
<!ENTITY lurdshar "&#xE229;">
<!ENTITY ruluhar "&#xE22A;">
<!ENTITY luruhar "&#xE22B;">
<!ENTITY ldrdhar "&#xE22C;">
<!ENTITY rdldhar "&#xE22D;">
<!ENTITY lharul "&#xE22E;">
<!ENTITY lrhard "&#xE22F;">
<!ENTITY rharul "&#xE230;">
<!ENTITY llhard "&#xE231;">
<!ENTITY ShortRightArrow "&#xE232;"> <!ENTITY srarr "&#xE232;">
<!ENTITY ShortLeftArrow "&#xE233;"> <!ENTITY slarr "&#xE233;">
<!ENTITY simrarr "&#xE234;">
<!ENTITY rarrap "&#xE235;">
<!ENTITY erarr "&#xE236;">
<!ENTITY Uarrocir "&#xE237;">
<!ENTITY DDotrahd "&#xE238;">
<!ENTITY Rarrtl "&#xE239;">
<!ENTITY rAtail "&#xE23B;">
<!ENTITY latail "&#xE23C;">
<!ENTITY lAtail "&#xE23D;">
<!ENTITY cudarrl "&#xE23E;">
<!ENTITY larrpl "&#xE23F;">
<!ENTITY harrcir "&#xE240;">
<!ENTITY roarr "&#xE241;">
<!ENTITY loarr "&#xE242;">
<!ENTITY hoarr "&#xE243;">
<!ENTITY zigrarr "&#xE244;">
<!ENTITY angzarr "&#xE248;">
<!ENTITY curarrm "&#xE249;">
<!ENTITY cularrp "&#xE24A;">
<!ENTITY ufisht "&#xE24B;">
<!ENTITY dfisht "&#xE24C;">
<!ENTITY rarrsim "&#xE24D;">
<!ENTITY larrsim "&#xE24E;">
<!ENTITY midcir "&#xE24F;">
<!ENTITY cirmid "&#xE250;">
<!ENTITY amalg "&#xE251;">
<!ENTITY intprod "&#xE259;"> <!ENTITY iprod "&#xE259;">
<!ENTITY plusdu "&#xE25A;">
<!ENTITY minusdu "&#xE25B;">
<!ENTITY loplus "&#xE25C;">
<!ENTITY roplus "&#xE25D;">
<!ENTITY lotimes "&#xE25E;">
<!ENTITY rotimes "&#xE25F;">
<!ENTITY ohbar "&#xE260;">
<!ENTITY capdot "&#xE261;">
<!ENTITY subdot "&#xE262;">
<!ENTITY supdot "&#xE263;">
<!ENTITY smashp "&#xE264;">
<!ENTITY wedbar "&#xE265;">
<!ENTITY pluscir "&#xE266;">
<!ENTITY pluse "&#xE267;">
<!ENTITY eplus "&#xE268;">
<!ENTITY plustwo "&#xE269;">
<!ENTITY plusacir "&#xE26A;">
<!ENTITY simplus "&#xE26B;">
<!ENTITY plussim "&#xE26C;">
<!ENTITY timesd "&#xE26D;">
<!ENTITY cupcap "&#xE26E;">
<!ENTITY capcup "&#xE26F;">
<!ENTITY cupbrcap "&#xE270;">
<!ENTITY capbrcup "&#xE271;">
<!ENTITY cupcup "&#xE272;">
<!ENTITY capcap "&#xE273;">
<!ENTITY cups "&#xE274;">
<!ENTITY caps "&#xE275;">
<!ENTITY sqcups "&#xE276;">
<!ENTITY sqcaps "&#xE277;">
<!ENTITY ccups "&#xE278;">
<!ENTITY ccaps "&#xE279;">
<!ENTITY ccupssm "&#xE27A;">
<!ENTITY triplus "&#xE27B;">
<!ENTITY triminus "&#xE27C;">
<!ENTITY tritime "&#xE27D;">
<!ENTITY trisb "&#xE27E;">
<!ENTITY solb "&#xE27F;">
<!ENTITY bsolb "&#xE280;">
<!ENTITY capand "&#xE281;">
<!ENTITY cupor "&#xE282;">
<!ENTITY ncup "&#xE283;">
<!ENTITY ncap "&#xE284;">
<!ENTITY odiv "&#xE285;">
<!ENTITY odsold "&#xE286;">
<!ENTITY ofcir "&#xE287;">
<!ENTITY olt "&#xE288;">
<!ENTITY ogt "&#xE289;">
<!ENTITY opar "&#xE28A;">
<!ENTITY operp "&#xE28B;">
<!ENTITY Otimes "&#xE28C;">
<!ENTITY otimesas "&#xE28D;">
<!ENTITY timesbar "&#xE28E;">
<!ENTITY acE "&#xE290;">
<!ENTITY rpargt "&#xE291;">
<!ENTITY lparlt "&#xE292;">
<!ENTITY rmoust "&#xE293;"> <!ENTITY rmoustache "&#xE293;">
<!ENTITY lmoust "&#xE294;"> <!ENTITY lmoustache "&#xE294;">
<!ENTITY ltrPar "&#xE295;">
<!ENTITY gtlPar "&#xE296;">
<!ENTITY langd "&#xE297;">
<!ENTITY rangd "&#xE298;">
<!ENTITY lbrke "&#xE299;">
<!ENTITY rbrke "&#xE29A;">
<!ENTITY lbrkslu "&#xE29B;">
<!ENTITY rbrksld "&#xE29C;">
<!ENTITY lbrksld "&#xE29D;">
<!ENTITY rbrkslu "&#xE29E;">
<!ENTITY gnap "&#xE29F;"> <!ENTITY gnapprox "&#xE29F;">
<!ENTITY gvertneqq "&#xE2A1;"> <!ENTITY gvnE "&#xE2A1;">
<!ENTITY lnap "&#xE2A2;"> <!ENTITY lnapprox "&#xE2A2;">
<!ENTITY lvertneqq "&#xE2A4;"> <!ENTITY lvnE "&#xE2A4;">
<!ENTITY nge "&#xE2A6;"> <!ENTITY ngeq "&#xE2A6;"> <!ENTITY NotGreaterEqual "&#xE2A6;">
<!ENTITY nle "&#xE2A7;"> <!ENTITY nleq "&#xE2A7;"> <!ENTITY NotLessEqual "&#xE2A7;">
<!ENTITY nshortmid "&#xE2AA;"> <!ENTITY nsmid "&#xE2AA;">
<!ENTITY nshortparallel "&#xE2AB;"> <!ENTITY nspar "&#xE2AB;">
<!ENTITY precneqq "&#xE2B3;"> <!ENTITY prnE "&#xE2B3;">
<!ENTITY scnE "&#xE2B5;"> <!ENTITY succneqq "&#xE2B5;">
<!ENTITY varsubsetneqq "&#xE2B8;"> <!ENTITY vsubnE "&#xE2B8;">
<!ENTITY varsubsetneq "&#xE2B9;"> <!ENTITY vsubne "&#xE2B9;">
<!ENTITY varsupsetneq "&#xE2BA;"> <!ENTITY vsupne "&#xE2BA;">
<!ENTITY varsupsetneqq "&#xE2BB;"> <!ENTITY vsupnE "&#xE2BB;">
<!ENTITY napid "&#xE2BC;">
<!ENTITY ncongdot "&#xE2C5;">
<!ENTITY nvap "&#xE2C6;">
<!ENTITY napE "&#xE2C7;">
<!ENTITY parsim "&#xE2C8;">
<!ENTITY nLt "&#xE2C9;">
<!ENTITY nGt "&#xE2CA;">
<!ENTITY nLtv "&#xE2CB;"> <!ENTITY NotLessLess "&#xE2CB;">
<!ENTITY nGtv "&#xE2CC;"> <!ENTITY NotGreaterGreater "&#xE2CC;">
<!ENTITY nLl "&#xE2CD;">
<!ENTITY nGg "&#xE2CE;">
<!ENTITY nvrtrie "&#xE2CF;">
<!ENTITY nvltrie "&#xE2D0;">
<!ENTITY rnmid "&#xE2D1;">
<!ENTITY empty "&#xE2D3;"> <!ENTITY emptyset "&#xE2D3;">
<!ENTITY jmath "&#xE2D4;">
<!ENTITY hbar "&#xE2D5;"> <!ENTITY plank "&#xE2D5;">
<!ENTITY ange "&#xE2D6;">
<!ENTITY range "&#xE2D7;">
<!ENTITY nang "&#xE2D8;">
<!ENTITY angmsdaa "&#xE2D9;">
<!ENTITY angmsdab "&#xE2DA;">
<!ENTITY angmsdac "&#xE2DB;">
<!ENTITY angmsdad "&#xE2DC;">
<!ENTITY angmsdae "&#xE2DD;">
<!ENTITY angmsdaf "&#xE2DE;">
<!ENTITY angmsdag "&#xE2DF;">
<!ENTITY angmsdah "&#xE2E0;">
<!ENTITY angrtvbd "&#xE2E1;">
<!ENTITY urtri "&#xE2E2;">
<!ENTITY lrtri "&#xE2E3;">
<!ENTITY ultri "&#xE2E4;">
<!ENTITY lltri "&#xE2E5;">
<!ENTITY boxbox "&#xE2E6;">
<!ENTITY demptyv "&#xE2E7;">
<!ENTITY cemptyv "&#xE2E8;">
<!ENTITY raemptyv "&#xE2E9;">
<!ENTITY laemptyv "&#xE2EA;">
<!ENTITY vzigzag "&#xE2EB;">
<!ENTITY trpezium "&#xE2EC;">
<!ENTITY bsemi "&#xE2ED;">
<!ENTITY bbrk "&#xE2EE;">
<!ENTITY tbrk "&#xE2EF;">
<!ENTITY geqslant "&#xE2F6;"> <!ENTITY ges "&#xE2F6;"> <!ENTITY GreaterSlantEqual "&#xE2F6;">
<!ENTITY GreaterGreater "&#xE2F7;">
<!ENTITY leqslant "&#xE2FA;"> <!ENTITY les "&#xE2FA;"> <!ENTITY LessSlantEqual "&#xE2FA;">
<!ENTITY LessLess "&#xE2FB;">
<!ENTITY prE "&#xE2FE;"> <!ENTITY pre "&#xE2FE;"> <!ENTITY PrecedesEqual "&#xE2FE;"> <!ENTITY preceq "&#xE2FE;">
<!ENTITY shortmid "&#xE301;"> <!ENTITY smid "&#xE301;">
<!ENTITY shortparallel "&#xE302;"> <!ENTITY spar "&#xE302;">
<!ENTITY thickapprox "&#xE306;"> <!ENTITY thkap "&#xE306;">
<!ENTITY ddotseq "&#xE309;"> <!ENTITY eDDot "&#xE309;">
<!ENTITY mlcp "&#xE30A;">
<!ENTITY siml "&#xE30B;">
<!ENTITY simg "&#xE30C;">
<!ENTITY Vbar "&#xE30D;">
<!ENTITY Colone "&#xE30E;">
<!ENTITY Dashv "&#xE30F;"> <!ENTITY DoubleLeftTee "&#xE30F;">
<!ENTITY vBar "&#xE310;">
<!ENTITY Barv "&#xE311;">
<!ENTITY vBarv "&#xE312;">
<!ENTITY Vdashl "&#xE313;">
<!ENTITY congdot "&#xE314;">
<!ENTITY bumpE "&#xE316;">
<!ENTITY Esim "&#xE317;">
<!ENTITY equivDD "&#xE318;">
<!ENTITY sdote "&#xE319;">
<!ENTITY mcomma "&#xE31A;">
<!ENTITY forkv "&#xE31B;">
<!ENTITY topfork "&#xE31C;">
<!ENTITY lesdot "&#xE31D;">
<!ENTITY gesdot "&#xE31E;">
<!ENTITY lesdoto "&#xE31F;">
<!ENTITY gesdoto "&#xE320;">
<!ENTITY lesdotor "&#xE321;">
<!ENTITY gesdotol "&#xE322;">
<!ENTITY elsdot "&#xE323;">
<!ENTITY egsdot "&#xE324;">
<!ENTITY ltcir "&#xE325;">
<!ENTITY gtcir "&#xE326;">
<!ENTITY el "&#xE327;">
<!ENTITY eg "&#xE328;">
<!ENTITY ltquest "&#xE329;">
<!ENTITY gtquest "&#xE32A;">
<!ENTITY lesg "&#xE32B;">
<!ENTITY gesl "&#xE32C;">
<!ENTITY lgE "&#xE32D;">
<!ENTITY glE "&#xE32E;">
<!ENTITY glj "&#xE32F;">
<!ENTITY gla "&#xE330;">
<!ENTITY lesges "&#xE331;">
<!ENTITY gesles "&#xE332;">
<!ENTITY lsime "&#xE333;">
<!ENTITY gsime "&#xE334;">
<!ENTITY lsimg "&#xE335;">
<!ENTITY gsiml "&#xE336;">
<!ENTITY simlE "&#xE337;">
<!ENTITY simgE "&#xE338;">
<!ENTITY smt "&#xE339;">
<!ENTITY lat "&#xE33A;">
<!ENTITY smte "&#xE33B;">
<!ENTITY late "&#xE33C;">
<!ENTITY smtes "&#xE33D;">
<!ENTITY lates "&#xE33E;">
<!ENTITY subrarr "&#xE33F;">
<!ENTITY suplarr "&#xE340;">
<!ENTITY subplus "&#xE341;">
<!ENTITY supplus "&#xE342;">
<!ENTITY submult "&#xE343;">
<!ENTITY supmult "&#xE344;">
<!ENTITY subsim "&#xE345;">
<!ENTITY supsim "&#xE346;">
<!ENTITY subsup "&#xE347;">
<!ENTITY supsub "&#xE348;">
<!ENTITY subsub "&#xE349;">
<!ENTITY supsup "&#xE34A;">
<!ENTITY suphsub "&#xE34B;">
<!ENTITY supdsub "&#xE34C;">
<!ENTITY bsolhsub "&#xE34D;">
<!ENTITY suphsol "&#xE34E;">
<!ENTITY subedot "&#xE34F;">
<!ENTITY supedot "&#xE350;">
<!ENTITY csub "&#xE351;">
<!ENTITY csup "&#xE352;">
<!ENTITY csube "&#xE353;">
<!ENTITY csupe "&#xE354;">
<!ENTITY ltcc "&#xE355;">
<!ENTITY gtcc "&#xE356;">
<!ENTITY lescc "&#xE357;">
<!ENTITY gescc "&#xE358;">
<!ENTITY rtriltri "&#xE359;">
<!ENTITY Pr "&#xE35C;">
<!ENTITY Sc "&#xE35D;">
<!ENTITY ltlarr "&#xE35E;">
<!ENTITY gtrarr "&#xE35F;">
<!ENTITY iff "&#xE365;">
<!ENTITY andand "&#xE36E;">
<!ENTITY oror "&#xE36F;">
<!ENTITY notinva "&#xE370;">
<!ENTITY qprime "&#xE371;">
<!ENTITY iinfin "&#xE372;">
<!ENTITY And "&#xE374;">
<!ENTITY Or "&#xE375;">
<!ENTITY pointint "&#xE376;">
<!ENTITY quatint "&#xE377;">
<!ENTITY iiiint "&#xE378;"> <!ENTITY qint "&#xE378;">
<!ENTITY lopar "&#xE379;">
<!ENTITY ropar "&#xE37A;">
<!ENTITY notinvb "&#xE37B;">
<!ENTITY notinvc "&#xE37C;">
<!ENTITY notnivb "&#xE37D;">
<!ENTITY notnivc "&#xE37E;">
<!ENTITY strns "&#xE380;">
<!ENTITY fltns "&#xE381;">
<!ENTITY parsl "&#xE382;">
<!ENTITY topcir "&#xE383;">
<!ENTITY eparsl "&#xE384;">
<!ENTITY smeparsl "&#xE385;">
<!ENTITY eqvparsl "&#xE386;">
<!ENTITY bnequiv "&#xE387;">
<!ENTITY bne "&#xE388;">
<!ENTITY nparsl "&#xE389;">
<!ENTITY nedot "&#xE38A;">
<!ENTITY simdot "&#xE38B;">
<!ENTITY apacir "&#xE38C;">
<!ENTITY nhpar "&#xE38D;">
<!ENTITY nvinfin "&#xE38E;">
<!ENTITY npart "&#xE390;">
<!ENTITY andv "&#xE391;">
<!ENTITY orv "&#xE392;">
<!ENTITY ord "&#xE393;">
<!ENTITY andd "&#xE394;">
<!ENTITY cirfnint "&#xE395;">
<!ENTITY fpartint "&#xE396;">
<!ENTITY rppolint "&#xE397;">
<!ENTITY scpolint "&#xE398;">
<!ENTITY npolint "&#xE399;">
<!ENTITY intlarhk "&#xE39A;">
<!ENTITY awint "&#xE39B;">
<!ENTITY isindot "&#xE39C;">
<!ENTITY notindot "&#xE39D;">
<!ENTITY isinE "&#xE39E;">
<!ENTITY disin "&#xE3A0;">
<!ENTITY nisd "&#xE3A1;">
<!ENTITY isinsv "&#xE3A2;">
<!ENTITY xnis "&#xE3A3;">
<!ENTITY isins "&#xE3A4;">
<!ENTITY nis "&#xE3A5;">
<!ENTITY acd "&#xE3A6;">
<!ENTITY elinters "&#xE3A7;">
<!ENTITY olcross "&#xE3A8;">
<!ENTITY dsol "&#xE3A9;">
<!ENTITY dwangle "&#xE3AA;">
<!ENTITY uwangle "&#xE3AB;">
<!ENTITY Not "&#xE3AC;">
<!ENTITY bNot "&#xE3AD;">
<!ENTITY orslope "&#xE3AE;">
<!ENTITY fjlig "&#xE3B2;">
<!ENTITY cudarrr "&#xE400;">
<!ENTITY lbarr "&#xE402;">
<!ENTITY bkarow "&#xE405;"> <!ENTITY rbarr "&#xE405;">
<!ENTITY olcir "&#xE409;">
<!ENTITY omid "&#xE40A;">
<!ENTITY race "&#xE40C;">
<!ENTITY nvsim "&#xE415;">
<!ENTITY solbar "&#xE416;">
<!ENTITY angrtvb "&#xE418;">
<!ENTITY bbrktbrk "&#xE419;">
<!ENTITY bemptyv "&#xE41A;">
<!ENTITY cirE "&#xE41B;">
<!ENTITY cirscir "&#xE41C;">
<!ENTITY thicksim "&#xE429;"> <!ENTITY thksim "&#xE429;">
<!ENTITY Aopf "&#xE500;">
<!ENTITY Bopf "&#xE501;">
<!ENTITY Dopf "&#xE503;">
<!ENTITY Eopf "&#xE504;">
<!ENTITY Fopf "&#xE505;">
<!ENTITY Gopf "&#xE506;">
<!ENTITY Hopf "&#xE507;">
<!ENTITY Iopf "&#xE508;">
<!ENTITY Jopf "&#xE509;">
<!ENTITY andslope "&#xE50A;"> <!ENTITY Kopf "&#xE50A;">
<!ENTITY imped "&#xE50B;"> <!ENTITY Lopf "&#xE50B;">
<!ENTITY infintie "&#xE50C;"> <!ENTITY Mopf "&#xE50C;">
<!ENTITY notinE "&#xE50D;">
<!ENTITY Oopf "&#xE50E;">
<!ENTITY Sopf "&#xE512;">
<!ENTITY Topf "&#xE513;">
<!ENTITY Uopf "&#xE514;">
<!ENTITY Vopf "&#xE515;">
<!ENTITY Wopf "&#xE516;">
<!ENTITY Xopf "&#xE517;">
<!ENTITY Yopf "&#xE518;">
<!ENTITY Ascr "&#xE520;">
<!ENTITY Cscr "&#xE522;">
<!ENTITY Dscr "&#xE523;">
<!ENTITY Gscr "&#xE526;">
<!ENTITY Jscr "&#xE529;">
<!ENTITY Kscr "&#xE52A;">
<!ENTITY Nscr "&#xE52D;">
<!ENTITY Oscr "&#xE52E;">
<!ENTITY Pscr "&#xE52F;">
<!ENTITY Qscr "&#xE530;">
<!ENTITY Rscr "&#xE531;">
<!ENTITY Sscr "&#xE532;">
<!ENTITY Tscr "&#xE533;">
<!ENTITY Uscr "&#xE534;">
<!ENTITY Vscr "&#xE535;">
<!ENTITY Wscr "&#xE536;">
<!ENTITY Xscr "&#xE537;">
<!ENTITY Yscr "&#xE538;">
<!ENTITY Zscr "&#xE539;">
<!ENTITY ascr "&#xE540;">
<!ENTITY bscr "&#xE541;">
<!ENTITY cscr "&#xE542;">
<!ENTITY dscr "&#xE543;">
<!ENTITY fscr "&#xE545;">
<!ENTITY gscr "&#xE546;">
<!ENTITY hscr "&#xE547;">
<!ENTITY iscr "&#xE548;">
<!ENTITY jscr "&#xE549;">
<!ENTITY kscr "&#xE54A;">
<!ENTITY lscr "&#xE54B;">
<!ENTITY mscr "&#xE54C;">
<!ENTITY nscr "&#xE54D;">
<!ENTITY pscr "&#xE54F;">
<!ENTITY qscr "&#xE550;">
<!ENTITY rscr "&#xE551;">
<!ENTITY sscr "&#xE552;">
<!ENTITY tscr "&#xE553;">
<!ENTITY uscr "&#xE554;">
<!ENTITY vscr "&#xE555;">
<!ENTITY wscr "&#xE556;">
<!ENTITY xscr "&#xE557;">
<!ENTITY yscr "&#xE558;">
<!ENTITY zscr "&#xE559;">
<!ENTITY Afr "&#xE560;">
<!ENTITY Bfr "&#xE561;">
<!ENTITY Cfr "&#xE562;">
<!ENTITY Dfr "&#xE563;">
<!ENTITY Efr "&#xE564;">
<!ENTITY Ffr "&#xE565;">
<!ENTITY Gfr "&#xE566;">
<!ENTITY Jfr "&#xE569;">
<!ENTITY Kfr "&#xE56A;">
<!ENTITY Lfr "&#xE56B;">
<!ENTITY Mfr "&#xE56C;">
<!ENTITY Nfr "&#xE56D;">
<!ENTITY Ofr "&#xE56E;">
<!ENTITY Pfr "&#xE56F;">
<!ENTITY Qfr "&#xE570;">
<!ENTITY Sfr "&#xE572;">
<!ENTITY Tfr "&#xE573;">
<!ENTITY Ufr "&#xE574;">
<!ENTITY Vfr "&#xE575;">
<!ENTITY Wfr "&#xE576;">
<!ENTITY Xfr "&#xE577;">
<!ENTITY Yfr "&#xE578;">
<!ENTITY Zfr "&#xE579;">
<!ENTITY afr "&#xE580;">
<!ENTITY bfr "&#xE581;">
<!ENTITY cfr "&#xE582;">
<!ENTITY dfr "&#xE583;">
<!ENTITY efr "&#xE584;">
<!ENTITY ffr "&#xE585;">
<!ENTITY gfr "&#xE586;">
<!ENTITY hfr "&#xE587;">
<!ENTITY ifr "&#xE588;">
<!ENTITY jfr "&#xE589;">
<!ENTITY kfr "&#xE58A;">
<!ENTITY lfr "&#xE58B;">
<!ENTITY mfr "&#xE58C;">
<!ENTITY nfr "&#xE58D;">
<!ENTITY ofr "&#xE58E;">
<!ENTITY pfr "&#xE58F;">
<!ENTITY qfr "&#xE590;">
<!ENTITY rfr "&#xE591;">
<!ENTITY sfr "&#xE592;">
<!ENTITY tfr "&#xE593;">
<!ENTITY ufr "&#xE594;">
<!ENTITY vfr "&#xE595;">
<!ENTITY wfr "&#xE596;">
<!ENTITY xfr "&#xE597;">
<!ENTITY yfr "&#xE598;">
<!ENTITY zfr "&#xE599;">
<!ENTITY NotPrecedesEqual "&#xE5DC;"> <!ENTITY npre "&#xE5DC;"> <!ENTITY npreceq "&#xE5DC;">
<!ENTITY NotSucceedsEqual "&#xE5F1;"> <!ENTITY nsce "&#xE5F1;"> <!ENTITY nsucceq "&#xE5F1;">
<!ENTITY NotSquareSubset "&#xE604;">
<!ENTITY NotSquareSuperset "&#xE615;">
<!ENTITY nbump "&#xE616;"> <!ENTITY NotHumpDownHump "&#xE616;">
<!ENTITY Cross "&#xE619;">
<!ENTITY b.alpha "&#xE700;">
<!ENTITY b.beta "&#xE701;">
<!ENTITY b.gamma "&#xE702;">
<!ENTITY b.Gamma "&#xE703;">
<!ENTITY b.gammad "&#xE704;">
<!ENTITY b.Gammad "&#xE705;">
<!ENTITY b.delta "&#xE706;">
<!ENTITY b.Delta "&#xE707;">
<!ENTITY b.epsi "&#xE708;">
<!ENTITY b.epsiv "&#xE709;">
<!ENTITY b.zeta "&#xE70B;">
<!ENTITY b.eta "&#xE70C;">
<!ENTITY b.thetas "&#xE70D;">
<!ENTITY b.Theta "&#xE70E;">
<!ENTITY b.thetav "&#xE70F;">
<!ENTITY b.iota "&#xE710;">
<!ENTITY b.kappa "&#xE711;">
<!ENTITY b.kappav "&#xE712;">
<!ENTITY b.lambda "&#xE713;">
<!ENTITY b.Lambda "&#xE714;">
<!ENTITY b.mu "&#xE715;">
<!ENTITY b.nu "&#xE716;">
<!ENTITY b.xi "&#xE717;">
<!ENTITY b.Xi "&#xE718;">
<!ENTITY b.pi "&#xE719;">
<!ENTITY b.Pi "&#xE71A;">
<!ENTITY b.piv "&#xE71B;">
<!ENTITY b.rho "&#xE71C;">
<!ENTITY b.rhov "&#xE71D;">
<!ENTITY b.sigma "&#xE71E;">
<!ENTITY b.Sigma "&#xE71F;">
<!ENTITY b.sigmav "&#xE720;">
<!ENTITY b.tau "&#xE721;">
<!ENTITY b.upsi "&#xE722;">
<!ENTITY b.Upsilon "&#xE723;">
<!ENTITY b.phis "&#xE724;">
<!ENTITY b.Phi "&#xE725;">
<!ENTITY b.phiv "&#xE726;">
<!ENTITY b.chi "&#xE727;">
<!ENTITY b.psi "&#xE728;">
<!ENTITY b.Psi "&#xE729;">
<!ENTITY b.omega "&#xE72A;">
<!ENTITY b.Omega "&#xE72B;">
<!ENTITY backepsilon "&#xE800;"> <!ENTITY bepsi "&#xE800;">
<!ENTITY blacklozenge "&#xE80B;"> <!ENTITY lozf "&#xE80B;">
<!ENTITY NotSucceedsTilde "&#xE837;">
<!ENTITY ovbar "&#xE838;">
<!ENTITY smallsetminus "&#xE844;"> <!ENTITY ssetmn "&#xE844;">
<!ENTITY nbumpe "&#xE84D;"> <!ENTITY NotHumpEqual "&#xE84D;">
<!ENTITY nesim "&#xE84E;"> <!ENTITY NotEqualTilde "&#xE84E;">
<!ENTITY LeftSkeleton "&#xE850;">
<!ENTITY RightSkeleton "&#xE851;">
<!ENTITY HorizontalLine "&#xE859;">
<!ENTITY VerticalLine "&#xE85A;">
<!ENTITY Assign "&#xE85B;">
<!ENTITY VerticalSeparator "&#xE85C;">
<!ENTITY ShortDownArrow "&#xE87F;">
<!ENTITY ShortUpArrow "&#xE880;">
<!ENTITY IndentingNewLine "&#xE891;">
<!ENTITY NoBreak "&#xE892;">
<!ENTITY GoodBreak "&#xE893;">
<!ENTITY BadBreak "&#xE894;">
<!ENTITY ThickSpace "&#xE897;">
<!ENTITY NegativeVeryThinSpace "&#xE898;">
<!ENTITY NegativeThinSpace "&#xE899;">
<!ENTITY NegativeMediumSpace "&#xE89A;">
<!ENTITY NegativeThickSpace "&#xE89B;">
<!ENTITY ic "&#xE89C;"> 
<!ENTITY InvisibleComma "&#xE89C;">
<!ENTITY InvisibleTimes "&#xE89E;"> 
<!ENTITY it "&#xE89E;">
<!ENTITY af "&#xE8A0;"> 
<!ENTITY ApplyFunction "&#xE8A0;">
<!ENTITY false "&#xE8A7;">
<!ENTITY NotANumber "&#xE8AA;">
<!ENTITY true "&#xE8AB;">
<!ENTITY LeftTriangleBar "&#xF410;">
<!ENTITY RightTriangleBar "&#xF411;">
<!ENTITY NotLeftTriangleBar "&#xF412;">
<!ENTITY NotRightTriangleBar "&#xF413;">
<!ENTITY NotNestedLessLess "&#xF423;">
<!ENTITY NotNestedGreaterGreater "&#xF428;">
<!ENTITY Equal "&#xF431;">
<!ENTITY UpArrowBar "&#xF503;">
<!ENTITY DownArrowBar "&#xF504;">
<!ENTITY LeftRightVector "&#xF505;">
<!ENTITY LeftVectorBar "&#xF507;">
<!ENTITY RightVectorBar "&#xF508;">
<!ENTITY LeftTeeVector "&#xF509;">
<!ENTITY RightTeeVector "&#xF50A;">
<!ENTITY DownLeftRightVector "&#xF50B;">
<!ENTITY DownLeftVectorBar "&#xF50C;">
<!ENTITY DownRightVectorBar "&#xF50D;">
<!ENTITY DownLeftTeeVector "&#xF50E;">
<!ENTITY DownRightTeeVector "&#xF50F;">
<!ENTITY RightUpDownVector "&#xF510;">
<!ENTITY RightUpVectorBar "&#xF511;">
<!ENTITY RightDownVectorBar "&#xF512;">
<!ENTITY RightUpTeeVector "&#xF513;">
<!ENTITY RightDownTeeVector "&#xF514;">
<!ENTITY LeftUpDownVector "&#xF515;">
<!ENTITY LeftUpVectorBar "&#xF516;">
<!ENTITY LeftDownVectorBar "&#xF517;">
<!ENTITY LeftUpTeeVector "&#xF518;">
<!ENTITY LeftDownTeeVector "&#xF519;">
<!ENTITY RuleDelayed "&#xF51F;">
<!ENTITY RoundImplies "&#xF524;">
<!ENTITY EmptySmallSquare "&#xF527;">
<!ENTITY FilledSmallSquare "&#xF528;">
<!ENTITY FilledVerySmallSquare "&#xF529;">
<!ENTITY EmptyVerySmallSquare "&#xF530;">
<!ENTITY LeftBracketingBar "&#xF603;">
<!ENTITY RightBracketingBar "&#xF604;">
<!ENTITY LeftDoubleBracketingBar "&#xF605;">
<!ENTITY RightDoubleBracketingBar "&#xF606;">
<!ENTITY OverParenthesis "&#xF610;">
<!ENTITY UnderParenthesis "&#xF611;">
<!ENTITY OverBrace "&#xF612;">
<!ENTITY UnderBrace "&#xF613;">
<!ENTITY OverBracket "&#xF614;">
<!ENTITY UnderBracket "&#xF615;">
<!ENTITY CapitalDifferentialD "&#xF74B;"> <!ENTITY DD "&#xF74B;">
<!ENTITY dd "&#xF74C;"> <!ENTITY DifferentialD "&#xF74C;">
<!ENTITY ee "&#xF74D;"> <!ENTITY ExponentialE "&#xF74D;">
<!ENTITY ii "&#xF74E;"> <!ENTITY ImaginaryI "&#xF74E;">
<!ENTITY fflig "&#xFB00;">
<!ENTITY filig "&#xFB01;">
<!ENTITY fllig "&#xFB02;">
<!ENTITY ffilig "&#xFB03;">
<!ENTITY ffllig "&#xFB04;">




]>

<xsl:stylesheet 
  xmlns:om="http://www.openmath.org/OpenMath"
  xmlns:math="http://www.w3.org/1998/Math/MathML"
  xmlns="http://www.w3.org/1998/Math/MathML"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
 version="1.0">

<!--

  $Id: omobj-pmml.xsl 8010 2008-09-07 19:29:43Z kohlhase $

  Stylesheet that transforms OMOBJs to Presentation MathML

  -->

<xsl:output method="xml"/>

<!--

   om:OMOBJ

  -->

<xsl:template match="om:OMOBJ">
 <math:math xmlns="http://www.w3.org/1998/Math/MathML" mode="inline">
  <xsl:apply-templates/>
 </math:math>
</xsl:template>




<!--   om:OMA   -->


<xsl:template match="om:OMA">
  <xsl:param name="p" select="0"/>
  <mrow>
    <xsl:apply-templates select="*[1]">
      <xsl:with-param name="p" select="$p"/>
    </xsl:apply-templates>
  </mrow>
</xsl:template>

<xsl:template match="om:OMSTR">
  <mtext>
    <xsl:value-of select="."/>
  </mtext>
</xsl:template>


<!--

   om:OMI

  -->
<xsl:template match="om:OMI">
 <mn><xsl:apply-templates/></mn>
</xsl:template>

<xsl:template match="om:OMF">
  <mn>
    <xsl:value-of select="@dec"/>
  </mn>
</xsl:template>


<!--

   om:OMS

  -->
<xsl:template match="om:OMS">
   <mrow>
  <mi><xsl:value-of select="@name"/></mi>
  <xsl:if test="parent::om:OMA and not(preceding-sibling::*)">
  <!-- <mo>&ApplyFunction;</mo> -->
  <mrow>
  <mo>(</mo>
  <xsl:for-each select="following-sibling::*">
   <xsl:apply-templates select="."/>
   <xsl:if test="position &lt; last()"><mo>,</mo></xsl:if>
  </xsl:for-each>
  <mo>)</mo>
  </mrow>
  </xsl:if>
  </mrow>
</xsl:template>


<!--

   om:OMV

  -->
<xsl:template match="om:OMV">
  <mrow>
  <mi><xsl:value-of select="@name"/></mi>
  <xsl:if test="parent::om:OMA and not(preceding-sibling::*)">
  <!-- <mo>!ApplyFunction;</mo> -->
  <mrow>
  <mo>(</mo>
  <xsl:for-each select="following-sibling::*">
   <xsl:apply-templates select="."/>
   <xsl:if test="position &lt; last()"><mo>,</mo></xsl:if>
  </xsl:for-each>
  <mo>)</mo>
  </mrow>
  </xsl:if>
  </mrow>
</xsl:template>



<xsl:template match="om:OMBIND">
  <xsl:param name="p" select="0"/>
  <mrow>
    <xsl:apply-templates mode="ombind" select="*[1]">
      <xsl:with-param name="p" select="$p"/>
    </xsl:apply-templates>
  </mrow>
</xsl:template>

<xsl:template match="om:OMBVAR">
  <mrow>
    <xsl:for-each select="*">
      <xsl:apply-templates select="."/>
      <xsl:if test="not(position()=last())"><mo>,</mo></xsl:if>
    </xsl:for-each>
  </mrow>
</xsl:template>

<xsl:template name="infix" >
  <xsl:param name="mo"/>
  <xsl:param name="p" select="0"/>
  <xsl:param name="this-p" select="0"/>
  <xsl:choose>
  <xsl:when test="parent::om:OMA and not(preceding-sibling::*)">
  <mrow>
  <xsl:if test="$this-p &lt; $p"><mo>(</mo></xsl:if>
  <xsl:for-each select="following-sibling::*">
   <xsl:if test="position() &gt; 1">
    <xsl:copy-of select="$mo"/>
   </xsl:if>   
   <xsl:apply-templates select=".">
     <xsl:with-param name="p" select="$this-p"/>
   </xsl:apply-templates>
  </xsl:for-each>
  <xsl:if test="$this-p &lt; $p"><mo>)</mo></xsl:if>
  </mrow>
  </xsl:when>
  <xsl:otherwise>
    <xsl:copy-of select="$mo"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="binary" >
  <xsl:param name="mo"/>
  <xsl:param name="p" select="0"/>
  <xsl:param name="this-p" select="0"/>
  <xsl:choose>
  <xsl:when test="parent::om:OMA and not(preceding-sibling::*)">
  <mrow>
  <xsl:if test="$this-p &lt; $p"><mo>(</mo></xsl:if>
   <xsl:apply-templates select="following-sibling::*[1]">
     <xsl:with-param name="p" select="$this-p"/>
   </xsl:apply-templates>
   <xsl:copy-of select="$mo"/>
   <xsl:apply-templates select="following-sibling::*[2]">
     <xsl:with-param name="p" select="$this-p"/>
   </xsl:apply-templates>
  </mrow>
  </xsl:when>
  <xsl:otherwise>
    <xsl:copy-of select="$mo"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!--

   arith1.times

<xsl:template match="om:OMA[om:OMS[@name='times' and @cd='arith1']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/>
  <mo>&InvisibleTimes;</mo>
  <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>
  -->

<xsl:template match="om:OMS[@cd='arith1' and @name='plus']"  >
  <xsl:param name="p"/>
  <xsl:choose>
  <xsl:when test="parent::om:OMA and not(preceding-sibling::*)">
  <mrow>
  <xsl:if test="1 &lt; $p"><mo>(</mo></xsl:if>
  <xsl:for-each select="following-sibling::*">
   <xsl:choose>
   <xsl:when test="position() &gt; 1 and 
             self::om:OMA/*[1][self::om:OMS[@name='unary_minus']]">
    <mo>-</mo>
   <xsl:apply-templates select="*[2]">
     <xsl:with-param name="p" select="1"/>
   </xsl:apply-templates>
   </xsl:when>
   <xsl:when test="position() &gt; 1 and 
             self::om:OMA[*[position()=1 and last()=3]
                         [self::om:OMS and @name='times']]/
              *[2][self::om:OMA]/*[1][self::om:OMS[@name='unary_minus']]">
    <mo>-</mo>
   <mrow>
   <xsl:apply-templates select="*[2]/*[2]">
   <xsl:with-param name="p" select="1"/>
   </xsl:apply-templates>
   <xsl:apply-templates select="*[3]">
     <xsl:with-param name="p" select="1"/>
   </xsl:apply-templates>
   </mrow>
   </xsl:when>
   <xsl:otherwise>
   <xsl:if test="position() &gt; 1">
    <mo>+</mo>
   </xsl:if>   
   <xsl:apply-templates select=".">
     <xsl:with-param name="p" select="1"/>
   </xsl:apply-templates>
   </xsl:otherwise>
  </xsl:choose>
  </xsl:for-each>
  <xsl:if test="1 &lt; $p"><mo>)</mo></xsl:if>
  </mrow>
  </xsl:when>
  <xsl:otherwise>
    <mo>+</mo>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="om:OMS[(@cd='arith1' or @cd='arith2') and @name='times']"  >
  <xsl:param name="p"/>
  <xsl:call-template name="infix">
    <xsl:with-param name="mo">
    <mo>
    <xsl:choose>
    <xsl:when test="following-sibling::*[not(self::om:OMI or self::om:OMF)]"
    ></xsl:when>
    <xsl:otherwise>!times;</xsl:otherwise>
    </xsl:choose>
    </mo>
   </xsl:with-param>
    <xsl:with-param name="p" select="$p"/>
    <xsl:with-param name="this-p" select="2"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="om:OMS[@cd='arith1' and @name='divide']"  >
  <xsl:param name="p"/>
  <xsl:param name="inline" select="false()"/>
  <xsl:choose>
  <xsl:when test="$inline">
   <mrow>
   <xsl:apply-templates select="following-sibling::*[1]"/>
   <mo>/</mo>
   <xsl:apply-templates select="following-sibling::*[2]"/>
   </mrow>
  </xsl:when>
  <xsl:otherwise>
  <mfrac>
   <xsl:apply-templates select="following-sibling::*[1]"/>
   <xsl:apply-templates select="following-sibling::*[2]"/>
  </mfrac>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="om:OMS[@cd='arith1' and @name='minus']"  >
  <xsl:param name="p"/>
  <xsl:call-template name="infix">
    <xsl:with-param name="mo"><mo>-</mo></xsl:with-param>
    <xsl:with-param name="p" select="$p"/>
    <xsl:with-param name="this-p" select="1"/>
  </xsl:call-template>
</xsl:template>

<!-- not really in arith1 -->

<xsl:template match="om:OMS[@cd='arith1' and @name='plusminus']"  >
  <xsl:param name="p"/>
  <xsl:call-template name="infix">
    <xsl:with-param name="mo"><mo>!PlusMinus;</mo></xsl:with-param>
    <xsl:with-param name="p" select="$p"/>
    <xsl:with-param name="this-p" select="1"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="om:OMS[@cd='arith1' and @name='unary_minus']"  >
   <mrow>
   <mo>-</mo>
   <xsl:apply-templates select="following-sibling::*[1]"/>
   </mrow>
</xsl:template>


<xsl:template match="om:OMS[@cd='arith1' and @name='power']"  >
   <msup>
   <xsl:apply-templates select="following-sibling::*[1]"/>
   <xsl:apply-templates select="following-sibling::*[2]"/>
   </msup>
</xsl:template>


<xsl:template match="om:OMS[@cd='arith1' and @name='conjugate']"  >
   <mover>
   <xsl:apply-templates select="following-sibling::*[1]"/>
   </mover>
</xsl:template>

<xsl:template match="om:OMS[@cd='arith1' and @name='abs']"  >
   <mo>|</mo>
   <xsl:apply-templates select="following-sibling::*[1]"/>
   <mo>|</mo>
</xsl:template>

<xsl:template match="om:OMS[@cd='arith1' and @name='root']"  >
   <xsl:choose>
   <xsl:when test="following-sibling::*[2]/self::om:OMI[normalize-space(.)='2']">
   <msqrt
   ><xsl:apply-templates select="following-sibling::*[1]"
   /></msqrt>
   </xsl:when>
   <xsl:otherwise>
   <msup>
   <mi other="hide">.</mi>
   <xsl:apply-templates select="following-sibling::*[2]"/>   
   </msup>
   <mi></mi>
   <msqrt
    ><xsl:apply-templates select="following-sibling::*[1]"
   /></msqrt>
   </xsl:otherwise>
   </xsl:choose>
</xsl:template>


<xsl:template
  match="om:OMS[@cd='arith1' and (@name='sum' or @name='product')]"  >
   <xsl:choose>
<!--
If the body is a lambda expression, put the bound variable in the
subscript, and just typeset the body of the lambda expression,
zap the lambda.
-->
   <xsl:when test="following-sibling::*[2]/self::om:OMBIND/*[1][self::om:OMS[@name='lambda']]">

   <xsl:choose>
<!--
If there is an explicit interval put limits top and bottom
else put range of summation at bottom
-->
   <xsl:when test="following-sibling::*[1]/self::om:OMA/*[1][self::om:OMS[@name='integer_interval']]">
   <munderover>
   <mo>
   <xsl:choose>
    <xsl:when test="@name='sum'">!sum;</xsl:when>
    <xsl:otherwise>!prod;</xsl:otherwise>
   </xsl:choose>
   </mo>
   <mrow>
   <xsl:apply-templates select="following-sibling::om:OMBIND/om:OMBVAR"/>
   <mo>=</mo>
   <xsl:apply-templates select="following-sibling::om:OMA/*[2]"/>
   </mrow>
   <xsl:apply-templates select="following-sibling::om:OMA/*[3]"/>
   </munderover>
   </xsl:when>
   <xsl:otherwise>
   <munder>
   <mo>
   <xsl:choose>
    <xsl:when test="@name='sum'">!sum;</xsl:when>
    <xsl:otherwise>!prod;</xsl:otherwise>
   </xsl:choose>
   </mo>
   <mrow>
   <xsl:apply-templates select="following-sibling::om:OMBIND/om:OMBVAR"/>
   <mo>in</mo> 
   <xsl:apply-templates select="following-sibling::*[1]"/>
   </mrow>
   </munder>
   </xsl:otherwise>
   </xsl:choose>
   <xsl:apply-templates select="following-sibling::om:OMBIND/*[3]"/>
   </xsl:when>

<!--
 No lambda
-->
   <xsl:otherwise>
   <xsl:choose>
<!--
If there is an explicit interval put limits top and bottom
else put range of summation at bottom
-->
   <xsl:when test="following-sibling::*[1]/self::om:OMA/*[1][self::om:OMS[@name='integer_interval']]">
   <munderover>
   <mo>
   <xsl:choose>
    <xsl:when test="@name='sum'">!sum;</xsl:when>
    <xsl:otherwise>!prod;</xsl:otherwise>
   </xsl:choose>
   </mo>
   <xsl:apply-templates select="following-sibling::om:OMA/*[2]"/>
   <xsl:apply-templates select="following-sibling::om:OMA/*[3]"/>
   </munderover>
   </xsl:when>
   <xsl:otherwise>
   <msub>
   <mo>
   <xsl:choose>
    <xsl:when test="@name='sum'">!sum;</xsl:when>
    <xsl:otherwise>!prod;</xsl:otherwise>
   </xsl:choose>
   </mo>
   <xsl:apply-templates select="following-sibling::*[1]"/>
   </msub>
   </xsl:otherwise>
   </xsl:choose>
   <xsl:apply-templates select="following-sibling::*[2]"/>
   </xsl:otherwise>
   </xsl:choose>

</xsl:template>

<!--

   ida:divides

  -->
<xsl:template match="om:OMA[om:OMS[@name='divides' and @cd='ida']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/>
  <mo>|</mo>
  <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>

<!--

   limit1:lim

  -->
<xsl:template  match="om:OMS[@cd='limit1' and @name='limit']"  >
  <munder>
   <mi>lim</mi>
   <mrow>
   <xsl:apply-templates select="following-sibling::om:OMBIND/om:OMBVAR"/>
   <mo>&RightArrow;</mo> 
   <xsl:apply-templates select="following-sibling::*[1]"/>
   </mrow>
   </munder>
   <xsl:apply-templates select="following-sibling::om:OMBIND/*[3]"/>
</xsl:template>

<!--

   relation1.eq

  -->
<xsl:template match="om:OMA[om:OMS[@name='eq' and @cd='relation1']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/>
  <mo>=</mo>
  <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>


<!--

   relation1.lt

  -->
<xsl:template match="om:OMA[om:OMS[@name='lt' and @cd='relation1']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/>
  <mo>&lt;</mo>
  <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>

<!--

   relation1.gt

  -->
<xsl:template match="om:OMA[om:OMS[@name='gt' and @cd='relation1']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/>
  <mo>&gt;</mo>
  <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>


<!--

   relation1.leq

  -->
<xsl:template match="om:OMA[om:OMS[@name='leq' and @cd='relation1']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/>
  <mo>&leq;</mo>
  <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>


<!--

   relation1.geq

  -->
<xsl:template match="om:OMA[om:OMS[@name='leq' and @cd='relation1']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/>
  <mo>&geq;</mo>
  <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>

<!--

   set1.set

  -->

<xsl:template match="om:OMS[@cd='set1' and @name='set']" >
<mrow>
<mo>{</mo>
<xsl:for-each  select="following-sibling::*">
 <xsl:apply-templates select="."/>
 <xsl:if test="not(position()=last())"><mo>,</mo></xsl:if>
</xsl:for-each>
<mo>}</mo>
</mrow>
</xsl:template>


<!--

   set1.in

  -->
<xsl:template match="om:OMA[om:OMS[@name='in' and @cd='set1']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/>
   <mo>&Element;</mo>
   <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>

<!--

   set1.setdiff

 -->


<xsl:template match="om:OMA[om:OMS[@name='setdiff' and @cd='set1']]">
 <mrow>
  <xsl:apply-templates select="*[2]"/> 
   <mo>&setminus;</mo>
   <xsl:apply-templates select="*[3]"/>
 </mrow>
</xsl:template>

 
!--

   nums

  -->



<xsl:template match="om:OMS[@cd='nums' and @name='e']"  >
<mi>&ExponentialE;</mi>
</xsl:template>

<xsl:template match="om:OMS[@cd='nums' and @name='i']"  >
<mi>&ImaginaryI;</mi>
</xsl:template>


<xsl:template match="om:OMS[@cd='nums' and @name='pi']"  >
<mi>&pi;</mi>
</xsl:template>

<xsl:template match="om:OMS[@cd='nums' and @name='gamma']"  >
<mi>&gamma;</mi>
</xsl:template>

<!--

   nums1.infinity

  -->
<xsl:template match="om:OMS[@name='infinity' and @cd='nums1']">
 <mrow><mo>&infin;</mo></mrow>
</xsl:template>



<!--

   setname.Z

  -->
<xsl:template match="om:OMS[@name='Z' and @cd='setname']">
 <mrow><mo>&Zopf;</mo></mrow>
</xsl:template>



<!--

   setname.N

  -->
<xsl:template match="om:OMS[@name='N' and @cd='setname']">
 <mrow><mo>&Nopf;</mo></mrow>
</xsl:template>

<!--

   setname.Q

  -->
<xsl:template match="om:OMS[@name='Q' and @cd='setname']">
 <mrow><mo>&Qopf;</mo></mrow>
</xsl:template>

<!--

   setname.R

  -->
<xsl:template match="om:OMS[@name='R' and @cd='setname']">
 <mrow><mo>&Ropf;</mo></mrow>
</xsl:template>


<!--

   setname.C

  -->
<xsl:template match="om:OMS[@name='C' and @cd='setname']">
 <mrow><mo>&Copf;</mo></mrow>
</xsl:template>

<!--

   ida.sequence

  -->

<xsl:template match="om:OMS[@cd='ida' and @name='sequence']" >
        <mrow>
        <xsl:for-each select="following-sibling::*">
        <xsl:apply-templates select="."/>
	<xsl:if test="position() &lt; last()"><mo>,</mo> </xsl:if>
	</xsl:for-each>
	</mrow>
</xsl:template>

<!--

   integer.rem

-->

<xsl:template match="om:OMA[om:OMS[@cd='integer' and @name='rem']]" >
        <mrow>
        <mi>rem</mi><mo>(</mo>
                  <xsl:apply-templates select="*[2]"/>
                <mo>, </mo>
                <xsl:apply-templates select="*[3]"/>
                <mo>)</mo>
        </mrow>
</xsl:template>


<!--
   integer.gcd

-->

<xsl:template match="om:OMA[om:OMS[@cd='integer' and @name='gcd']]" >
        <mrow>
        <mi>GCD</mi><mo>(</mo>
                  <xsl:apply-templates select="*[2]"/>
                <mo>, </mo>
                <xsl:apply-templates select="*[3]"/>
                <mo>)</mo>
        </mrow>
</xsl:template>

<!--
   interval.interval_cc

-->

<xsl:template match="om:OMS[@cd='interval' and @name='interval_cc']" >
   <mo>[</mo>
   <xsl:apply-templates select="following-sibling::*[1]"/>
   <mo>,</mo>
   <xsl:apply-templates select="following-sibling::*[2]"/>
   <mo>]</mo>
</xsl:template>


 

</xsl:stylesheet>



