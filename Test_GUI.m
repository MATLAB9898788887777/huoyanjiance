function varargout = Test_GUI(varargin)
%TEST_GUI M-file for Test_GUI.fig
%      TEST_GUI, by itself, creates a new TEST_GUI or raises the existing
%      singleton*.
%
%      H = TEST_GUI returns the handle to a new TEST_GUI or the handle to
%      the existing singleton*.
%
%      TEST_GUI('Property','Value',...) creates a new TEST_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Test_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      TEST_GUI('CALLBACK') and TEST_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in TEST_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Test_GUI

% Last Modified by GUIDE v2.5 26-Nov-2021 18:15:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Test_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @Test_GUI_OutputFcn, ...
    'gui_LayoutFcn',  [], ...
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


% --- Executes just before Test_GUI is made visible.
function Test_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Test_GUI
handles.output = hObject;
set(gcf,'name','��ϵ΢��:matlab674  ');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Test_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Test_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)



%% ����Ƶ��֡����ΪjpgͼƬ

obj = VideoReader(uigetfile('*.mp4','ѡ����Ƶ'));%������Ƶλ��
setappdata(0,'obj',obj);%����ȫ�ֱ���
Show_Frames=read(obj,1);%��ʾ��һ֡��Ϊ����
axes(handles.axes1);
imshow(Show_Frames);
set(handles.text16,'String','��Ƶ��ʶ��...���Եȣ�');

prompt={'����ͼƬ�������к�λ��:'};
defans={'3'};%Ĭ����λ��
p=inputdlg(prompt,'����λ��',1,defans);
numzeros=str2num(p{1});
nz = strcat('%0',num2str(numzeros),'d');

numFrames = obj.NumberOfFrames;% ֡������
for k = 1 :5% ��ȡǰ15֡  numFrames
    frame = read(obj,k);%��ȡ�ڼ�֡
    id=sprintf(nz,k);
    imwrite(frame,strcat('֡ϵ��/',id,'.jpeg'),'jpeg');% ����֡
end
msgbox('�����ƣ�΢��:matlab674');


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
msgbox('Դ��΢��:matlab674')
set(handles.text16, 'String', 'Դ��΢��:matlab674��');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
ax1=(handles.axes1);cla(ax1,'reset')
ax2=(handles.axes2);cla(ax2,'reset')
ax8=(handles.axes8);cla(ax8,'reset')
ax9=(handles.axes9);cla(ax9,'reset')
ax10=(handles.axes10);cla(ax10,'reset')
ax11=(handles.axes11);cla(ax11,'reset')
set(handles.text11, 'String', '');
set(handles.text12, 'String', '');
set(handles.text13, 'String', '');
set(handles.text15, 'String', '');
set(handles.text16, 'String', '');
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
[filename,pathname] = uigetfile({'*.jpeg;*.bmp;*.tif;*.png;*.gif','All Image Files'},'��ѡ��һ��ͼƬ');
if filename == 0%���û��ѡ��ֱ�ӷ��ؼ���
    return;
end
strfullname = strcat(pathname,filename);%ȡ��ͼ���ļ�ȫ��
I = imread(strfullname);%��ȡͼƬ
axes(handles.axes2)
imshow(I);%��ʾͼƬ
title('����ͼ��')

msgbox('΢��:matlab674')

set(handles.text15, 'String', 'Դ��΢��:matlab674');


% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
