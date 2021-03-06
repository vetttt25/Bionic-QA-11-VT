function Main()   //Это основная функция  для запуска программы
{
  
  TestedApps.Orders.Run();
  
  var file=Files.FileNameByName("input.csv");
  var driver=DDT.CSVDriver(file);              //создали драйвер
  var i=0;
  
  while(!driver.EOF())                            //цикл для чтения инфо с файла
  {
    var cust=driver.Value(0);
    var street=driver.Value(1);
    var city=driver.Value(2);
    var state=driver.Value(3);
    var zip=driver.Value(4);
    var cNO=driver.Value(5);
    var exp=driver.Value(6);
    
    create_check_order(cust,street,city,state,zip,cNO,exp);     //функция для создания записей в базе и проверка на корректность созданной записи
    
    driver.Next();
    i++;                //этот счетчик считает сколько было создано записей с файла. он потом используется, для удаления записей с базы.
    
  }
  
  DDT.CloseDriver(file);
  
  delete_orders(i);         //это созданная функция для удаления записей. переменная указывает сколько записей нужно удалить
  
  close_order_app();        // функция, что бы закрыть приложение
  
}


function create_check_order(cust,str,cty,stte,zp,cNO,exp)
{
  var toolbar=Aliases.ToolBar;
  var customer=Aliases.Customer;
  var street=Aliases.Street;
  var city=Aliases.City;
  var state=Aliases.State;
  var zip=Aliases.Zip;
  var cardNo=Aliases.CardNo;
  var OKorder=NameMapping.Sys.Orders.OrderForm.ButtonOK;
  var ordersview=Aliases.OrdersView;

  toolbar.ClickItem(4);               //эта кнопка отвечать за "создать запись" на панели инструментов программы
  
  customer.wText=cust;
  street.wText=str; 
  city.wText=cty; 
  state.wText=stte;
  zip.wText=zp;
  cardNo.wText=cNO;  
  OKorder.ClickButton();
  
  aqObject.CompareProperty(ordersview.wSelectedItems, cmpEqual, exp,true,3);    //Если будет несовпадение, то вместо Warning (по умолчанию) мы выводим Error  
  
  
}



function delete_orders(i)
{
  var toolbar=Aliases.ToolBar;
  var orderview = Aliases.OrdersView;
  var del=Aliases.btnYesDel;
  var j;
  for(j=0;j<i;j++)
  {
    orderview.SelectItem(0);           //в этом цикле мы удаляем всегда первую запись, поэтому наш параметр в функции как раз говорит нам сколько раз нужно удалять
    toolbar.ClickItem(6);              // первую запись. На самом деле хотел написать через while(orderview.SelectItem(0)). В данном случае если выделяется первая 
    del.ClickButton();                 //запись, то будет true, то и цикл будет запускать удаление данной записи, но времени небыло найти как отключить красный Error
  }                                    //в этой функции, когда она не находит первой записи, т.е. когда они уже законцились. Поэтому переделал через счетчик. 
}

function close_order_app()                            //закрываем приложение. на самом деле можно было именно в данном приложении не делать операцию удаления 
{                                                     //записей, поскольку когда мы закрываем приложение, то не сохраняем его. Но это неинтересно :)
  var main_wnd=NameMapping.Sys.Orders.MainForm;          
  var dntsave=Aliases.dntSave;
  main_wnd.Close();
  dntsave.ClickButton();               //P.S. Благодарен за интересное домашнее заданее.
}
