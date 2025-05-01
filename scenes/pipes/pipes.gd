extends Node2D

@export var min_distance: int = 0;
@export var max_distance: int = 10;

@export var max_y_pos: int = 124;
@export var min_y_pos: int = 80;

@export var speed: int = 5;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    _move_pipes();
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    self.position.x -= speed * delta;
    pass

func _move_pipes() -> void:
    var distance: int = randf_range(min_distance, max_distance);
    var pos: int = randf_range(min_y_pos, max_y_pos);

    self.position.y = pos;

    $TopPipe.position.y -= distance;
    $BottomPipe.position.y += distance;
