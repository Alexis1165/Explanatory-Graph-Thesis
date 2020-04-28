    function [imageLbp,conMat] = lbp(image)

        image = [image(:,1) image image(:,end)];
        image = [image(1,:) ; image ; image(end,:)];

        im = double(image);
        [I, J] = size(im);
        imageLbp = zeros(I-2, J-2);
        conMat = ones((I-2)*(J-2),8);
        NEIGHBORS = [0,1; 1,1; 1,0; 1,-1; 0,-1; -1,-1; -1,0; -1,+1; ];
        con_values = zeros(1, 8);

        for y = 2:I-1
            for x = 2:J-1
                actual_value = im(y, x);
                if(actual_value ~=0)
                    bin2dec_value = 0;
                    for k=1:8
                        neighbors_value = im(y+NEIGHBORS(k,1),x+NEIGHBORS(k,2));
                        diff_value = neighbors_value - actual_value;
                        if (diff_value>0)
                            con_values(1,k) = 1;
                            bin2dec_value = bin2dec_value + 2^(k-1);
                        elseif (diff_value<0)
                            con_values(1,k) = -1;
                        else
                            con_values(1,k) = 0;
                            bin2dec_value = bin2dec_value + 2^(k-1);
                        end
                    end
                    imageLbp(y-1, x-1) = bin2dec_value;
                    conMat(((x-2)*(I-2)+(y-1)),:) = con_values ;
                end
            end
        end
    end
