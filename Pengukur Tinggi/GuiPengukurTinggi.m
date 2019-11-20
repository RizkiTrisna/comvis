function varargout = GuiPengukurTinggi(varargin)
% GUIPENGUKURTINGGI MATLAB code for GuiPengukurTinggi.fig
%      GUIPENGUKURTINGGI, by itself, creates a new GUIPENGUKURTINGGI or raises the existing
%      singleton*.
%
%      H = GUIPENGUKURTINGGI returns the handle to a new GUIPENGUKURTINGGI or the handle to
%      the existing singleton*.
%
%      GUIPENGUKURTINGGI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIPENGUKURTINGGI.M with the given input arguments.
%
%      GUIPENGUKURTINGGI('Property','Value',...) creates a new GUIPENGUKURTINGGI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GuiPengukurTinggi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GuiPengukurTinggi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GuiPengukurTinggi

% Last Modified by GUIDE v2.5 19-Nov-2019 09:41:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GuiPengukurTinggi_OpeningFcn, ...
                   'gui_OutputFcn',  @GuiPengukurTinggi_OutputFcn, ...
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


% --- Executes just before GuiPengukurTinggi is made visible.
function GuiPengukurTinggi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GuiPengukurTinggi (see VARARGIN)

% Choose default command line output for GuiPengukurTinggi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GuiPengukurTinggi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GuiPengukurTinggi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_pilih_a.
function btn_pilih_a_Callback(~, eventdata, handles)
[filename,pathname] = uigetfile({'*.*'});
global imA;
global imB;
%global imC;

imA = imread(fullfile(pathname,filename));
axes(handles.axes1);
imshow(imA, []);

imBSementara = imcrop(imA);
axes(handles.axes2);
imshow(imBSementara, []);

imB = imcrop(imBSementara);
axes(handles.axes2);
imshow(imB, []);


%imC = imcrop(imB);
%axes(handles.axes3);
%imshow(imC, []);

% --- Executes on button press in btn_proses_a.
function btn_proses_a_Callback(hObject, eventdata, handles)
% hObject    handle to btn_proses_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider_a_Callback(hObject, eventdata, handles)
nilaiSliderA = get(handles.slider_a,'Value');
disp(nilaiSliderA);
stringTxtNilai = sprintf(nilaiSliderA);





% --- Executes during object creation, after setting all properties.
function slider_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles  empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ed_tinggi_a_Callback(hObject, eventdata, handles)
% hObject    handle to ed_tinggi_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_tinggi_a as text
%        str2double(get(hObject,'String')) returns contents of ed_tinggi_a as a double


% --- Executes during object creation, after setting all properties.
function ed_tinggi_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_tinggi_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_pilih_b.
function btn_pilih_b_Callback(hObject, eventdata, handles)


% --- Executes on button press in btn_proses_b.
function btn_proses_b_Callback(hObject, eventdata, handles)
% hObject    handle to btn_proses_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider_b_Callback(hObject, eventdata, handles)
% hObject    handle to slider_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btn_hitung_tinggi_sebenarnya.
function btn_hitung_tinggi_sebenarnya_Callback(hObject, eventdata, handles)
global imA;
global imB;
%global imC;

%Nilai imA
RA = imA(:,:,1);
GA = imA(:,:,2);
BA = imA(:,:,3); 
[M, N, ~] = size(imA);
grayA = zeros(M, N, 'uint8');

for i=1:M
    for j = 1 : N
        grayA(i, j) = (RA(i, j) * 0.2989) + (GA(i, j) * 0.5870) + (BA(i, j) * 0.114);
    end
end

grayA=double(grayA);
[a,b]=size(grayA);
tresholdA=zeros(a,b);

thrA=125;
for i=1:a
    for j=1:b
        if grayA(i,j) > thrA
            tresholdA(i,j)=0;
        else
            tresholdA(i,j)=1;
        end
    end
end



ab_2 = tresholdA > 0;
ab_2 = bwareafilt(ab_2, 1);
propsA = regionprops(ab_2, 'BoundingBox');
boundingBoxA = [propsA.BoundingBox]

%Menghitung tinggi hasil A

hasil_1 =imcrop(imA,boundingBoxA);
tinggiA = size(hasil_1,1);
figure, imshow(hasil_1);


%Nilai imB
RB = imB(:,:,1);
GB = imB(:,:,2);
BB = imB(:,:,3); 
[O, P, ~] = size(imB);
grayB = zeros(O, P, 'uint8');
for i=1:O
    for j = 1 : P
        grayB(i, j) = (RB(i, j) * 0.2989) + (GB(i, j) * 0.5870) + (BB(i, j) * 0.114);
    end
end

grayB=double(grayB);
[c,d]=size(grayB);
tresholdB=zeros(c,d);

thr=40;
for i=1:c
    for j=1:d
        if grayB(i,j) > thr
            tresholdB(i,j)=0;
        else
            tresholdB(i,j)=1;
        end
    end
end

cd_2 = tresholdB > 0;
cd_2 = bwareafilt(cd_2, 1);
propsB = regionprops(cd_2, 'BoundingBox');
boundingBoxB = [propsB.BoundingBox]

%Menghitung tinggi hasil B

hasilB =imcrop(imB,boundingBoxB);
tinggiB = size(hasilB,1);
figure, imshow(hasilB);

%Menampilkan gambar setelah diolah

axes(handles.axes2);
imshow(hasilB, []);

bTs = str2double(get(handles.ed_tinggi_a, 'String'));
fprintf('%s Edittext %d \n',' Tes ', bTs);

aPx = double(tinggiA);
bPx = double(tinggiB);

%bTs = int32((aTs/aPx) * bPx);
aTs = int32((bTs/bPx) * aPx);
fprintf('%s Edittext %d \n',' Tes ', aTs);

fprintf('%s yang diambil dari gambar Asli adalah %d \n','Tinggi pixel (aPx) ',aPx);
set(handles.txt_apx, 'string', aPx);
fprintf('%s yang diambil dari gambar Parameter adalah %d \n','Tinggi pixel (bPx)',bPx);
set(handles.txt_bpx, 'string', sprintf('%.2f',bPx));
fprintf('%s adalah %d \n','Asumsi tinggi sebenarnya dari parameter(bTs) ',bTs);
set(handles.txt_bts, 'string', bTs);
fprintf('%s dari gambar 1 adalah %d \n','Tinggi sebenarnya (aTs) ',aTs);
set(handles.txt_ats, 'string', aTs);
