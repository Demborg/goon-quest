extends Node

const SIZE = 42
const OFFSET = Vector2(95, 216)

func pixel_possition(pos: Vector2):
	return pos * SIZE + OFFSET
