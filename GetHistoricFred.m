function [ data ] = GetHistoricFred(symbol,startDate,endDate)
%   Foked by Julio Lima (Universidade Federal do Ceará)
%   Query date ranges from Fre finance.
%   Sample usage: GetHistoricFred(M1','04/27/2010','04/27/2017')

    %Define a format of query.
    format = 'yyyy-mm-dd';

    %First transform to the number format, it's a generic one.
    startDateNum = datenum(startDate);
    endDateNum = datenum(endDate);

    %First transform to the number format, it's a generic one.
    startDateStr = datestr(startDateNum, format);
    endDateStr = datestr(endDateNum, format');

    %Define how much attributes will be used.
    n_attb = 3;
    attributes(n_attb); %root the url address to download in csv format
    attributes(1) = strcat('&id=',symbol);
    attributes(2) = strcat('&cosd=',startDateStr);
    attributes(3) = strcat('&coed=',endDateStr);

    %Define root of query.
    root = 'https://fred.stlouisfed.org/graph/fredgraph.csv?chart_type='; %root the url address to download in csv format
    
    %Interact root with attributes.
    for i_cat = 1:n_attb
        root = strcat(root,attributes(i_cat))
    end
    
    url = root;
        
    url = strrep(url,' ','%20');
    response = urlread(url);
    data = textscan(response,'%s %f %f %f %f %f','delimiter',',','HeaderLines',1);
    
    lala
    
end
