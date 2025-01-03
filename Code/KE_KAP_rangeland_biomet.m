function [DateTime1,DOY_meteodata,Ta_1_1_1,TA_1_2_1,Rn_1_1_1,SHF_1_1_1,SHF_2_1_1,SHF_3_1_1,RH_1_1_1,SWin_1_1_1,SWC_1_1_1,SWC_2_1_1,SWC_3_1_1,Ts_1_1_1,Ts_2_1_1,Ts_3_1_1,PPFD_1_1_1,P_rain_1_1_1,DOY_meteofull,VPD1,H,LE,co2_flux,qc_co2_flux] = KE_KAP_EC_qc_co2(workbookFile,sheetName,startRow,endRow)
%IMPORTFILE1 Import data from a spreadsheet
%   [DateTime1,DOY_meteodata,Ta_1_1_1,TA_1_2_1,Rn_1_1_1,SHF_1_1_1,SHF_2_1_1,SHF_3_1_1,RH_1_1_1,SWin_1_1_1,SWC_1_1_1,SWC_2_1_1,SWC_3_1_1,Ts_1_1_1,Ts_2_1_1,Ts_3_1_1,PPFD_1_1_1,P_rain_1_1_1,DOY_meteofull,VPD1,H,LE,co2_flux,qc_co2_flux]
%   = IMPORTFILE1(FILE) reads data from the first worksheet in the
%   Microsoft Excel spreadsheet file named FILE and returns the data as
%   column vectors.
%
%   [DateTime1,DOY_meteodata,Ta_1_1_1,TA_1_2_1,Rn_1_1_1,SHF_1_1_1,SHF_2_1_1,SHF_3_1_1,RH_1_1_1,SWin_1_1_1,SWC_1_1_1,SWC_2_1_1,SWC_3_1_1,Ts_1_1_1,Ts_2_1_1,Ts_3_1_1,PPFD_1_1_1,P_rain_1_1_1,DOY_meteofull,VPD1,H,LE,co2_flux,qc_co2_flux]
%   = IMPORTFILE1(FILE,SHEET) reads from the specified worksheet.
%
%   [DateTime1,DOY_meteodata,Ta_1_1_1,TA_1_2_1,Rn_1_1_1,SHF_1_1_1,SHF_2_1_1,SHF_3_1_1,RH_1_1_1,SWin_1_1_1,SWC_1_1_1,SWC_2_1_1,SWC_3_1_1,Ts_1_1_1,Ts_2_1_1,Ts_3_1_1,PPFD_1_1_1,P_rain_1_1_1,DOY_meteofull,VPD1,H,LE,co2_flux,qc_co2_flux]
%   = IMPORTFILE1(FILE,SHEET,STARTROW,ENDROW) reads from the specified
%   worksheet for the specified row interval(s). Specify STARTROW and
%   ENDROW as a pair of scalars or vectors of matching size for
%   dis-contiguous row intervals. To read to the end of the file specify an
%   ENDROW of inf.
%
%	Date formatted cells are converted to MATLAB serial date number format
%	(datenum).
%   Non-numeric cells are replaced with: NaN
%
% Example:
%   [DateTime1,DOY_meteodata,Ta_1_1_1,TA_1_2_1,Rn_1_1_1,SHF_1_1_1,SHF_2_1_1,SHF_3_1_1,RH_1_1_1,SWin_1_1_1,SWC_1_1_1,SWC_2_1_1,SWC_3_1_1,Ts_1_1_1,Ts_2_1_1,Ts_3_1_1,PPFD_1_1_1,P_rain_1_1_1,DOY_meteofull,VPD1,H,LE,co2_flux,qc_co2_flux] = KE_KAP_EC_qc_co2('KAP_EC_2019_qc_co2.xlsx','Sheet1',2,17521);
%
%   See also XLSREAD.

% Auto-generated by MATLAB on 2023/11/12 21:56:19

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 3
    startRow = 2;
    endRow = 17521;
end

%% Import the data, extracting spreadsheet dates in MATLAB serial date number format (datenum)
[~, ~, raw, dateNums] = xlsread(workbookFile, sheetName, sprintf('A%d:X%d',startRow(1),endRow(1)),'' , @convertSpreadsheetDates);
for block=2:length(startRow)
    [~, ~, tmpRawBlock,tmpDateNumBlock] = xlsread(workbookFile, sheetName, sprintf('A%d:X%d',startRow(block),endRow(block)),'' , @convertSpreadsheetDates);
    raw = [raw;tmpRawBlock]; %#ok<AGROW>
    dateNums = [dateNums;tmpDateNumBlock]; %#ok<AGROW>
end
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Replace date strings by MATLAB serial date numbers (datenum)
R = ~cellfun(@isequalwithequalnans,dateNums,raw) & cellfun('isclass',raw,'char'); % Find spreadsheet dates
raw(R) = dateNums(R);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
DateTime1 = data(:,1);
DOY_meteodata = data(:,2);
Ta_1_1_1 = data(:,3);
TA_1_2_1 = data(:,4);
Rn_1_1_1 = data(:,5);
SHF_1_1_1 = data(:,6);
SHF_2_1_1 = data(:,7);
SHF_3_1_1 = data(:,8);
RH_1_1_1 = data(:,9);
SWin_1_1_1 = data(:,10);
SWC_1_1_1 = data(:,11);
SWC_2_1_1 = data(:,12);
SWC_3_1_1 = data(:,13);
Ts_1_1_1 = data(:,14);
Ts_2_1_1 = data(:,15);
Ts_3_1_1 = data(:,16);
PPFD_1_1_1 = data(:,17);
P_rain_1_1_1 = data(:,18);
DOY_meteofull = data(:,19);
VPD1 = data(:,20);
H = data(:,21);
LE = data(:,22);
co2_flux = data(:,23);
qc_co2_flux = data(:,24);

