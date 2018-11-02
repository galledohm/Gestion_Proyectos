Dia=zeros(120);
Dia_c=zeros(120);
%%Inicio del Proyecto
for i=1:2
    Dia(i) = 200 + Dia(i);
    Dia_c(i) = 100/2 + Dia_c(i);
end
%%Gestión del alcance
for i=3:14
    Dia(i) = 2239.2/12 + Dia(i);
    Dia_c(i) = 420/12 + Dia_c(i);
end
%%Gestión del tiempo
for i=15:17
    Dia(i) = 552/3 +Dia(i);
    Dia_c(i) = 150/3 + Dia_c(i);
end
%%Gestión de los costes
for i=15:17
    Dia(i) = 417.6/3 + Dia(i);
    Dia_c(i) = 150/3 + Dia_c(i);
end
%%Gestión de la calidad
for i=17:21
    Dia(i) = 792/5 + Dia(i);
    Dia_c(i) = 150/5 + Dia_c(i);
end
%%Gestión de los recursos humanos
for i=17:18
    Dia(i) = 360/2 +Dia(i);
    Dia_c(i) = 100/2 + Dia_c(i);
end
%%Gestión de la comunicación
for i=19:23
    Dia(i) = 540/5 +Dia(i);
    Dia_c(i) = 150/5 + Dia_c(i);
end
%%Gestión de los riesgos
for i=24:46
    Dia(i) = 3963/23 + Dia(i);
    Dia_c(i) = 1600/23 + Dia_c(i);
end
%%Elección empresa subcontratada
for i=32:43
    Dia(i) = 2295.2/12 + Dia(i);
    Dia_c(i) = 480/12 + Dia_c(i);
end
%%Diseño de la red
for i=44:103
    Dia(i) = 50000/60 + Dia(i);
    Dia_c(i) = 14000/60 + Dia_c(i);
end
%%Seguimiento diseño de la red
for i=44:103
    Dia(i) = 7776/60 + Dia(i);
    %Dia_c(i) = 14000/60 + Dia_c(i);
end
%%Adquisiciones
for i=93:105
    Dia(i) = 976.8/13+Dia(i);
    Dia_c(i) = 480/13 + Dia_c(i);
end
%%Pruebas
for i=106:109
    Dia(i) = 1056/4 + Dia(i);
    Dia_c(i) = 3000/4 + Dia_c(i);
end
%%Cierre
for i=110:117
    Dia(i) = 1200/8 + Dia(i);
    Dia_c(i) = 300/8 + Dia_c(i);
end



%%Control Costes
for i=18:109
    Dia(i) = 9687.2/92 + Dia(i);
    %%Dia_c(i) = 300/8 + Dia_c(i);
end
%%Control RRHH
for i=19:109
    Dia(i) = 6240/91 + Dia(i);
    %Dia_c(i) = 300/91 + Dia_c(i);
end
%%Control Calidad
for i=22:109
    Dia(i) = 10067.2/88 + Dia(i);
    %Dia_c(i) = 300/88 + Dia_c(i);
end
%%Control Comunicaciones
for i=24:109
    Dia(i) = 7615.2/86 + Dia(i);
    %Dia_c(i) = 300/86 + Dia_c(i);
end
%%Control Riesgos
for i=47:109
    Dia(i) = 7150.4/63 + Dia(i);
    %Dia_c(i) = 300/8 + Dia_c(i);
end

%%Materiales y contingencias mat. e instalación
for i=1:30
    Dia(i) = 8156.33/30 + Dia(i);
end

for i=1:117
    Dia_c(i) = 10000/117 + Dia_c(i);
end


Costes=zeros(120);
Costes_c=zeros(120);
Dia_exc=zeros(120);
Costes(1) = Dia(1);
Dia_exc(1) = Dia_c(1);
Costes_c(1) = Costes(1) + Dia_exc(1);
for i=2:120
    Costes(i) = Dia(i) + Costes (i-1);
    Dia_exc(i) = Dia_c(i) + Dia_exc(i-1);
    Costes_c(i) = Costes (i) + Dia_exc(i);
end
Costes(120)= Costes(120)+152297.13*0.2;
Costes_c(120)= Costes_c(120)+152297.13*0.2; %Margenes de beneficio

    p_total = 190000;
    limite(1:55)=0.3*p_total;
    limite(56:103)=0.75*p_total;
    limite(104:120)= p_total;


plot(1:120, limite(1:120), '--','DisplayName','Inyección de capital');
hold on;
plot(1:120, Costes_c(1:120), 'DisplayName','Costes con contingencias');
hold on
plot(1:120, Costes(1:120), 'DisplayName', 'Costes sin contingencias');
xlabel('Día') % x-axis label
ylabel('Costes acumulados por día') % y-axis label

%legend ('Show')