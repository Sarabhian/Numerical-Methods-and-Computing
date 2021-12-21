classdef rough1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        DisplayButton          matlab.ui.control.Button
        TextArea               matlab.ui.control.TextArea
        Lamp_2                 matlab.ui.control.Lamp
        gateOutputGaugeLabel   matlab.ui.control.Label
        gateOutputGauge        matlab.ui.control.SemicircularGauge
        gatecapacityKnobLabel  matlab.ui.control.Label
        gatecapacityKnob       matlab.ui.control.Knob
        UIAxes                 matlab.ui.control.UIAxes
        opengateSwitchLabel    matlab.ui.control.Label
        opengateSwitch         matlab.ui.control.ToggleSwitch
        Panel                  matlab.ui.container.Panel
        STARTButton            matlab.ui.control.Button
        STOPButton             matlab.ui.control.Button
        Lamp                   matlab.ui.control.Lamp
        Starter_text           matlab.ui.control.TextArea
        Lamp_3                 matlab.ui.control.Lamp
    end

    
    properties (Access = private)
        a; % arduino 
        start; % starts the app
        u; % ultrasonic sensor object
        s; % servo motor object
        stop; % stops all 
    end
    
    methods (Access = private)
        
   
        function gate_output = servo_gate(app,s, knob_value , servoSwitch)
            gate_capacity= knob_value/100;
            if(servoSwitch) 
                writePosition(s,gate_capacity);
            end
            gate_output=  readPosition(s);    
        end
            
       
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
          % app.a=arduino("COM4","Uno");
          % app.u=ultrasonic(app.a,'D2');
          % app.s=servo(app.a,'D3');
        end

        % Button pushed function: STARTButton
        function STARTButtonPushed(app, event)
            app.start=1;
            app.stop=0;
            if (app.start==1)
                app.Starter_text.Value="Welcome to Smart parking System";
            elseif (app.stop==1)
                app.Starter_text.Value= "Sorry Smart parking System is Closed";
            end
           
        end

        % Button pushed function: STOPButton
        function STOPButtonPushed(app, event)
             app.stop=1;
             app.start=0;
             if (app.start==1)
                app.Starter_text.Value="Welcome to Smart parking System";
            elseif (app.stop==1)
                app.Starter_text.Value="Sorry Smart parking System is Closed";
             end
             clear app.a app.s app.u 
             clear all;
             
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1202 536];
            app.UIFigure.Name = 'MATLAB App';

            % Create DisplayButton
            app.DisplayButton = uibutton(app.UIFigure, 'push');
            app.DisplayButton.BackgroundColor = [0.6745 0.7412 0.7333];
            app.DisplayButton.FontWeight = 'bold';
            app.DisplayButton.Position = [285 401 100 22];
            app.DisplayButton.Text = 'Display';

            % Create TextArea
            app.TextArea = uitextarea(app.UIFigure);
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.Position = [239 436 172 69];

            % Create Lamp_2
            app.Lamp_2 = uilamp(app.UIFigure);
            app.Lamp_2.Position = [723 384 20 20];
            app.Lamp_2.Color = [1 0 0];

            % Create gateOutputGaugeLabel
            app.gateOutputGaugeLabel = uilabel(app.UIFigure);
            app.gateOutputGaugeLabel.HorizontalAlignment = 'center';
            app.gateOutputGaugeLabel.Position = [799 397 68 22];
            app.gateOutputGaugeLabel.Text = 'gate Output';

            % Create gateOutputGauge
            app.gateOutputGauge = uigauge(app.UIFigure, 'semicircular');
            app.gateOutputGauge.Position = [772 434 120 65];

            % Create gatecapacityKnobLabel
            app.gatecapacityKnobLabel = uilabel(app.UIFigure);
            app.gatecapacityKnobLabel.HorizontalAlignment = 'center';
            app.gatecapacityKnobLabel.Position = [518 380 76 22];
            app.gatecapacityKnobLabel.Text = 'gate capacity';

            % Create gatecapacityKnob
            app.gatecapacityKnob = uiknob(app.UIFigure, 'continuous');
            app.gatecapacityKnob.Position = [525 436 60 60];

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.Position = [220 271 733 98];

            % Create opengateSwitchLabel
            app.opengateSwitchLabel = uilabel(app.UIFigure);
            app.opengateSwitchLabel.HorizontalAlignment = 'center';
            app.opengateSwitchLabel.Position = [638 397 59 22];
            app.opengateSwitchLabel.Text = 'open gate';

            % Create opengateSwitch
            app.opengateSwitch = uiswitch(app.UIFigure, 'toggle');
            app.opengateSwitch.Position = [658 445 20 45];

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.BackgroundColor = [0.2235 0.6039 0.9804];
            app.Panel.Position = [10 302 203 221];

            % Create STARTButton
            app.STARTButton = uibutton(app.Panel, 'push');
            app.STARTButton.ButtonPushedFcn = createCallbackFcn(app, @STARTButtonPushed, true);
            app.STARTButton.BackgroundColor = [0 1 0];
            app.STARTButton.Position = [23 151 52 45];
            app.STARTButton.Text = 'START';

            % Create STOPButton
            app.STOPButton = uibutton(app.Panel, 'push');
            app.STOPButton.ButtonPushedFcn = createCallbackFcn(app, @STOPButtonPushed, true);
            app.STOPButton.BackgroundColor = [1 0 0];
            app.STOPButton.Position = [122 151 52 46];
            app.STOPButton.Text = 'STOP';

            % Create Lamp
            app.Lamp = uilamp(app.Panel);
            app.Lamp.Position = [89 119 20 20];
            app.Lamp.Color = [1 0 0];

            % Create Starter_text
            app.Starter_text = uitextarea(app.Panel);
            app.Starter_text.HorizontalAlignment = 'center';
            app.Starter_text.Position = [23 48 151 48];

            % Create Lamp_3
            app.Lamp_3 = uilamp(app.UIFigure);
            app.Lamp_3.Position = [450 378 20 20];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = rough1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end