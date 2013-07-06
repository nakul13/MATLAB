%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Author : Nakul Rao I
%%% Date : March 2013 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ret = 'Yes';

while (ret == 'Yes')
    % Window asking for location of binary file
    [filename, pathname] = uigetfile({'*.bin'},'Choose binary file to convert');
    
    % Open the file and read its contents into 'im_inv'
    id = fopen([pathname,filename]);
    im = fread(id);
    fclose(id);
    
    % BMP header
    header = [66 77 66 96 9 0 0 0 0 0 66 0 0 0 40 0 0 0 64 1 0 0 32 1 0 0 1 0 16 0 3 0 0 0 0 120 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 248 0 0 224 7 0 0 31 0 0 0];
    
    % Window asking for location to save the BMP file
    [FileName,PathName] = uiputfile({'*.bmp'},'Select location to save');
    
    % Create file and write header into it followed by pixel data
    fileID = fopen([PathName,FileName], 'a');
    fwrite(fileID,header);
    fwrite(fileID,im);
    fclose(fileID);
    
    % Prompt to convert another image
    ret = question;
end
