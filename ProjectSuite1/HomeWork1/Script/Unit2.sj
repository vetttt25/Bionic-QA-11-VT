//Это вторая часть первой домашки
//Эта уже заскриптованная.

function open_f(name_file)  //Функция открывает .тхт файл с рабочей папки
                            //Достаточно знать его название и уверенность, что он сохранен в данной рабочей папке.
{
  var notepad;
  var wndNotepad;
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;

  var file_type="Text Documents (*.txt)";
  
  TestedApps.notepad.Run();
  wndNotepad.MainMenu.Click("File|Open...");  
  notepad.dlgOpen.OpenFile("E:\\Bionic-QA-11-VT\\" + name_file, file_type);  

}


function Test1()
{
  var  notepad;
  var  wndNotepad;
  
  name_file="first.txt";
  
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;
  
  open_f(name_file);
  
  wndNotepad.Edit.Keys("[End] world!!!!!!");
  wndNotepad.MainMenu.Click("File|Save");
  wndNotepad.Close();
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;
  
  open_f(name_file);
  
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, cmpEqual, "Hello world!!!", false);
  wndNotepad.Close();
}
