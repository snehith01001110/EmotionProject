filelist = dir(fullfile('/Users/snehithnayak/MATLAB/Projects/Emotion Project/database','*.*'));

if length(filelist) <= 4
    datafile = 'icml_face_data.xlsx';
    data = readtable(datafile);

    dim = size(data);

    for j = 1:dim(1)
        im = data(j,3);
        im = table2array(im);
        im = cellfun(@str2num,im,'UniformOutput',false);
        im = cell2mat(im);
        Image = [];

        for i = 1:48
            Image = cat(1,Image,im((((i-1)*48)+1):(i*48)));
        end

        maxx = max(Image(:));  
        minx = min(Image(:));
        img  = (Image - minx) / (maxx - minx);

        databaseFolder = 'database';

        emotion = data(j,1);
        emotion = table2array(emotion);

        switch(emotion)
            case 0
                fileFolder = 'Angry';
            case 1
                fileFolder = 'Disgust';
            case 2
                fileFolder = 'Fear';
            case 3
                fileFolder = 'Happy';
            case 4
                fileFolder = 'Sad';
            case 5
                fileFolder = 'Suprise';
            case 6
                fileFolder = 'Neutral';
        end



        filename = strcat(num2str(j),'.png');
        filepath = fullfile(databaseFolder,fileFolder,filename);
        imwrite(img,filepath)
    end
end

