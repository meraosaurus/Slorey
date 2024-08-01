extends CanvasModulate

const MINUTES_PER_DAY= 1440
const MINUTES_PER_HOUR= 60
const INGAME_TO_REAL_MIN_DURATION= (2*PI)/ MINUTES_PER_DAY

signal time_tick(day:int, hour:int, minutes:int) 

@export var gradient:GradientTexture1D
@export var INGAME_SPEED= 1.0
@export var INITIAL_HOUR = 12:
	set(h):
		INITIAL_HOUR = h
		time = INGAME_TO_REAL_MIN_DURATION * INITIAL_HOUR * MINUTES_PER_HOUR

var time:float=0.0
var past_minute:float= -1.0

func _ready():
	time = INGAME_TO_REAL_MIN_DURATION * INITIAL_HOUR * MINUTES_PER_HOUR

func _process(delta:float)-> void:
	time +=delta* INGAME_TO_REAL_MIN_DURATION *INGAME_SPEED
	var value=(sin(time-PI/2)+1.0)/2.0
	self.color=gradient.gradient.sample(value)
	recal_time()


func recal_time()-> void:
	var totalmin = int(time/INGAME_TO_REAL_MIN_DURATION)
	
	var day= int(totalmin/MINUTES_PER_DAY)
	
	var current_day_minutes = totalmin % MINUTES_PER_DAY
	var hour= int(current_day_minutes/MINUTES_PER_HOUR)
	var minute= int(current_day_minutes % MINUTES_PER_HOUR)
	if past_minute != minute:
		past_minute= minute
		time_tick.emit(day, hour, minute)
