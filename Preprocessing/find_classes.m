%Create csv with all the classes
path_to_images = 'original/';
path_to_mat = 'segmented_onehot/';
load('annotations.mat');

image_names = annotations.keys;
n_images = numel(image_names);

classes = cell(73,1);
count = 1;
for j = 1 : n_images
  image_name = image_names{j};
  tuples = annotations(image_name);
  for i = 1:size(tuples,1)
    class = tuples(i,2);
    if ~any(strcmp(classes,class))
        classes(count,:) = class(1);
        count = count+1;
    end
  end
end
%save([path_to_mat 'classes.mat'], 'classes')
xlswrite('classes.xlsx',classes)
