unit MyStrUtils;

interface

uses
   Windows, SysUtils, Dialogs;

function ScanFormat(const _Input, Format: string; Args: array of Pointer): integer;

implementation

function ScanFormat(const _Input, Format: string; Args: array of Pointer): integer;
var
   InputOffset: integer;
   FormatOffset: integer;
   InputChar: char;
   FormatChar: char;
   Input: string;

   function DelDoubleSpaces(OldText: string): string;
   var
      i: integer;
      s: string;
   begin
      s := '';
      if length(OldText) > 0 then
         s := OldText[1]
      else
         s := '';
      for i := 2 to length(OldText) do
      begin
         if OldText[i] = ' ' then
         begin
            if not (OldText[i - 1] = ' ') then
            begin
               s := s + ' ';
               //ShowMessage('s1 ' + s);
            end;
         end
         else
         begin

            s := s + OldText[i];
            //ShowMessage('s2 ' + s);
         end;
      end;
      DelDoubleSpaces := s;
   end;


   function _GetInputChar: char;
   begin

      if InputOffset <= Length(Input) then
      begin
         Result := Input[InputOffset];
         Inc(InputOffset);
      end
      else
         Result := #0;
   end;

   function _PeekFormatChar: char;
   begin
      if FormatOffset <= Length(Format) then
         Result := Format[FormatOffset]
      else
         Result := #0;
   end;

   function _GetFormatChar: char;
   begin
      Result := _PeekFormatChar;
      if Result <> #0 then
         Inc(FormatOffset);
   end;

   function _ScanInputString(const Arg: Pointer = nil): string;
   var
      EndChar: char;
   begin
      Result  := '';
      EndChar := _PeekFormatChar;
      InputChar := _GetInputChar;
      while (InputChar > ' ') and (InputChar <> EndChar) do
      begin
         Result := Result + InputChar;
         InputChar := _GetInputChar;
      end;

      if InputChar <> #0 then
         Dec(InputOffset);

      if Assigned(Arg) then
         PString(Arg)^ := Result;
   end;

   function _ScanInputInteger(const Arg: Pointer): boolean;
   var
      Value: string;
   begin
      Value  := _ScanInputString;
      Result := TryStrToInt(Value, {out} PInteger(Arg)^);
   end;

   procedure _Raise;
   begin
      raise EConvertError.CreateFmt('Unknown ScanFormat character : "%s"!', [FormatChar]);
   end;

begin
   Result := 0;
   InputOffset := 1;
   FormatOffset := 1;
   Input  := DelDoubleSpaces(_Input);
   //Input := _Input ;
   FormatChar := _GetFormatChar;
   while FormatChar <> #0 do
   begin
      if FormatChar <> '%' then
      begin
         InputChar := _GetInputChar;
         if (InputChar = #0) or (FormatChar <> InputChar) then
            Exit;
      end
      else
      begin
         FormatChar := _GetFormatChar;
         case FormatChar of
            '%':
               if _GetInputChar <> '%' then
                  Exit;
            's':
            begin
               _ScanInputString(Args[Result]);
               Inc(Result);
            end;
            'd', 'u':
            begin
               if not _ScanInputInteger(Args[Result]) then
                  Exit;

               Inc(Result);
            end;
            else
               _Raise;
         end;
      end;

      FormatChar := _GetFormatChar;
   end;
end;

end.

