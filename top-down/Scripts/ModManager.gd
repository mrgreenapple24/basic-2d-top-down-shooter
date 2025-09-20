extends Node

const MOD_TEXTURE_DIR = "user://mods/textures/"
var mod_textures: Dictionary  = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not DirAccess.dir_exists_absolute(MOD_TEXTURE_DIR):
		DirAccess.make_dir_recursive_absolute(MOD_TEXTURE_DIR)
	get_viewport().canvas_item_default_texture_filter = Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST
	scan_mod_textures()
	pass # Replace with function body.

func scan_mod_textures() -> void:
	mod_textures.clear()
	var files := DirAccess.get_files_at(MOD_TEXTURE_DIR)
	for f in files:
		var ext := f.get_extension().to_lower()
		if ext in ["png", "jpg", "jpeg", "webp"]:
			var basename := f.get_basename()
			var path := MOD_TEXTURE_DIR + f
			var tex := _load_image_as_texture(path)
			if tex:
				mod_textures[basename] = tex
	print("Mod textures loaded: ", mod_textures.keys())

func _load_image_as_texture(path: String) -> Texture2D:
	var img := Image.new()
	var err := img.load(path)
	if err != OK:
		push_warning("Failed to load Image %s (err %s)" % [path, err])
		return null
	
	if img.get_width() != 16 or img.get_height() != 16:
		img.resize(16, 16, Image.INTERPOLATE_NEAREST)
	
	var tex := ImageTexture.create_from_image(img)
	return tex


func get_texture(name: String, fallback_res_path: String = "") -> Texture2D:
	if mod_textures.has(name):
		return mod_textures[name]
	if fallback_res_path != "":
		return load(fallback_res_path)
	return null
