extends Control

const GAME = preload("res://Game/game.tscn")

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(GAME)

func _on_quit_pressed() -> void:
	ProjectGlobals.Quit()
