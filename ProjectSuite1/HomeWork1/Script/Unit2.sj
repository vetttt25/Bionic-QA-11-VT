//Это вторая часть первой домашки
//Эта уже заскриптованная.

//Основная функция - Тест1

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
  var file_type="Text Documents (*.txt)";   
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, cmpEqual, "Hello world!!!", false);
  
  wndNotepad.Close();
   aqFile.Delete("..\\..\\first.txt");
  //Del_test_file();
  
     
}


function open_f(name_file)  //Функция открывает .тхт файл с рабочей папки
                            //Достаточно знать его название и уверенность, что он сохранен в данной рабочей папке.
{
  var notepad;
  var wndNotepad;
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;

  var file_type="Text Documents (*.txt)";
  var file_f=
  TestedApps.notepad.Run();
  wndNotepad.MainMenu.Click("File|Open...");  
  notepad.dlgOpen.OpenFile("" + name_file, file_type);  

}




/*function Del_test_file()        //Красиво и быстро не получилось, удаление сделано через Record Script, но работает. :)
{
  var  explorer;
  var  wndCabinetWClass;
  var  folderView;
  explorer = Aliases.Explorer;
  explorer.wndShell_TrayWnd.btnStart.ClickButton();
  explorer.wndDV2ControlHost.DesktopSFTBarHost.SysListView32.ClickItem("My Computer", 0);
  explorer.wndCabinetWClass.SHELLDLL_DefView.FolderView.DblClickItem("Git on \'vboxsrv\' (E:)", 0);
  explorer.wndCabinetWClass1.SHELLDLL_DefView.FolderView.DblClickItem("Bionic-QA-11-VT", 0);
  wndCabinetWClass = explorer.wndCabinetWClass2;
  folderView = wndCabinetWClass.SHELLDLL_DefView.FolderView;
  folderView.ClickItem("first", 0);
  folderView.ClickItemR("first", 0);
  folderView.PopupMenu.Click("Delete");
  explorer.dlgConfirmFileDelete.btnYes.ClickButton();
  wndCabinetWClass.Close();
  aqFile.Delete(".\\first.txt");
} */
