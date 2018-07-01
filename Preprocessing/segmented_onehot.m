%Process the ground truth for each image and save it as separate segmented
%images
function onehot_data()
  path_to_images = 'original/';
  path_to_mat = 'segmented_onehot/';

  % Load the annotations in a map structure
   load('annotations.mat');
  
  % Each entry in the map corresponds to the annotations of an image. 
  % Each entry contains many cell tuples as annotated food
  % A tuple is composed of 8 cells with the annotated:
  % - (1) item category (food for all tuples)
  % - (2) item class (e.g. pasta, patate, ...)
  % - (3) item name
  % - (4) boundary type (polygonal for all tuples)
  % - (5) item's boundary points [x1,y1,x2,y2,...,xn,yn]
  % - (6) item's bounding box [x1,y1,x2,y2,x3,y3,x4,y4]
  
  colors = {};
  for i = 1:73
      colors{end+1} = i;
  end
  
  image_names = annotations.keys;
  n_images = numel(image_names);
  
  classes = {};
  for j = 1 : n_images
      image_name = image_names{j};
      tuples = annotations(image_name);
      for i = 1:size(tuples,1)
        class = tuples(i,2);
        if ~any(strcmp(classes,class))
            classes{end+1} = class{1};
        end
      end
  end
  M = containers.Map(classes,colors);

  for j = 1 : n_images
  
    image_name = image_names{j}; 
    
    im = imread([path_to_images image_name '.jpg']);
    
    tuples = annotations(image_name);
        
    count = size(tuples,1);
    for i = 1:size(tuples,1)
        annotated = zeros(size(im));
        annotated_image = insertShape(zeros(size(im)),'FilledPolygon', tuples(i,5),'Color',[255,255,255], 'Opacity',1, 'SmoothEdges', false);
        annotated = rgb2gray(annotated_image);
        mkdir(['segmented_onehot/' image_name]);
        class = tuples(i,2);
        class = strrep(class{1}, '/', '_');
        imwrite(annotated, [path_to_mat image_name '/' class '.png'])
    end
  
    xy=cellfun(@textXYcoords,tuples(:,5), 'UniformOutput', false);
  end
  
end