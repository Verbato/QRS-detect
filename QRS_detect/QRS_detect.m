function varargout = QRS_detect(varargin)
% QRS_DETECT MATLAB code for QRS_detect.fig
%      QRS_DETECT, by itself, creates a new QRS_DETECT or raises the existing
%      singleton*.
%
%      H = QRS_DETECT returns the handle to a new QRS_DETECT or the handle to
%      the existing singleton*.
%
%      QRS_DETECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QRS_DETECT.M with the given input arguments.
%
%      QRS_DETECT('Property','Value',...) creates a new QRS_DETECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before QRS_detect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to QRS_detect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help QRS_detect

% Last Modified by GUIDE v2.5 02-Jun-2014 12:15:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @QRS_detect_OpeningFcn, ...
                   'gui_OutputFcn',  @QRS_detect_OutputFcn, ...
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


% --- Executes just before QRS_detect is made visible.
function QRS_detect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to QRS_detect (see VARARGIN)

% Choose default command line output for QRS_detect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes QRS_detect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = QRS_detect_OutputFcn(hObject, eventdata, handles) 
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
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

doOpenFile(hObject,eventdata,handles);

function doOpenFile(hObject,eventdata,handles)

imeFajla = uigetfile('*.mat');
podaci = load(imeFajla);
ekgData = podaci.ecg2canals(1:10000,1);
handles.ekg = ekgData(:);
[QRS_tacke]=detect(ekgData,1);
cla
plot(ekgData,'b');
hold on;
plot(QRS_tacke,1000,'m*'); 

guidata(handles.output, handles);
  
  


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
