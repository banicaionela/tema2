%Pe baza dezvoltarii în serie Fourier sa se scrie un program de Matlab 
%care sa determine coeficientilor dezvoltarii, semnalului x(t), 
%în serie Fourier Complex? (numita si exponentiala), conform cu formula 
%si sa se reprezinte grafic spectrul de amplitudini si sa se 
%reconstruiasca semnalul initial folosind N coeficienti ai seriei Fourier 
%mai sus determinate si sa se reprezinte, pe acelasi grafic, semnalul 
%initial si semnalul reconstruit. 
%Numarul corespunzator numelui din lista este 1.

%Din cauza faptului ca am pus figura in for aceasta se va deschide inainte
%de terminarea rularii programului ca fiind o fereastra gri si se va
%actualiza constant pana la terminarea buclei for.
%Am ales o rezolutie temporala de 500 de ms pentru a scurta timpul de
%rulare al programului, insa semnalul apare putin distorsionat. Pentru ca
%semnalul sa nu apara distorsonat aveam nevoie de o rezolutie temporala mai
%mica, insa crestea timul de rulare.

P=40;  %perioada semnalului
D=1;   %durata semnalului
duty=(1/40)*100; % factorul de umplere 
t=0:0.5:80;  %variabila de timp cu o perioada temporala de 500ms
w=2*pi/P;  %frecventa unghiulara 
x=square(w*t, duty)+1; %x este semnalul dreptunghiular initial
syms t1;    %declar t1 ca variabila simbolica pentru realizarea 
            %integralelor simbolice
N=50;     %nr de coeficienti
x1=2;     %amplitudinea semnalului de la care plecam pentru reconstruire 
A=zeros(1, N);  %initializam toate amplitudinile semnalului cu 0
X0=int(x1,t1,0,D);  %calculul componentei continue al semnalului
y=(1/P)*X0;   
for k=1:N
    g=x1*exp(-sqrt(-1)*k*w*t1); %atribuim o functie g pentru a putea 
                           %calcula coeficientii conform formulei de calcul
    C=int(g,t1,0,D);  %calculul coeficientilor
    A=sqrt((imag(C))^2+(real(C))^2); %calcului amplitudinilor 
    y=y+(2/P)*C*exp(sqrt(-1)*k*w*t); %y este semnalul reconstruit
    figure(2);
    stem(k/P,A,'-b');
    hold on 
    stem (-k/P,A,'-b');
    hold on
    
end

figure (1)
plot(t,x)
hold on
plot(t,y)

xlabel('Perioada [s]')
ylabel('Amplitudinea')
title('Semnal dreptunghiular')
axis([0 80 -0.5 2.5])

figure (2)
hold on
stem (0,X0,'-b')
xlabel('Frecventa[rad/s]')
ylabel('Amplitudini Ak')
title ('Spectrul de amlitudini')
xlim([-N/P N/P])

%Pe baza celor invatate la SS si in urma rezultatelor obtinute se poate
%observa cum spectrul de amplitudini se modifica odata cu modificarea
%factorului de umlere (implicit cu modificarea duratei semnalului. Semnalul
%reconstruit va arata mai exact cu un semnal dreptunghiular cu cat nr de
%coeficienti va creste.