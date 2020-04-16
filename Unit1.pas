unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.MPlayer,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    timerProcess: TTimer;
    MediaPlayer1: TMediaPlayer;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure timerProcessTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  x, y, l: integer;
  k: real;
  i: integer;
  P, Q: real;

const
  head = 20;

const
  legs1 = 10;

const
  arms1 = 5;

procedure dancer_body(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    ellipse(round((a - head) * k * P), round((b - head * 2) * k * Q),
      round((a + head) * k * P), round(b * k * Q));
    moveto(round(a * k * P), round(b * k * Q));
    lineto(round(a * k * P), round((b + head * 3) * k * Q));
  end;
end;

procedure dancer_legs1(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 6 * legs1) * k * Q));
    lineto(round((a + 2 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    lineto(round((a + 3 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    moveto(round(a * k * P), round((b + 60) * k * Q));
    lineto(round((a - 2 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    lineto(round((a - 3 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
  end;
end;

procedure dancer_arms1(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 4 * arms1) * k * Q));
    lineto(round((a + 5 * arms1) * k * P), round((b + 8 * arms1) * k * Q));
    lineto(round((a + 5 * arms1) * k * P), round((b + 11 * arms1) * k * Q));
    moveto(round(a * k * P), round((b + 20) * k * Q));
    lineto(round((a - 5 * arms1) * k * P), round((b + 8 * arms1) * k * Q));
    lineto(round((a - 5 * arms1) * k * P), round((b + 11 * arms1) * k * Q));
  end;
end;

procedure dancer_legs2(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 6 * legs1) * k * Q));
    lineto(round((a + 2 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    lineto(round((a + 3 * legs1) * k * P), round((b + 9 * legs1) * k * Q));
    moveto(round(a * k * P), round((b + 60) * k * Q));
    lineto(round((a - 2 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    lineto(round((a - 3 * legs1) * k * P), round((b + 9 * legs1) * k * Q));
  end;
end;

procedure dancer_arms2(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 4 * arms1) * k * Q));
    lineto(round((a + 5 * arms1) * k * P), round((b + arms1) * k * Q));
    lineto(round((a + 6 * arms1) * k * P), round((b - 3 * arms1) * k * Q));
    moveto(round(a * k * P), round((b + 20) * k * Q));
    lineto(round((a - 5 * arms1) * k * P), round((b + arms1) * k * Q));
    lineto(round((a - 6 * arms1) * k * P), round((b - 3 * arms1) * k * Q));
  end;
end;

procedure dancer_legs3(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 6 * legs1) * k * Q));
    lineto(round((a + 2 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    lineto(round((a + 3 * legs1) * k * P), round((b + 9 * legs1) * k * Q));
    moveto(round(a * k * P), round((b + 60) * k * Q));
    lineto(round((a - 2 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    lineto(round((a - 3 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
  end;
end;

procedure dancer_arms3(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 4 * arms1) * k * Q));
    lineto(round((a + 5 * arms1) * k * P), round((b + arms1) * k * Q));
    lineto(round((a + 6 * arms1) * k * P), round((b - 3 * arms1) * k * Q));
    moveto(round(a * k * P), round((b + 20) * k * Q));
    lineto(round((a - 5 * arms1) * k * P), round((b + 8 * arms1) * k * Q));
    lineto(round((a) * k * P), round((b + 11 * arms1) * k * Q));
  end;
end;

procedure dancer_legs4(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 6 * legs1) * k * Q));
    lineto(round((a + 2 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    lineto(round((a + 3 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    moveto(round(a * k * P), round((b + 60) * k * Q));
    lineto(round((a - 2 * legs1) * k * P), round((b + 10 * legs1) * k * Q));
    lineto(round((a - 3 * legs1) * k * P), round((b + 9 * legs1) * k * Q));
  end;
end;

procedure dancer_arms4(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 20) * k * Q));
    lineto(round((a + 5 * arms1) * k * P), round((b + 8 * arms1) * k * Q));
    lineto(round((a) * k * P), round((b + 11 * arms1) * k * Q));
    moveto(round(a * k * P), round((b + 20) * k * Q));
    lineto(round((a - 5 * arms1) * k * P), round((b + arms1) * k * Q));
    lineto(round((a - 6 * arms1) * k * P), round((b - 3 * arms1) * k * Q));
  end;
end;

procedure dancer_arms_circule1(a, b: integer; k: real; canvas: TCanvas);
begin
  with canvas do
  begin
    moveto(round(a * k * P), round((b + 4 * arms1) * k * Q));
    lineto(round((a + 7 * arms1) * k * P), round((b + 1 * arms1) * k * Q));
    lineto(round((a + 8 * arms1) * k * P), round((b + 1 * arms1) * k * Q));
    moveto(round(a * k * P), round((b + 20) * k * Q));
    lineto(round((a - 7 * arms1) * k * P), round((b + 1 * arms1) * k * Q));
    lineto(round((a - 8 * arms1) * k * P), round((b + 1 * arms1) * k * Q));
  end;
end;

procedure man(x, a: integer; canvas: TCanvas);
begin
  with canvas do
  begin
    ellipse(round((x - head) * 1.25 * P), round((250 - head * 2) * 1.25 * Q),
      round((x + head) * 1.25 * P), round(250 * 1.25 * Q));
    moveto(round(x * 1.25 * P), round(250 * 1.25 * Q));
    lineto(round(x * 1.25 * P), round((250 + head * 3) * 1.25 * Q));
    moveto(round(x * 1.25 * P), round((250 + 6 * legs1) * 1.25 * Q));
    lineto(round((x + 2 * legs1) * 1.25 * P),
      round((250 + 10 * legs1) * 1.25 * Q));
    lineto(round((x + 3 * legs1) * 1.25 * P),
      round((250 + 10 * legs1) * 1.25 * Q));
    moveto(round(x * 1.25 * P), round((250 + 60) * 1.25 * Q));
    lineto(round((x - 2 * legs1) * 1.25 * P),
      round((250 + 10 * legs1) * 1.25 * Q));
    lineto(round((x - 3 * legs1) * 1.25 * P),
      round((250 + 10 * legs1) * 1.25 * Q));
    moveto(round(x * 1.25 * P), round((250 + 4 * arms1) * 1.25 * Q));
    lineto(round((x + 5 * arms1) * 1.25 * P),
      round((200 + a + 8 * arms1) * 1.25 * Q));
    lineto(round((x + 5 * arms1) * 1.25 * P),
      round((170 + a + 11 * arms1) * 1.25 * Q));
    moveto(round(x * 1.25 * P), round((250 + 20) * 1.25 * Q));
    lineto(round((x - 5 * arms1) * 1.25 * P),
      round((200 + a + 8 * arms1) * 1.25 * Q));
    lineto(round((x - 5 * arms1) * 1.25 * P),
      round((170 + a + 11 * arms1) * 1.25 * Q));
  end;
end;

procedure table(x, y: integer; canvas: TCanvas);
begin
  with canvas do
  begin
    brush.color := clblack;
    ellipse(round(x * P), round(y * Q), round((180 + x) * P),
      round((y + 15) * Q));
    ellipse(round((x + 80) * P), round(y * Q), round((87 + x) * P),
      round((105 + y) * Q));
    brush.color := clwhite;
  end;
end;

procedure bar(canvas: TCanvas);
  procedure bottle(x, y: integer; canvas: TCanvas);
  var
    j: integer;
  begin
    with canvas do
    begin
      for j := 1 to 15 do
      begin
        moveto(round(x * P), round((y - j) * Q));
        lineto(round((9 + x) * P), round((y - j) * Q));
      end;
      for j := 1 to 3 do
      begin
        moveto(round((x + 3 + j) * P), round((y - 15) * Q));
        lineto(round((x + 3 + j) * P), round((y - 24) * Q));
      end;
      pen.color := clblack;
    end;
  end;

begin
  with canvas do
  begin
    brush.color := clmedgray;
    Rectangle(round(30 * P), round(360 * Q), round(230 * P), round(450 * Q));
    Rectangle(round(30 * P), round(360 * Q), round(230 * P), round(350 * Q));
    pen.color := clAqua;
    bottle(90, 349, canvas);
    pen.color := clred;
    bottle(105, 349, canvas);
    pen.color := clblue;
    bottle(130, 349, canvas);
    pen.color := clLime;
    bottle(145, 349, canvas);
    pen.color := clSkyBlue;
    bottle(160, 349, canvas);
    pen.color := clPurple;
    bottle(175, 349, canvas);
    pen.color := clgray;
    bottle(75, 349, canvas);
    brush.color := clwhite;
  end;
end;

procedure ball(x: integer; canvas: TCanvas);
begin
  with canvas do
  begin
    pen.color := clSkyBlue;
    brush.color := clSkyBlue;
    ellipse(round(x * P), round(0 * Q), round((x + 100) * P), round(120 * Q));
    brush.color := clred;
    pen.color := clred;
    ellipse(round((20 + x) * P), round(20 * Q), round((50 + x) * P),
      round(60 * Q));
    brush.color := clgreen;
    pen.color := clgreen;
    ellipse(round((50 + x) * P), round(40 * Q), round((80 + x) * P),
      round(80 * Q));
    brush.color := clblue;
    pen.color := clblue;
    ellipse(round((20 + x) * P), round(70 * Q), round((50 + x) * P),
      round(110 * Q));
    pen.color := clblack;
    brush.color := clwhite;
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  canvas.pen.Width := 4;
  x := 350;
  y := 250;
  k := 1.25;
  i := 1;
  timerProcess.Interval := 260;
end;

procedure GetMp3File();
var
  dir: string;
  rs: TResourceStream;
begin
  if (not FileExists('1.mp3')) then
  begin
    rs := TResourceStream.CreateFromID(HInstance, 1, RT_RCDATA);
    try
      rs.Position := 0;
      rs.SaveToFile('1.mp3');
    finally
      rs.Free;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  GetMp3File();
  MediaPlayer1.FileName := '1.mp3';
  MediaPlayer1.Open;
  MediaPlayer1.Play;
end;

procedure TForm1.timerProcessTimer(Sender: TObject);
begin
  P := ClientWidth / 800; // width
  Q := ClientHeight / 600;
  with canvas do
  begin
    Repaint;
    DoubleBuffered := True;
  end;
  man(100, 70, canvas);
  man(500, 0, canvas);
  man(550, 0, canvas);
  table(570, 335, canvas);
  bar(canvas);
  ball(50, canvas);
  ball(690, canvas);
  case i of
    1:
      begin
        dancer_body(x, y, k, canvas);
        dancer_legs1(x, y, k, canvas);
        dancer_arms1(x, y, k, canvas);
        inc(i);
      end;
    2:
      begin
        dancer_body(x, y, k, canvas);
        dancer_legs2(x, y, k, canvas);
        dancer_arms1(x, y, k, canvas);
        inc(i);
      end;
    3:
      begin
        dancer_body(x, y, k, canvas);
        dancer_legs2(x, y, k, canvas);
        dancer_arms2(x, y, k, canvas);
        inc(i);
      end;
    4:
      begin
        dancer_body(x, y, k, canvas);
        dancer_legs3(x, y, k, canvas);
        dancer_arms3(x, y, k, canvas);
        inc(i);
      end;
    5:
      begin
        dancer_body(x, y, k, canvas);
        dancer_legs4(x, y, k, canvas);
        dancer_arms4(x, y, k, canvas);
        inc(i);
      end;
    6:
      begin
        dancer_body(x, y, k, canvas);
        dancer_legs1(x, y, k, canvas);
        dancer_arms_circule1(x, y, k, canvas);
        i := 1;
      end;
    7:
      begin

      end;
  end;
end;

end.
