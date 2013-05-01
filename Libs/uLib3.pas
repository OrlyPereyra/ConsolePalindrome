unit uLib3;

interface
uses SysUtils, Math;

function IsPalindrome(Cadena : string): Boolean;
function CuentaPalindromes(NumeroInicial, NumeroFinal : Integer) : LongInt;
function CalcularDesdeArchivo(RutaArchivo : string; Metodo : string = '0') : LongInt;





implementation

function IsPalindrome(Cadena : string): Boolean;
begin
  Result := True;
  if Length(Cadena) < 2 then exit;

  if Cadena[1] <> Cadena[ Length(Cadena) ] then
    Result :=False
  else
    Result :=Result and IsPalindrome( Copy( Cadena,2, Length(Cadena) -2)  );
end;

function CuentaPalindromes(NumeroInicial, NumeroFinal: Integer) : LongInt;
var
  numero,
  Contador : LongInt;
begin
  Contador := 0;
  for numero := NumeroInicial to NumeroFinal do
  begin
    if IsPalindrome(IntToStr(numero)) then
      Inc(Contador);
  end;
  Result := Contador;
end;


function CalcularDesdeArchivo(RutaArchivo : string; Metodo : string = '0') : LongInt;
var
  Archivo : TextFile;
  Linea   : String;
  Cantidad,
  Suma    : Integer;
  NumeroInicio,
  NumeroFin : string;
begin
  Suma := 0;
  if Metodo = '0' then
    Writeln('CuentaPalindromes');

  if Metodo = '1' then
    Writeln('CuntaPalindromes con Step');

  try
    AssignFile(Archivo, RutaArchivo);
    Reset(Archivo);

    while not Eof(Archivo) do
    begin
      Readln(Archivo, Linea);
      //Writeln(Linea);
      NumeroInicio := Copy(Linea,1, pos(' ', Linea) - 1);
      NumeroFin := Copy(Linea, pos(' ', Linea) + 1, Length(Linea));

        Cantidad := CuentaPalindromes( StrToInt(NumeroInicio) , StrToInt(NumeroFin) );


      //Writeln(Cantidad);
      Suma := Suma + Cantidad;
    end;
  finally
    //CloseFile(Archivo);
    Result := Suma;
    //Writeln('-----------------');
  end;
end;

end.


