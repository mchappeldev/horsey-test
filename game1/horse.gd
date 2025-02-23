extends CharacterBody2D

@export var speed: int = 100
@export var jump: int
@export var strength: int

var noise = FastNoiseLite.new()
var rng = RandomNumberGenerator.new()
var race_booster = rng.randf_range(-0.01, 0.01)
const speed_factor = 20.0  # Adjust this constant to scale overall movement

func _ready() -> void:
	noise.seed = randi()
	noise.frequency = 0.1

func _physics_process(delta: float) -> void:
	var noise_val = noise.get_noise_1d(position.x)
	var multiplier = lerp(0.5, 1.5, (noise_val + 1.0) / 2.0)
	var new_speed = (speed * multiplier * delta * speed_factor) + race_booster
	position.x += new_speed
