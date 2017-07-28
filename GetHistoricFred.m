function [ data ] = GetHistoricFred(symbol,startDate,endDate)
%   Forked by Julio Lima (Universidade Federal do Ceará)
%   Query date ranges from Fre finance.
%   Sample usage: GetHistoricFred('M1','04/27/2010','04/27/2017')

    %Define a format of query.
    format = 'yyyy-mm-dd';

    %First transform to the number format, it's a generic one.
    startDateNum = datenum(startDate);
    endDateNum = datenum(endDate);

    %First transform to the number format, it's a generic one.
    startDateStr = datestr(startDateNum, format);
    endDateStr = datestr(endDateNum, format);

    %Define how much attributes will be used.
    n_attb = 3;
    
    names = cell(10,1);
    for i=1:10
        attributes{i} = ['Sample Text ' num2str(i)];
    end    
    attributes(1) = cellstr(strcat('&id=',symbol));
    attributes(2) = cellstr(strcat('&cosd=',startDateStr));
    attributes(3) = cellstr(strcat('&coed=',endDateStr));

    %Define root of query.
    root = strcat('https://fred.stlouisfed.org/graph/fredgraph.csv?chart_type='); %root the url address to download in csv format
    
    %Interact root with attributes.
    for i_cat = 1:n_attb
        root = strcat(root,attributes(i_cat));
    end
    
    url = root;
    
    %Receive the file;
    response = urlread(char(url));
    
    %Scan and convert the file to cells and return.
    data = textscan(response,'%s %f %f %f %f %f','delimiter',',','HeaderLines',1);  
    
end
