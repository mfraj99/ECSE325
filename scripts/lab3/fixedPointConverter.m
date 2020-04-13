%% Convert the input/x values from floats to fixed point

%read file, write contents to an array and close
xFile = fopen("lab3-In.txt");
xArray = fscanf(xFile, "%f"); 
fclose(xFile);

%create a new array which runs contents of input array through fixed point
%representation function and binary form function
xFixedPoint = bin(fi(xArray,1,16,15)); %signed, 16bit word, 15bit fractional
%disp(xFixedPoint); %disp lets you easily view array content in console
%fi and bin: https://www.mathworks.com/help/fixedpoint/ref/embedded.fi.html#mw_a9fe5ce8-1e61-473c-923b-5c9253ca2f38

%create a new output file and give it write permission, print the array to
%file and close, https://www.mathworks.com/matlabcentral/answers/304567-print-an-array-to-txt

%contents of print statement allow array to be printed column wise, 
%taken from:
%https://www.mathworks.com/matlabcentral/answers/14553-how-to-print-result-of-dec2bin-to-file
xOutFile = fopen("lab3-In-fixedOutput.txt", "w");
fprintf(xOutFile, [repmat('%c',1,size(xFixedPoint,2)) '\r\n'], transpose(xFixedPoint));
fclose(xOutFile);

%attempt at iterating an array, unnecessarily long
% for c = xArray
%    temp = fi(c,1,16,15);
%    xOut = [xOut; temp];
%    disp(xOut);
% end    
% fprintf("%c", xOut);

%% Convert the coefficient/weight values from floats to fixed point

%read file, write contents to an array and close
coefFile = fopen("lab3-coef.txt");
coefArray = fscanf(coefFile, "%f"); 
fclose(coefFile);

%create a new array which runs contents of input array through fixed point
%representation function and binary form function
coefFixedPoint = bin(fi(coefArray,1,16,15)); %signed, 17bit word, 15bit fractional

%create a new output file and give it write permission, print the array to
%file and close

%contents of print statement allow array to be printed column wise
coefOutFile = fopen("lab3-coef-fixedOutput.txt", "w");
fprintf(coefOutFile, [repmat('%c',1,size(coefFixedPoint,2)) '\r\n'], transpose(coefFixedPoint));
fclose(coefOutFile);