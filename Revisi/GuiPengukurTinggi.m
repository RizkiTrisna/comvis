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

% Last Modified by GUIDE v2.5 05-Nov-2019 05:21:39

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
function btn_pilih_a_Callback(hObject, eventdata, handles)
[filename,pathname] = uigetfile({'*.*'});

imA = imread(fullfile(pathname,filename));
axes(handles.axes1);
imshow(imA, []);

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
[filename,pathname] = uigetfile({'*.*'});

handles.output = hObject;
imB = imread(fullfile(pathname,filename));
axes(handles.axes2);
imshow(imB, []);

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


% --- Executes on button press in btn_hitung_tinggi_b.
function btn_hitung_tinggi_b_Callback(hObject, eventdata, handles)
% hObject    handle to btn_hitung_tinggi_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
