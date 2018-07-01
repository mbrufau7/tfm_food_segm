%Process the ground truth for each image and save it as a segmented image
function segmented_data()
  path_to_images = 'original/';
  path_to_saved = 'segmented_images/';
  path_to_mat = 'segmented_mat/';

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
  
  %Find distinguishable color for
  colors_mat = distinguishable_colors(73, 'k');
  colors = {};
  for i = 1:size(colors_mat,1)
      colors{end+1} = colors_mat(i, :);
  end
  
  image_names = annotations.keys;
  n_images = numel(image_names);
  
  %Get the set of all classes
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
    
    % Region
    annotated = zeros(size(im));
    for i = 1:size(tuples,1)
        color = M(char(tuples(i,2)));
        annotated = insertShape(annotated,'FilledPolygon', tuples(i,5),'Color',color, 'Opacity',1, 'SmoothEdges', false);
    end
  
    xy=cellfun(@textXYcoords,tuples(:,5), 'UniformOutput', false);

    save([path_to_mat image_name '.mat'], 'annotated')
    imwrite(annotated, [path_to_saved image_name '.png']);
  end
  
end