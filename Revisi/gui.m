function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 28-Oct-2019 20:19:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
%================================ Logical Space =======================================

close all;  
workspace;  
fontSize = 25;
%================================ Set File Gambar =======================================
[filename,pathname] = uigetfile({'*.*'});
rgbImage = imread(fullfile(pathname,filename));
[row, col, warna] = size(rgbImage);

%============================ Gambar 1 / Gambar Asli=====================================
subplot(1, 5, 1);
imshow(rgbImage, []);
axis on;
caption = sprintf('Gambar Asli');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]);

%============================== Gambar 2 / Grayscale ==================================


R = rgbImage(:,:,1);
G = rgbImage(:,:,2);
B = rgbImage(:,:,3);
    
[M, N, ~] = size(rgbImage);
grayImage = zeros(M, N, 'uint8');
    
for i=1:M
    for j = 1 : N
        grayImage(i, j) = (R(i, j) * 0.2989) + (G(i, j) * 0.5870) + (B(i, j) * 0.114);
    end
end

% Display the image.
subplot(1, 5, 2);
imshow(grayImage, []);
axis on;
caption = sprintf('Gray');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');

%============================== Gambar 3 / Thresholding =============================

grayImage=double(grayImage);
tot=0;
[a,b]=size(grayImage);
tresholdImage=zeros(a,b);
for i=1:a
    for j=1:b
            tresholdImage(i,j)=0;
        end
end
for i=1:a
    for j=1:b
        tot=tot+grayImage(i,j);
    end
end
thr=tot/(a*b);
for i=1:a
    for j=1:b
        if grayImage(i,j) > thr
            tresholdImage(i,j)=0;
        else
            tresholdImage(i,j)=1;
        end
    end
end

subplot(1,5,3);
imshow(tresholdImage, []);
axis on;
caption = sprintf('Thresholding');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');

%============================== Gambar 4 / BoundingBox ==============================

ab = tresholdImage > 0;
ab = bwareafilt(ab, 1);

% Get the bounding box of the blob.
props = regionprops(ab, 'BoundingBox');
boundingBox = [props.BoundingBox]

% Display the original image.
subplot(1, 5, 4);
imshow(rgbImage, []);
axis on;
caption = sprintf('Bounding Box');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
% Plot the bounding box over it.

rectangle('Position', boundingBox, 'LineWidth', 2, 'EdgeColor', 'r');

subplot(1,5,5);
hasil =imcrop(rgbImage,boundingBox);
imshow(hasil, []);
axis on;
caption = sprintf('Hasil Crop');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
tinggi = size(hasil,1);
disp(tinggi);
hold on;




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
