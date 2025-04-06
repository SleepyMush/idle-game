extends Node

@onready var Points_Label: Label = $Scene/CanvasLayer/Points
@onready var Size_Label: Label = $Scene/CanvasLayer/Size
@onready var sphere: MeshInstance3D = $Scene/Sphere
@onready var camera: Camera3D = $Scene/Node3D/Camera3D
@onready var audio_stream_player: AudioStreamPlayer = $Scene/AudioStreamPlayer
var click_sound : AudioStreamWAV = preload("res://Audio/687105__aphom000__mouse-1-button-fast-click.wav")

var current_state = 0
enum PRESS_STATE {PRESSED, UNPRESSED}
var points : int = 0

func  _process(_delta: float) -> void:
	Size_Label.text = str("Scale : ", sphere.scale.snapped(Vector3(.1, .1, .1)))
	camera.global_position.z = lerp(camera.global_position.z,sphere.scale.z, .01)

func update_points() -> void:
	match current_state :
		PRESS_STATE.PRESSED :
			points += 1
			Points_Label.text = str(points)
			audio_stream_player.play()
			var tween = get_tree().create_tween()
			tween.tween_property(sphere,"scale",sphere.scale + (Vector3.ONE * .1), .5).set_trans(Tween.TRANS_SINE)
			tween.tween_property(sphere,"scale",Vector3.ONE, .2).set_trans(Tween.TRANS_SINE)
			current_state = PRESS_STATE.UNPRESSED
		PRESS_STATE.UNPRESSED :
			pass

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Click"):
		current_state = PRESS_STATE.PRESSED
		update_points()
