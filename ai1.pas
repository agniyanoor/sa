program ai;
uses crt;
Var
	i: integer;
	x,t,xLama,yLama,costLama,bestCost,xBaru,yBaru,costBaru,proba,rand_num : Double;

function Rand( r_min, r_max : Double ): double;
	Begin
 		Rand:= random()*(r_max - r_min) + r_min;
	end;
function x_random( x: double):double;
var
        y : double;
        begin
             repeat
                y := x + Rand(-1,1);
             until (y<=10) and (y>=-10);
             x_random := y;
        end;
function perhitunganF (x,y: double) : double;
begin
    perhitunganF:=-abs((sin(x))*(cos(y))*(exp(abs(1-(sqrt((x*x)+(Y*Y))/PI)))));
end;

Begin
        Randomize;
         t:= 99;
         xLama := Rand(-10,10);
         yLama := Rand(-10,10);
         costLama := perhitunganF(xLama,yLama);
         bestCost := costLama;
        while t>0.001 do
        begin
                for i:=1 to 65 do
                begin
                    xBaru:= x_random(xLama);
                    yBaru:= x_random(yLama);
                    costBaru:= perhitunganF(xBaru,yBaru);
                    proba:=exp(-(costBaru-costLama)/t);
                    rand_num:= Rand(0,1);
                    if (costBaru < costLama) then
                    begin
                        xLama:=xBaru;
                        yLama:=yBaru;
                        costLama:=costBaru;
                        bestCost:=costBaru;
                    end
                    else if (proba>rand_num) then
                    begin
                        xLama:=xBaru;
                        yLama:=yBaru;
                        costLama:=costBaru;
                    end;
                 //writeln('bst',bestcost,' t',t);
                 t:=t-0.000009;
                end;
         end;

        writeln('x1: ',xLama:0:10,' x2: ',yLama:0:10);
        writeln('nilai minimum=',bestCost:0:10);
        readln;
end.
