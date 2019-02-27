%Definición y llenado de vectores de entrada
% X1, X2, X3, X4 son los vectores de entrada

x1=[0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];
x2=[0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1];
x3=[0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1];
x4=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];

% M Y N se asignan con la dimensión de los vectores
[m,n]=size(x1);

%Son los valores a los que se ajustan las entradas (deseados)

dx=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];

% Y es un vector para ir guardando los valores de salida mientras 
% se ajustan segun el error
y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

%Cantidad de epocas para el entrenamiento
epocas=300;

%Asignación de pesos de forma aleatorea entre -1 y 1
w1=rand();
w2=rand();
w3=rand();
w4=rand();

%coeficiente de aprendizaje
alfa=0.1;

%variable para controlar las epocas en un While
i=0;

%contador para controlar si se repite un mismo error muchas veces
cont=0;

while (i<epocas)

% J inicia en 1 para que recorra las columnas de los vectores
    j=1;
    
    %variable para error acumulado por cada entrada
    error=0;
    cont = 0;
    
    %Variable para controlar en cuantas epocas se entreno el modelo
    %En caso de que se entrene
    entreno = i;
    
    %Ciclo para recorrer los vectores
    while (j<=n)
    
    %Se calcula Y 
      y(j)=w1*x1(j)+w2*x2(j)+w3*x3(j)+w4*x4(j);
      
      %Se calcula el error cuadratico
      ep=(dx(j)-y(j))^2/2
      
      %variable para comparar si el error global no cambia
      errorA = error;
      
      %Acumulador para error global
      error=error + ep; 
      
      %Condicional, compara si el error del ciclo anterior es igual  repite al del ciclo actual, si esto se repite 10 veces, se activa el Break para terminar todo el proceso
      if (errorA == error)
          cont = cont + 1;
          if (cont == 10)
             break
          end 
      end
      
      %Condicional, compara si el error es aceptable con los pesos actuales, sino, actualiza pesos y empieza de nuevo.
      
      if(error<0.00001)
          j=j+1;
          
        if(j==n+1)
            i=epocas;
        end
          
      else
           w1=w1+alfa*(dx(j)-y(j))*x1(j);  
           w2=w2+alfa*(dx(j)-y(j))*x2(j);
           w3=w3+alfa*(dx(j)-y(j))*x3(j);
           w4=w4+alfa*(dx(j)-y(j))*x4(j);
       j=n+1;
          
      end
      
    end
    if (cont == 10)
       break
    end 
i=i+1;
end

%Se muestran las variable 
cont
entreno