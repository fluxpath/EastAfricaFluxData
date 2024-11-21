function [TIMESTAMP,RECORD,FC,FC_mass,FC_QC,FC_samples,LE1,LE_QC,LE_samples,H1,H_QC,H_samples,NETRAD,G,SG,energy_closure,poor_energy_closure_flg,Bowen_ratio,TAU,TAU_QC,USTAR,TSTAR,TKE,Tair2,TA_SIGMA_1_1_1,RH,T_DP_1_1_1,e,e_sat,TA_2_1_1,RH_2_1_1,T_DP_2_1_1,e_probe,e_sat_probe,H2O_probe,PA,PA_SIGMA,VPD2,U,U_SIGMA,V,V_SIGMA,W,W_SIGMA,T_SONIC,T_SONIC_SIGMA,sonic_azimuth,WS,WS_RSLT,WD_SONIC,WD_SIGMA,WD,WS_MAX,CO2,CO2_SIGMA,CO2_density,CO2_density_SIGMA,H2O,H2O_SIGMA,H2O_density,H2O_density_SIGMA,CO2_sig_strgth_Min,H2O_sig_strgth_Min,Rain,NETRAD_meas,SW_IN,PPFD1,PPFD2,sun_azimuth,sun_elevation,hour_angle,sun_declination,air_mass_coeff,daytime,Tsoil,TS_2_1_1,SWC,SWC_2_1_2,cs65x_ec_1_1_1,cs65x_ec_2_1_1,G_PLATE_1_1_1,G_PLATE_2_1_1,shfp_cal_1_1_1,shfp_cal_2_1_1,FETCH_MAX,FETCH_90,FETCH_55,FETCH_40,UPWND_DIST_INTRST,FTPRNT_DIST_INTRST,FTPRNT_EQUATION] = KE_Aus_Fluxdata_complete(filename, startRow, endRow)
%IMPORTFILE1 Import numeric data from a text file as column vectors.
%   [TIMESTAMP,RECORD,FC,FC_MASS,FC_QC,FC_SAMPLES,LE1,LE_QC,LE_SAMPLES,H1,H_QC,H_SAMPLES,NETRAD,G,SG,ENERGY_CLOSURE,POOR_ENERGY_CLOSURE_FLG,BOWEN_RATIO,TAU,TAU_QC,USTAR,TSTAR,TKE,TAIR2,TA_SIGMA_1_1_1,RH,T_DP_1_1_1,E,E_SAT,TA_2_1_1,RH_2_1_1,T_DP_2_1_1,E_PROBE,E_SAT_PROBE,H2O_PROBE,PA,PA_SIGMA,VPD2,U,U_SIGMA,V,V_SIGMA,W,W_SIGMA,T_SONIC,T_SONIC_SIGMA,SONIC_AZIMUTH,WS,WS_RSLT,WD_SONIC,WD_SIGMA,WD,WS_MAX,CO2,CO2_SIGMA,CO2_DENSITY,CO2_DENSITY_SIGMA,H2O,H2O_SIGMA,H2O_DENSITY,H2O_DENSITY_SIGMA,CO2_SIG_STRGTH_MIN,H2O_SIG_STRGTH_MIN,RAIN,NETRAD_MEAS,SW_IN,PPFD1,PPFD2,SUN_AZIMUTH,SUN_ELEVATION,HOUR_ANGLE,SUN_DECLINATION,AIR_MASS_COEFF,DAYTIME,TSOIL,TS_2_1_1,SWC,SWC_2_1_2,CS65X_EC_1_1_1,CS65X_EC_2_1_1,G_PLATE_1_1_1,G_PLATE_2_1_1,SHFP_CAL_1_1_1,SHFP_CAL_2_1_1,FETCH_MAX,FETCH_90,FETCH_55,FETCH_40,UPWND_DIST_INTRST,FTPRNT_DIST_INTRST,FTPRNT_EQUATION]
%   = IMPORTFILE1(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [TIMESTAMP,RECORD,FC,FC_MASS,FC_QC,FC_SAMPLES,LE1,LE_QC,LE_SAMPLES,H1,H_QC,H_SAMPLES,NETRAD,G,SG,ENERGY_CLOSURE,POOR_ENERGY_CLOSURE_FLG,BOWEN_RATIO,TAU,TAU_QC,USTAR,TSTAR,TKE,TAIR2,TA_SIGMA_1_1_1,RH,T_DP_1_1_1,E,E_SAT,TA_2_1_1,RH_2_1_1,T_DP_2_1_1,E_PROBE,E_SAT_PROBE,H2O_PROBE,PA,PA_SIGMA,VPD2,U,U_SIGMA,V,V_SIGMA,W,W_SIGMA,T_SONIC,T_SONIC_SIGMA,SONIC_AZIMUTH,WS,WS_RSLT,WD_SONIC,WD_SIGMA,WD,WS_MAX,CO2,CO2_SIGMA,CO2_DENSITY,CO2_DENSITY_SIGMA,H2O,H2O_SIGMA,H2O_DENSITY,H2O_DENSITY_SIGMA,CO2_SIG_STRGTH_MIN,H2O_SIG_STRGTH_MIN,RAIN,NETRAD_MEAS,SW_IN,PPFD1,PPFD2,SUN_AZIMUTH,SUN_ELEVATION,HOUR_ANGLE,SUN_DECLINATION,AIR_MASS_COEFF,DAYTIME,TSOIL,TS_2_1_1,SWC,SWC_2_1_2,CS65X_EC_1_1_1,CS65X_EC_2_1_1,G_PLATE_1_1_1,G_PLATE_2_1_1,SHFP_CAL_1_1_1,SHFP_CAL_2_1_1,FETCH_MAX,FETCH_90,FETCH_55,FETCH_40,UPWND_DIST_INTRST,FTPRNT_DIST_INTRST,FTPRNT_EQUATION]
%   = IMPORTFILE1(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [TIMESTAMP,RECORD,FC,FC_mass,FC_QC,FC_samples,LE1,LE_QC,LE_samples,H1,H_QC,H_samples,NETRAD,G,SG,energy_closure,poor_energy_closure_flg,Bowen_ratio,TAU,TAU_QC,USTAR,TSTAR,TKE,Tair2,TA_SIGMA_1_1_1,RH,T_DP_1_1_1,e,e_sat,TA_2_1_1,RH_2_1_1,T_DP_2_1_1,e_probe,e_sat_probe,H2O_probe,PA,PA_SIGMA,VPD2,U,U_SIGMA,V,V_SIGMA,W,W_SIGMA,T_SONIC,T_SONIC_SIGMA,sonic_azimuth,WS,WS_RSLT,WD_SONIC,WD_SIGMA,WD,WS_MAX,CO2,CO2_SIGMA,CO2_density,CO2_density_SIGMA,H2O,H2O_SIGMA,H2O_density,H2O_density_SIGMA,CO2_sig_strgth_Min,H2O_sig_strgth_Min,Rain,NETRAD_meas,SW_IN,PPFD1,PPFD2,sun_azimuth,sun_elevation,hour_angle,sun_declination,air_mass_coeff,daytime,Tsoil,TS_2_1_1,SWC,SWC_2_1_2,cs65x_ec_1_1_1,cs65x_ec_2_1_1,G_PLATE_1_1_1,G_PLATE_2_1_1,shfp_cal_1_1_1,shfp_cal_2_1_1,FETCH_MAX,FETCH_90,FETCH_55,FETCH_40,UPWND_DIST_INTRST,FTPRNT_DIST_INTRST,FTPRNT_EQUATION] = KE_Aus_Fluxdata_complete('2019_KE-Aus_Fluxdata_complete.csv',2, 10849);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2023/11/20 22:20:01

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Read columns of data as strings:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric strings to numbers.
% Replace non-numeric strings with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90]
    % Converts strings in the input cell array to numbers. Replaced non-numeric
    % strings with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(thousandsRegExp, ',', 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric strings to numbers.
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end

% Convert the contents of column with dates to serial date numbers using
% date format string (datenum).
for row=1:length(dataArray{1})
    try
        numericData(row, 1) = datenum(dataArray{1}{row}, 'mm/dd/yyyy HH:MM');
        raw{row, 1} = numericData(row, 1);
    catch me
    end
end

%% Split data into numeric and cell columns.
rawNumericColumns = raw(:, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90]);
rawCellColumns = raw(:, [73,91]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
TIMESTAMP = cell2mat(rawNumericColumns(:, 1));
RECORD = cell2mat(rawNumericColumns(:, 2));
FC = cell2mat(rawNumericColumns(:, 3));
FC_mass = cell2mat(rawNumericColumns(:, 4));
FC_QC = cell2mat(rawNumericColumns(:, 5));
FC_samples = cell2mat(rawNumericColumns(:, 6));
LE1 = cell2mat(rawNumericColumns(:, 7));
LE_QC = cell2mat(rawNumericColumns(:, 8));
LE_samples = cell2mat(rawNumericColumns(:, 9));
H1 = cell2mat(rawNumericColumns(:, 10));
H_QC = cell2mat(rawNumericColumns(:, 11));
H_samples = cell2mat(rawNumericColumns(:, 12));
NETRAD = cell2mat(rawNumericColumns(:, 13));
G = cell2mat(rawNumericColumns(:, 14));
SG = cell2mat(rawNumericColumns(:, 15));
energy_closure = cell2mat(rawNumericColumns(:, 16));
poor_energy_closure_flg = cell2mat(rawNumericColumns(:, 17));
Bowen_ratio = cell2mat(rawNumericColumns(:, 18));
TAU = cell2mat(rawNumericColumns(:, 19));
TAU_QC = cell2mat(rawNumericColumns(:, 20));
USTAR = cell2mat(rawNumericColumns(:, 21));
TSTAR = cell2mat(rawNumericColumns(:, 22));
TKE = cell2mat(rawNumericColumns(:, 23));
Tair2 = cell2mat(rawNumericColumns(:, 24));
TA_SIGMA_1_1_1 = cell2mat(rawNumericColumns(:, 25));
RH = cell2mat(rawNumericColumns(:, 26));
T_DP_1_1_1 = cell2mat(rawNumericColumns(:, 27));
e = cell2mat(rawNumericColumns(:, 28));
e_sat = cell2mat(rawNumericColumns(:, 29));
TA_2_1_1 = cell2mat(rawNumericColumns(:, 30));
RH_2_1_1 = cell2mat(rawNumericColumns(:, 31));
T_DP_2_1_1 = cell2mat(rawNumericColumns(:, 32));
e_probe = cell2mat(rawNumericColumns(:, 33));
e_sat_probe = cell2mat(rawNumericColumns(:, 34));
H2O_probe = cell2mat(rawNumericColumns(:, 35));
PA = cell2mat(rawNumericColumns(:, 36));
PA_SIGMA = cell2mat(rawNumericColumns(:, 37));
VPD2 = cell2mat(rawNumericColumns(:, 38));
U = cell2mat(rawNumericColumns(:, 39));
U_SIGMA = cell2mat(rawNumericColumns(:, 40));
V = cell2mat(rawNumericColumns(:, 41));
V_SIGMA = cell2mat(rawNumericColumns(:, 42));
W = cell2mat(rawNumericColumns(:, 43));
W_SIGMA = cell2mat(rawNumericColumns(:, 44));
T_SONIC = cell2mat(rawNumericColumns(:, 45));
T_SONIC_SIGMA = cell2mat(rawNumericColumns(:, 46));
sonic_azimuth = cell2mat(rawNumericColumns(:, 47));
WS = cell2mat(rawNumericColumns(:, 48));
WS_RSLT = cell2mat(rawNumericColumns(:, 49));
WD_SONIC = cell2mat(rawNumericColumns(:, 50));
WD_SIGMA = cell2mat(rawNumericColumns(:, 51));
WD = cell2mat(rawNumericColumns(:, 52));
WS_MAX = cell2mat(rawNumericColumns(:, 53));
CO2 = cell2mat(rawNumericColumns(:, 54));
CO2_SIGMA = cell2mat(rawNumericColumns(:, 55));
CO2_density = cell2mat(rawNumericColumns(:, 56));
CO2_density_SIGMA = cell2mat(rawNumericColumns(:, 57));
H2O = cell2mat(rawNumericColumns(:, 58));
H2O_SIGMA = cell2mat(rawNumericColumns(:, 59));
H2O_density = cell2mat(rawNumericColumns(:, 60));
H2O_density_SIGMA = cell2mat(rawNumericColumns(:, 61));
CO2_sig_strgth_Min = cell2mat(rawNumericColumns(:, 62));
H2O_sig_strgth_Min = cell2mat(rawNumericColumns(:, 63));
Rain = cell2mat(rawNumericColumns(:, 64));
NETRAD_meas = cell2mat(rawNumericColumns(:, 65));
SW_IN = cell2mat(rawNumericColumns(:, 66));
PPFD1 = cell2mat(rawNumericColumns(:, 67));
PPFD2 = cell2mat(rawNumericColumns(:, 68));
sun_azimuth = cell2mat(rawNumericColumns(:, 69));
sun_elevation = cell2mat(rawNumericColumns(:, 70));
hour_angle = cell2mat(rawNumericColumns(:, 71));
sun_declination = cell2mat(rawNumericColumns(:, 72));
air_mass_coeff = rawCellColumns(:, 1);
daytime = cell2mat(rawNumericColumns(:, 73));
Tsoil = cell2mat(rawNumericColumns(:, 74));
TS_2_1_1 = cell2mat(rawNumericColumns(:, 75));
SWC = cell2mat(rawNumericColumns(:, 76));
SWC_2_1_2 = cell2mat(rawNumericColumns(:, 77));
cs65x_ec_1_1_1 = cell2mat(rawNumericColumns(:, 78));
cs65x_ec_2_1_1 = cell2mat(rawNumericColumns(:, 79));
G_PLATE_1_1_1 = cell2mat(rawNumericColumns(:, 80));
G_PLATE_2_1_1 = cell2mat(rawNumericColumns(:, 81));
shfp_cal_1_1_1 = cell2mat(rawNumericColumns(:, 82));
shfp_cal_2_1_1 = cell2mat(rawNumericColumns(:, 83));
FETCH_MAX = cell2mat(rawNumericColumns(:, 84));
FETCH_90 = cell2mat(rawNumericColumns(:, 85));
FETCH_55 = cell2mat(rawNumericColumns(:, 86));
FETCH_40 = cell2mat(rawNumericColumns(:, 87));
UPWND_DIST_INTRST = cell2mat(rawNumericColumns(:, 88));
FTPRNT_DIST_INTRST = cell2mat(rawNumericColumns(:, 89));
FTPRNT_EQUATION = rawCellColumns(:, 2);

