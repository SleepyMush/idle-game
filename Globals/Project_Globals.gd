extends Node

func Set_Pause(enable : bool):
	get_tree().paused = enable

func Quit() :
	get_tree().quit()
