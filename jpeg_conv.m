%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Author : Nakul Rao I
%%% Date : April 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ret = 'Yes';

while (ret == 'Yes')
    % Window asking for location of text file
    [filename, pathname] = uigetfile({'*.txt'},'Choose file to convert');
    
    % Open the file and read its contents into 'im_array'
    id = fopen([pathname,filename]);
    im_array = fread(id);
    fclose(id);
    
    index1 = 0;
    len = length(im_array);
    for i = 1:len 
        if((im_array(i) == 255) && (im_array(i+1) == 216))
            index1 = i;
        end
    end
    
    index2 = 0;
    len = length(im_array);
    for i = 1:len
        if((im_array(i) == 255) && (im_array(i+1) == 217))
            index2 = i+1;
        end
    end
    
    if (index1 == 0) || (index2 == 0)
        message;
        
    elseif (index2 > index1)
        im = im_array(index1:index2);
        
        % Window asking for location to save the JPEG file
        [FileName,PathName] = uiputfile({'*.jpg'},'Select location to save');
    
        % Create file and write header into it followed by pixel data
        fileID = fopen([PathName,FileName], 'a');
        fwrite(fileID,im);
        fclose(fileID);
    end
    
    % Prompt to convert another image
    ret = question;
end

