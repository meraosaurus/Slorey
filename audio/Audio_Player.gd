extends AudioStreamPlayer

const level_music= preload("res://Slorey ౨ৎ assets/music/take-a-walk-x-time-for-an-adventure.ogg")

func _play_music(music:AudioStream, volume= 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()
	
func play_music_level():
	_play_music(level_music)
