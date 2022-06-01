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

% Last Modified by GUIDE v2.5 01-Jun-2022 15:35:42

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
global flag flag1 flagy 

flag =0;
flag1 =0;
flagy =0;



% global audio Fs path

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

global AM_Fs
AM_Fs=0;


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
        set(handles.zhuantai,'string','״̬��ֹͣ');
    else
        set(handles.zhuantai,'string','״̬������');
    end
    luyingchuli(hObject, eventdata, handles);
% hObject    handle to luzhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    

% --- Executes on button press in jiangzaoba.
function jiangzao_Callback(hObject, eventdata, handles)
    [name, path1]= uigetfile('*.wav');
    global path
    path=strcat(path1,name);


    
% hObject    handle to jiangzaoba (see GCBO)
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
            set(get(gca, 'YLabel'), 'String', '����');
            t=title('ʱ����');
            t.FontSize=14;
            [desicion,daopu,frequency]=VoiceProcess(myRecording,Fs,hObject,handles);
            set(handles.xinbie,'string',strcat('�Ա�',desicion));
            set(handles.sample,'string',strcat('�����ʣ�',num2str(Fs)));
            set(handles.jipin,'string',strcat('��Ƶ���ƣ�',(num2str(frequency)),'Hz'));
            axes(handles.axes6);
            disp(size(audio_fft));
            % global flagy
            % if flagy==0
            f=(0:(length(myRecording)-1))*Fs/length(myRecording);
            plot(f(1:fix(length(myRecording)/2)),audio_fft(1:fix(length(myRecording)/2)));

            t=title('Ƶ�����������');
            t.FontSize=14;
            set(get(gca, 'YLabel'), 'String', '����/dB');
            set(get(gca, 'XLabel'), 'String', 'Ƶ��/Hz');
            % else
            % figure(1);
            % subplot(3,1,2);
            % spectrogram(myRecording,256,128,256,8000,'yaxis');
            % xlabel('ʱ��(s)')
            % ylabel('Ƶ��(KHz)')
            % title('����ͼ');
            % end
            axes(handles.axes7);
            % disp(size(daopu(1:fix(size(daopu,1)/2),:)));
            plot(daopu(1:fix(size(daopu,1)/2),:));
            t=title('����');
            t.FontSize=14;
            set(get(gca, 'YLabel'), 'String', '����');
            set(get(gca, 'XLabel'), 'String', 'ms');
        end
    end
    
    


% --- Executes on button press in playjiang.
function playjiang_Callback(hObject, eventdata, handles)
    global audio Fs
    if ~isempty(audio) & Fs ~=0
        disp('yes');
        sound(audio,Fs);
    end
% hObject    handle to playjiang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.

% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
    global path Fs audio
    disp(get(handles.slider2,'value'));
    if ~isempty(path)
        [y,fs]=audioread(path);
        do(hObject, eventdata, handles,y,fs,1);
        do(hObject, eventdata, handles,y,fs,2);
        Fs = round(get(handles.slider2,'value')*fs);
        if Fs<1000
            Fs=1000
        end
        audio = resample(y,Fs,fs);
        do(hObject, eventdata, handles,audio,Fs,3);
        set(handles.sample,'string',strcat('�����ʣ�',num2str(Fs)));
    end
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in jiangzhao1.
function jiangzhao1_Callback(hObject, eventdata, handles)
    global path
    set(handles.jiangzaoba,'string','����״̬����ʼ');
    global audio Fs
    if ~isempty(path)
        [audio ,Fs]=jiangzao(path,handles);
    end
    set(handles.jiangzaoba,'string','����״̬������');
  
% hObject    handle to jiangzhao1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ����ǻ��������ĺ���
function dov(hObject, eventdata, handles,audio,Fs,number)
    if number==1
        t=(0:length(audio)-1)/Fs;
        axes(handles.axes5);
        plot(t,audio);
        xlabel('T/s');
        ylabel('����');
        t=title('ʱ��ͼ');
        t.FontSize=14;
    elseif number==2
        f=(0:length(audio)-1)/length(audio)*Fs;
        axes(handles.axes6);
        y_f=abs(fft(audio));
        y_f=y_f/max(y_f);
        plot(f(find(f<Fs/2)),abs(log(y_f(find(f<Fs/2)))));
        xlabel('Ƶ�ʶ���/Hz');
        ylabel('����');
        t=title('�����ź�Ƶ��ͼ');
        t.FontSize=14;
    else
        f=(0:length(audio)-1)/length(audio)*Fs;
        axes(handles.axes7);
        y_f=abs(fft(audio));
        y_f=y_f/max(y_f);
        plot(f(find(f<Fs/2)),y_f(find(f<Fs/2)));
        xlabel('Ƶ��/Hz');
        ylabel('����');
        t=title('ͨ����ͨ�˲��ź�Ƶ��ͼ');
        t.FontSize=14;
    end


