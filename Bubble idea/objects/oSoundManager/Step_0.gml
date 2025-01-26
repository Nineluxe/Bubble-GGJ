/// @description More Sound Manager Logic
// Priorities: Player SFX = 1, background SFX = 2, music = 3, additional layers = 4
if room == rPlay && startMusicWasPlayed == false
{
	audio_stop_sound(mMenus);
	audio_play_sound(mStart, 3, false);
	startMusicWasPlayed = true;
	global.musicActive = false;
}
if room == rPlay && startMusicWasPlayed == true && !audio_is_playing(mStart) && global.musicActive == false
{
	audio_play_sound(mPlay85bpm, 3, true)
	global.musicActive = true;
}