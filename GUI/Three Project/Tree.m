function varargout = Tree(varargin)
% TREE MATLAB code for Tree.fig
%      TREE, by itself, creates a new TREE or raises the existing
%      singleton*.
%
%      H = TREE returns the handle to a new TREE or the handle to
%      the existing singleton*.
%
%      TREE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TREE.M with the given input arguments.
%
%      TREE('Property','Value',...) creates a new TREE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tree_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tree_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tree

% Last Modified by GUIDE v2.5 21-May-2022 15:05:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tree_OpeningFcn, ...
                   'gui_OutputFcn',  @Tree_OutputFcn, ...
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


% --- Executes just before Tree is made visible.
function Tree_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tree (see VARARGIN)

% Choose default command line output for Tree
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tree wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tree_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in luzhi.
function luzhi_Callback(hObject, eventdata, handles)
    luyingchuli(hObject, eventdata, handles);
% hObject    handle to luzhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in jiangzao.
function jiangzao_Callback(hObject, eventdata, handles)
% hObject    handle to jiangzao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bianyin.
function bianyin_Callback(hObject, eventdata, handles)
% hObject    handle to bianyin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function luyingchuli(hObject, eventdata, handles)
    recobj=audiorecorder;
    recordblocking(recobj,5);
    myRecording = getaudiodata(recobj);
    axes(handles.axes1);
    plot(myRecording);
    set(get(gca, 'YLabel'), 'String', ' ±”Ú≤®–Œ');
    Fs=8000;
    