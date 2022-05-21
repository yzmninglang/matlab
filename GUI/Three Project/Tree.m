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
global flag
flag =0;
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
    global flag
    flag = ~flag ;
    if flag==0
        set(handles.zhuantai,'string','状态：停止');
    else
        set(handles.zhuantai,'string','状态：工作');
    end
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
    global flag
    while flag==1
        recobj=audiorecorder;
        recordblocking(recobj,3);
        myRecording = getaudiodata(recobj);
        if ~all(myRecording==0) 
            audio_fft=abs(fft(myRecording));
            axes(handles.axes5);
            Fs=8000;
            time=(0:(length(myRecording)-1))/Fs;
            plot(time,myRecording);
            axis([0 3 -1 1]);
            set(get(gca, 'YLabel'), 'String', '时域波形');

            [desicion,daopu,frequency]=VoiceProcess(myRecording,Fs);
            set(handles.xinbie,'string',strcat('性别：',desicion));
            set(handles.sample,'string',strcat('采样率：',num2str(Fs)));
            set(handles.jipin,'string',strcat('基频估计：',(num2str(frequency)),'Hz'));
            axes(handles.axes6);
            disp(size(audio_fft));
            f=(0:(length(myRecording)-1))*Fs/length(myRecording);
            plot(f(1:fix(length(myRecording)/2)),audio_fft(1:fix(length(myRecording)/2)));

            set(get(gca, 'Title'), 'String', '频域对数功率谱');
            set(get(gca, 'YLabel'), 'String', '功率/dB');
            set(get(gca, 'XLabel'), 'String', '频率/Hz');
            axes(handles.axes7);
            % disp(size(daopu(1:fix(size(daopu,1)/2),:)));
            plot(daopu(1:fix(size(daopu,1)/2),:));
            set(get(gca, 'Title'), 'String', '倒谱');
            set(get(gca, 'YLabel'), 'String', '功率');
            set(get(gca, 'XLabel'), 'String', 'ms');
        end
    end
    
    
