//Это первая часть первой домашки.
//Создавалась на базе Record Keyword Test
//
//

function Main()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.Edit.Keys("Hello");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save As...");
  Aliases.notepad.dlgSaveAs.SaveFile("first.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.Close();
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("first.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "Hello", false);
  Aliases.notepad.wndNotepad.Close();
}
