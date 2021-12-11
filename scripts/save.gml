buffer_async_group_begin("save_folder_name");
buffer_async_group_option("showdialog",0);    // Stop platform dialogues appearing for this auto-save (if you do this your player won't be able to select a slot manually)
buffer_async_group_option("slottitle","SaveForMyGame");    // Set the title of the slot we're going to save into
buffer_async_group_option("subtitle","Save file for my awesome game");   // Set a subtitle that's visible in the XBox UI

global.savebuff = buffer_create(1,buffer_grow,1);
ini_open_from_string("");
/*
  All your usual ini_write_real() or ini_write_string() stuff, as you have it just now.
  ...
*/
var inistring = ini_close();
buffer_write(global.savebuff,buffer_string,inistring);
buffer_save_async(global.savebuff,"my_save_file.sav",0,buffer_get_size(global.savebuff));    // Pass the data to be saved
global.saveid = buffer_async_group_end();     // Start the save process and return the save request ID
