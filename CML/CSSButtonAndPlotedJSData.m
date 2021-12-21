classdef CSSButtonAndPlotedJSData < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure    matlab.ui.Figure
        JSDataHTML  matlab.ui.control.HTML
        UIAxes      matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        numclicks % Description
    end
   

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.JSDataHTML.Data = 0;
            app.numclicks = 0;
        end

        % Data changed function: JSDataHTML
        function plotJSData(app, event)
           data = app.JSDataHTML.Data;
           app.numclicks = app.numclicks + 1;
           
           for k = 1:length(app.numclicks)
               aline = animatedline(app.UIAxes,'MaximumNumPoints',10000,'Marker','*');
               addpoints(aline,app.numclicks,data(k));
               drawnow
           end
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [500 500 406 423];
            app.UIFigure.Name = 'UI Figure';

            % Create JSDataHTML
            app.JSDataHTML = uihtml(app.UIFigure);
            app.JSDataHTML.HTMLSource = 'dataForm.html';
            app.JSDataHTML.DataChangedFcn = createCallbackFcn(app, @plotJSData, true);
            app.JSDataHTML.Position = [20 303 368 76];

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Random Numbers')
            xlabel(app.UIAxes, 'Number of Events')
            ylabel(app.UIAxes, 'Value')
            app.UIAxes.Position = [20 39 368 252];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = CSSButtonAndPlotedJSData

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