/// @description Sound Manager Logic
// Priorities: Player SFX = 1, background SFX = 2, music = 3, additional layers = 4

global.musicActive = false;
startMusicWasPlayed = false;


if room == rTitle || room == rMainMenu || room == rHelp && !audio_is_playing(mMenus)
{
	audio_stop_all();
	audio_play_sound(mMenus, 3, true);
}



