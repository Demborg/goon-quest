extends Node

const SIZE = 42
const OFFSET = Vector2(93, 215)

enum Move {LEFT, RIGHT, UP, DOWN, ATTACK}

func pixel_possition(pos: Vector2):
	return pos * SIZE + OFFSET
