﻿/*
coded May 2005
by mike connor - info@rocketnumber9.com - http://rocketnumber9.com
for Agent 16

this is a .AS file for a .Fla
loader.fla loads intro.fla and layout.fla into emptymovieclips
*/
//keeps track of pinup selections
var myDownload:Array = new Array();
// the frame is not reduced at the start
var reduced:Boolean;
//route to buttons in cotrooler is convolluted so simplify it here
//route to choose the girl
var controlerFrame_mc:MovieClip = this.june_control.frame;
//route to bg buttons
var bgButtons_mc:MovieClip = this.june_control.juneBGColor;
//route to OUFIT BUTTONS
var outbitButtons_mc:MovieClip = this.june_control.juneOutfitColor;
//route to hairbuttons
var hairButtons_mc:MovieClip = this.june_control.juneHairColor;
//route toGIRL BUTTONS
var girlButtons_mc:MovieClip = june_control.junePinUp;
var download_mc:MovieClip = june_control.juneDownload;
//girl buttons
girlButtons_mc.btn_flowerGirl.onRelease = function() {
	chooseGirl("flowerGirl", "g1");
	if (reduced == true) {
		june_control.gotoAndPlay("flowerGirl");
		growFrame();
	} else {
		june_control.gotoAndStop("flowerGirl2");
	}
	//reset bg and outfit for 1st girl
	myDownload.outfit = "o2";
	myDownload.haircolor = "h1";
};
girlButtons_mc.btn_librarian.onRelease = function() {
	chooseGirl("librarian", "g3");
	if (reduced == false) {
		shrinkFrame();
		june_control.gotoAndPlay("librarian");
	} else {
		june_control.gotoAndStop("librarian2");
	}
};
girlButtons_mc.btn_frenchMaid.onRelease = function() {
	chooseGirl("frenchMaid", "g2");
	if (reduced == false) {
		june_control.gotoAndPlay("frenchMaid");
		shrinkFrame();
	} else {
		june_control.gotoAndStop("frenchMaid2");
	}
};
//girl function
function chooseGirl(girlFrame:String, girlChoice:String):Void {
	gotoAndStop(girlFrame);
	myDownload.girl = girlChoice;
	trace(myDownload.girl);
}
// play button sound on release


