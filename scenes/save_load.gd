extends Node




func _on_button_load_button_up():
	var save_file=serializer.new()
	save_file.player.player_position=%vanessalilac.player_pos
	save_file.save_data()


func _on_button_save_button_up():
	var save_file=serializer.new()
	save_file.load_data()
	%vanessalilac.player_pos=save_file.vanessalilac.player_pos
