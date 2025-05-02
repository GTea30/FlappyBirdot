extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $Player.dead.connect(_on_player_dead);
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if Input.is_action_just_pressed("reset"):
        get_tree().reload_current_scene();

func _on_player_dead() -> void:
    $Ground/AnimationPlayer.pause();
    $Pipes.speed = 0;