function do(hObject, eventdata, handles,audio,Fs,number)
    if number==1
        t=(0:length(audio)-1)/Fs;
        axes(handles.axes5);
        plot(t,audio);
        xlabel('T/s');
        ylabel('����');
        t=title('ʱ��ͼ');
        t.FontSize=14;
    elseif number==2
        f=(0:length(audio)-1)/length(audio)*Fs;
        axes(handles.axes6);
        y_f=abs(fft(audio));
        y_f=y_f/max(y_f);
        plot(f(find(f<4000)),y_f(find(f<4000)));
        xlabel('Ƶ��/Hz');
        ylabel('����');
        t=title('ԭ�ź�Ƶ��ͼ');
        t.FontSize=14;
    else
        f=(0:length(audio)-1)/length(audio)*Fs;
        axes(handles.axes7);
        y_f=abs(fft(audio));
        y_f=y_f/max(y_f);
        plot(f(find(f<4000)),y_f(find(f<4000)));
        xlabel('Ƶ��/Hz');
        ylabel('����');
        t=title('��������Ƶ��ͼ');
        t.FontSize=14;
    end


% --- Executes on button press in yupub.
function yupub_Callback(hObject, eventdata, handles)
    global flagy
    if flagy==0
        flagy=1;
    else
        flagy=0;
    end

% hObject    handle to yupub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yupub


% --- Executes on button press in tiaozhi.
function tiaozhi_Callback(hObject, eventdata, handles)
    set(handles.zhuantai,'string','״̬�����ƿ�ʼ');
    [t,b]=tiaozhi();
    global AM_signal AM_Fs 
    AM_signal=t;
    AM_Fs=b;
    disp(AM_Fs);
    set(handles.zhuantai,'string','״̬�����ƽ���');
    % ���Ƶ���֮���ʱ��ͼ
    dov(hObject, eventdata, handles,AM_signal,AM_Fs,1);

    % ���Ƶ���֮���Ƶ��ͼ
    dov(hObject, eventdata, handles,AM_signal,AM_Fs,2);

% hObject    handle to tiaozhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
    clear sound
    global AM_signal AM_Fs
    disp(AM_Fs);
    disp(size(AM_signal));
    % �����Ƶ��
    if ~ AM_Fs==0
        fc = round(get(handles.slider3,'value')*50000);
        set(handles.text12,'string',strcat(strcat('��ǰƵ�ʣ�',num2str(fc)),'Hz'));
        t=(0:length(AM_signal)-1)/AM_Fs;
        zaibo=cos(2*pi*fc*t);


        % ���˲�
        fs =AM_Fs;
        fl = fc;
        fh = fc+10000;   
        % wp ���ý�ֹƵ�ʣ���ͨ���ߴ��裩 
        wp=[fl/(fs/2) fh/(fs/2)];
        N=128; 
        % b=fir1(n,Wn,Window ) n�˲�������Wn��ֹƵ�ʣ�0��Wn��1��Wn=1��Ӧ�ڲ���Ƶ�ʵ�һ�롣
        % ����ƴ�ͨ�ʹ����˲���ʱ�� Wn=[W1 W2],W1�ܦء�W2��
        % Window �� ���������������ĳ���Ӧ����FIR�˲���ϵ�������������� n+1��
        % b�����˲���ϵ��
        b=fir1(N,wp,blackman(N+1));  %  blackman(n)����һ������Ϊn�Ĳ��������� 
        % ����λ�����˲�, If you use an all-zero filter (FIR), enter 1 for a.
        signa2 = filtfilt(b,1,AM_signal); 




        % ����ź�
        st =zeros(length(signa2),1);
        for b =1:length(signa2)
            st(b)=signa2(b)*zaibo(b);
        end
        
        

        % ��ͨ�˲���
        fh = 8000;
        fs=AM_Fs;
        % wp ���ý�ֹƵ�ʣ���ͨ���ߴ��裩 
        wp=fh/(fs/2);
        N=128; 
        % b=fir1(n,Wn,Window ) n�˲�������Wn��ֹƵ�ʣ�0��Wn��1��Wn=1��Ӧ�ڲ���Ƶ�ʵ�һ�롣
        % ����ƴ�ͨ�ʹ����˲���ʱ�� Wn=[W1 W2],W1�ܦء�W2��
        % Window �� ���������������ĳ���Ӧ����FIR�˲���ϵ�������������� n+1��
        % b�����˲���ϵ��
        b=fir1(N,wp,'low');  
        signa4 = filtfilt(b,1,st);
        signa41=resample(signa4,20000,fs);
        dov(hObject, eventdata, handles,signa41,20000,3);
        % plot(,abs(fft(signa4)))
        sound(signa41,20000);
    end



% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