// download buttons
download_mc.bt_r1.onRelease = function() {
	downloadThis("r1");
};
download_mc.bt_r2.onRelease = function() {
	downloadThis("r2");
};
download_mc.bt_r3.onRelease = function() {
	downloadThis("r3");
};
download_mc.bt_r4.onRelease = function() {
	downloadThis("r4");
};
// download funciton
function downloadThis(res:String):Void {
	//trace(myDownload.girl.toString()+myDownload.bg.toString()+myDownload.outfit.toString()+res);
	if (myDownload.girl == "g2" || myDownload.girl == "g3") {
		myDownload.haircolor = "";
		myDownload.outfit = "";
		trace("girl 1 or 2");
	}
	myDownload.resolution = res;
	folderStructure = (myDownload.girl.toString()+myDownload.bg.toString()+myDownload.outfit.toString()+myDownload.haircolor+myDownload.resolution);
	trace("folderStructure "+folderStructure);
	if (myDownload.resolution == "r1") {
		getURL("wallpaper/june/1600x1200/"+folderStructure+"/June_PinUp.jpg.zip");
		trace("wallpaper/june/1600x1200/"+folderStructure+"/June_PinUp.jpg.zip");
		trace("res 1");
	}
	if (myDownload.resolution == "r2") {
		getURL("wallpaper/june/1280x960/"+folderStructure+"/June_PinUp.jpg.zip");
		trace("wallpaper/june/1600x1200/"+folderStructure+"/June_PinUp.jpg.zip");
		trace("res 2");
	}
	if (myDownload.resolution == "r3") {
		getURL("wallpaper/june/1024x768/"+folderStructure+"/June_PinUp.jpg.zip");
		trace("wallpaper/june/1600x1200/"+folderStructure+"/June_PinUp.jpg.zip");
		trace("res 3");
	}
	if (myDownload.resolution == "r4") {
		getURL("wallpaper/june/800x600/"+folderStructure+"/June_PinUp.jpg.zip");
		trace("wallpaper/june/1600x1200/"+folderStructure+"/June_PinUp.jpg.zip");
		trace("res 4");
	}
}
//music button toggle
function togglePlay(isPlaying:Boolean):Void {
	//var isPlaying:Boolean = videoDisplay.playing
	trace(isPlaying);
	playpauseClip.btn_on._visible = isPlaying;
	playpauseClip.btn_off._visible = !isPlaying;
}
playpauseClip.onRelease = function() {
	var playing:Boolean;
	if (_level0.soundtrack.playing) {
		_level0.soundtrack.stop();
		 isPlaying = false;
	} else {
		_level0.soundtrack.play();
		 isPlaying = true;
	}
	
	togglePlay(isPlaying);
};
// bg color buttons
bgButtons_mc.b1.onRelease = function() {
	bgColors.gotoAndStop("f8bc90");
	myDownload.bg = "b1";
	trace(myDownload.bg);
};
bgButtons_mc.b2.onRelease = function() {
	bgColors.gotoAndStop("f09289");
	myDownload.bg = "b2";
	trace(myDownload.bg);
};
bgButtons_mc.b3.onRelease = function() {
	bgColors.gotoAndStop("6ec8d0");
	myDownload.bg = "b3";
	trace(myDownload.bg);
};
function shrinkFrame():Void {
	//controlerFrame_mc.gotoAndPlay("frameReducing");
	reduced = true;
}
function growFrame():Void {
	//controlerFrame_mc.gotoAndPlay("frameEnlarging");
	reduced = false;
}
// OUTFIT BUTTONS
//outfit1
outbitButtons_mc.outfit1.onRelease = function() {
	flowerDress.gotoAndStop("greenDress");
	chooseOutfit("o1");
};
//outfit2
outbitButtons_mc.outfit2.onRelease = function() {
	flowerDress.gotoAndStop("dressOff");
	chooseOutfit("o2");
};
//outfit3
outbitButtons_mc.outfit3.onRelease = function() {
	flowerDress.gotoAndStop("goldDress");
	chooseOutfit("o3");
};
//outfit4
outbitButtons_mc.outfit4.onRelease = function() {
	flowerDress.gotoAndStop("blueDress");
	chooseOutfit("o4");
};
//outfit function
function chooseOutfit(outfit:String):Void {
	myDownload.outfit = (outfit);
	trace("outfit "+myDownload.outfit);
}
//HAIR COLOR BUTTONS
//HAIR 1
hairButtons_mc.hair1.onRelease = function() {
	flowerGHair.gotoAndStop("hairOff");
	chooseHair("h1", "hairOff");
};
//HAIR2
hairButtons_mc.hair2.onRelease = function() {
	flowerGHair.gotoAndStop("redHair");
	chooseHair("h2", "redHair");
};
//HAIR 3
hairButtons_mc.hair3.onRelease = function() {
	flowerGHair.gotoAndStop("blackHair");
	chooseHair("h3", "blackHair");
};
// hair function
function chooseHair(hairChoice:String, hairFrame:String):Void {
	flowerGHair.gotoAndStop(hairFrame);
	myDownload.haircolor = hairChoice;
	trace(myDownload.haircolor);
}
//NAVBAR BUTTONS
navbar_mc.btn_screensaver.onPress = function() {
	gotoAndStop("screensaver");
	navbar_mc.gotoAndStop("tab_screensaver");
	//flipVisibilty(june_control);
	june_control._visible = false;
	//disable screensaver and wallpaper buttons
	navbar_mc.btn_screensaver.enabled = false;
	navbar_mc.btn_wallpaper.enabled = true;
	screensaver_mc._visible = true;
	updateAfterEvent();
};
navbar_mc.btn_wallpaper.onPress = function() {
	//navbar_mc.btn_screensaver.enabled = true;
	//navbar_mc.btn_wallpaper.enabled = false;
	updateAfterEvent();
	customizer();
};
// CALENDAR BUTTONS
//calendarbutons_mc.month_next.onRelease  = function() {
//
//screensaver buttons
screensaver_mc.btn_mac.onRelease = function() {
	getURL("screensaver/june/june_pinup_setup.hqx");
	trace("get mac screensaver");
};
screensaver_mc.btn_pc.onRelease = function() {
	getURL("screensaver/june/june_pinup_setup.exe");
	trace("get pc screensaver");
};
function flipVisibilty(myMovieclip:MovieClip):Void {
	if (myMovieClip._visible) {
		myMovieClip._visible = false;
	} else {
		myMovieClip._visible = true;
	}
	trace("visible?? "+myMovieClip._visible);
}
function customizer():Void {
	//disable screensaver and wallpaper buttons
	navbar_mc.btn_screensaver.enabled = true;
	navbar_mc.btn_wallpaper.enabled = false;
	gotoAndStop("flowerGirl");
	//reset size of controller
	reduced = false;
	june_control._visible = true;
	//gotoAndStop("flowerGirl");
	june_control.gotoAndStop("flowerGirl2");
	navbar_mc.gotoAndStop("tab_wallpaper");
	// make calendar buttons invisible. Activate later
	//calendarbutons_mc._visible = 0;
	//_pcOrmac.visible=0;
	//reset to girl 1
	myDownload.girl = "g1";
	myDownload.bg = "b1";
	myDownload.haircolor = "h1";
	myDownload.outfit = "o2";
	//trace("start volume "+_level0.soundtrack.volume);
	screensaver_mc._visible = false;
}



function init_layout():Void {
	trace("layout movieclip loaded");
	reduced = false;
	//gotoAndStop("flowerGirl");
	june_control.gotoAndStop("flowerGirl2");
	navbar_mc.gotoAndStop("tab_wallpaper");
	// make calendar buttons invisible. Activate later
	calendarbutons_mc._visible = 0;
	//_pcOrmac.visible=0;
	//make first choice for download
	myDownload.girl = "g1";
	myDownload.bg = "b1";
	myDownload.haircolor = "h1";
	myDownload.outfit = "o2";
	//disable screensaver and wallpaper buttons
	navbar_mc.btn_screensaver.enabled = true;
	navbar_mc.btn_wallpaper.enabled = false;
	trace("start volume "+_level0.soundtrack.volume);
	screensaver_mc._visible = false;
	playpauseClip.btn_on._visible = true;
	playpauseClip.btn_off._visible = false;

	
}
init_layout();
