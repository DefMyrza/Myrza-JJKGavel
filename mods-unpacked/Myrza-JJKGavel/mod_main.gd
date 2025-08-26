extends Node

const AUTHORNAME_MODNAME_DIR := "Myrza-JJKGavel/"
const AUTHORNAME_MODNAME_LOG := "Myrza-JJKGavel:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir := ""



func _init():
	ModLoaderLog.info("Init", AUTHORNAME_MODNAME_LOG)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(AUTHORNAME_MODNAME_DIR)
	
	# Add extensions
	extensions_dir_path = mod_dir_path + "extensions/"
	# extensions_dir_path = mod_dir_path.path_join("extensions") # Godot 4
	
	# ModLoaderMod.install_script_extension(extensions_dir_path.plus_file(...))
	# Add Translations
	add_translations()
	
	
	
func install_script_extensions():
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	# extensions_dir_path = mod_dir_path.path_join("extensions") # Godot 4
	#ModLoaderMod.install_script_extension(extensions_dir_path.plus_file(...))
	
func add_translations():
	translations_dir = mod_dir_path + ("translations/")
	ModLoaderMod.add_translation(translations_dir.plus_file("JJKGavel_translations.en.translation"))

func _ready():
	ModLoaderLog.info("Done", AUTHORNAME_MODNAME_LOG)
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	ContentLoader.load_data(mod_dir_path + "gavel_content.tres", AUTHORNAME_MODNAME_LOG)
