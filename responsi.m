function varargout = responsi(varargin)
% RESPONSI MATLAB code for responsi.fig
%      RESPONSI, by itself, creates a new RESPONSI or raises the existing
%      singleton*.
%
%      H = RESPONSI returns the handle to a new RESPONSI or the handle to
%      the existing singleton*.
%
%      RESPONSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSI.M with the given input arguments.
%
%      RESPONSI('Property','Value',...) creates a new RESPONSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before responsi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to responsi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help responsi

% Last Modified by GUIDE v2.5 04-Nov-2017 17:48:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @responsi_OpeningFcn, ...
                   'gui_OutputFcn',  @responsi_OutputFcn, ...
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


% --- Executes just before responsi is made visible.
function responsi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to responsi (see VARARGIN)

% Choose default command line output for responsi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes responsi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = responsi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
set(handles.radiobutton2,'Value',0);
rd=1;
handles.rd=rd;
guidata(hObject,handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
set(handles.radiobutton1,'Value',0);
rd=2;
handles.rd=rd;
guidata(hObject,handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in Proses.
function Proses_Callback(hObject, eventdata, handles)
image1=handles.image;
rd=handles.rd;
[brs,kol,l]=size(image1);

if rd==1
    x = double(image1);
    image1=fwht(x);
else
    [a,b,c,d]=dwt2(image1,'db1');
    image1=uint8([a,b;c,d]);
end;
 hasil=image1;
axes(handles.axes3);
imshow(hasil);
axes(handles.axes4);
imhist(hasil);
handles.hasil=hasil;
guidata(hObject,handles);   
    
% hObject    handle to Proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset1.
function reset1_Callback(hObject, eventdata, handles)
set(handles.nama,'String','');
set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.level,'String','1');
axes(handles.axes1);plot(1);
axes(handles.axes2);plot(1);
axes(handles.axes3);plot(1);
axes(handles.axes4);plot(1);
% hObject    handle to reset1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in simpan.
function simpan_Callback(hObject, eventdata, handles)
[nama_file_simpan, path_simpan]=uiputfile(...
    {'*.bmp; *.jpg; *.jpeg; *.tiff; *.png','File Citra(*.bmp, *.jpg, *.jpeg, *.tiff, *.png)';
    '*.bmp','File bmp(*.bmp)';...
    '*.jpg','File jpg(*.jpg)';...
    '*.jpeg','File jpeg(*.jpeg)';...
    '*.tiff','File tiff(*.tiff)';...
    '*.png','File png(*.png)';...
    '*.*','Semua File(*.*)'},...
    'Simpan File Hasil Citra');
if isequal([nama_file_simpan,path_simpan],[0,0])
    return
else
    data1=handles.hasil;
    file=fullfile(path_simpan,nama_file_simpan);
    imwrite(data1,file);
end;
% hObject    handle to simpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset2.
function reset2_Callback(hObject, eventdata, handles)
% hObject    handle to reset2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function level_Callback(hObject, eventdata, handles)
% hObject    handle to level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of level as text
%        str2double(get(hObject,'String')) returns contents of level as a double


% --- Executes during object creation, after setting all properties.
function level_CreateFcn(hObject, eventdata, handles)
% hObject    handle to level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nama_Callback(hObject, eventdata, handles)
% hObject    handle to nama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nama as text
%        str2double(get(hObject,'String')) returns contents of nama as a double


% --- Executes during object creation, after setting all properties.
function nama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
[nama_file1, nama_path1]=uigetfile(...
    {'*.bmp; *.jpg; *.jpeg; *.tiff; *.png','File Citra(*.bmp, *.jpg, *.jpeg, *.tiff, *.png)';
    '*.bmp','File bmp(*.bmp)';...
    '*.jpg','File jpg(*.jpg)';...
    '*.jpeg','File jpeg(*.jpeg)';...
    '*.tiff','File tiff(*.tiff)';...
    '*.png','File png(*.png)';...
    '*.*','Semua File(*.*)'},...
    'Buka File Asli');
if isequal([nama_file1,nama_path1],[0,0])
    return;
else
    image=imread(fullfile(nama_path1,nama_file1));
    handles.image=image;
    guidata(hObject,handles);
    axes(handles.axes1);
    imshow(image);
    set(handles.nama,'string',nama_file1);
    [brs,kol,tt]=size(handles.image);
    set(handles.edit2,'string',brs);
    set(handles.edit3,'string',kol);
    handles.image=image;
    guidata(hObject,handles);
dR=image(:,:,1);
dG=image(:,:,2);
dB=image(:,:,3);
handles.dR=dR;
axes(handles.axes2);
imhist(dR);
handles.dG=dG;
axes(handles.axes2);
imhist(dG);
handles.dB=dB;
axes(handles.axes2);
imhist(dB);
end; 
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
button=questdlg('Tutup Aplikasi?',...
    'Tutup','Ya','Tidak','Ya');
if strcmp(button,'Tidak')
    return;
end
delete(handles.figure1);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
