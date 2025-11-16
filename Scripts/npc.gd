class_name NPC
extends CharacterBody2D

@onready var text_box: Label = $TextBox

var quest_accepted: bool = false

func interact():
	talk()
	
func talk():
	text_box.lines_skipped += 1
	if text_box.lines_skipped == text_box.get_line_count():
		quest_accepted = true
		text_box.lines_skipped = 1
