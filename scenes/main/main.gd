extends Node2D

@export var pipes: PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $Player.dead.connect(_on_player_dead);
    $PipeTimer.timeout.connect(_on_pipe_timer_timeout);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if Input.is_action_just_pressed("reset"):
        get_tree().reload_current_scene();
    if Input.is_action_just_pressed("exit"):
        get_tree().quit();


func _on_player_dead() -> void:
    $Ground/AnimationPlayer.pause();
    # Stop Pipes
    get_tree().call_group("pipes", "stop");


func _on_pipe_timer_timeout() -> void:
    var new_pipes: Pipes = pipes.instantiate();
    add_child(new_pipes);
    $PipeTimer.wait_time = randf_range(1.5, 2);
