CREATE TABLE skin_lesion (
    "id" INT PRIMARY KEY AUTO,
    "code" VARCHAR(10) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" TEXT 
);

ALTER TABLE skin_lesion ADD CONSTRAINT UQ_skin_lesion_code UNIQUE(code);

ALTER TABLE skin_lesion RENAME COLUMN name to english_name;

ALTER TABLE skin_lesion ADD polish_name varchar(50) AFTER english_name;

INSERT INTO skin_lesion (id, code, english_name, polish_name, description) VALUES (
	null,
	'akiec',
	'Actinic keratoses and intraepithelial carcinomae',
	'Rogowacenie słoneczne lub rak śródnabłonkowy',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras efficitur dui ultricies accumsan pretium. Donec elementum mattis lorem a mollis. Sed eget congue nunc. Etiam tristique bibendum diam non bibendum. Curabitur pharetra quis dolor quis gravida. Donec tincidunt, lectus non bibendum congue, ligula sapien gravida eros, eu lacinia ante diam vestibulum augue. Praesent auctor finibus fringilla. Integer commodo mi et sapien blandit aliquam in at quam.'
);

INSERT INTO skin_lesion (id, code, english_name, polish_name, description) VALUES (
	null,
	'bcc',
	'Basal cell carcinoma',
	'Rak podstawnokomórkowy skóry',
	'Donec in ex accumsan, malesuada justo vitae, feugiat nisl. Donec vitae dui augue. Suspendisse consequat venenatis porttitor. Morbi vulputate mi in ligula laoreet gravida. Curabitur gravida nisi a mauris dictum, ac dictum lacus posuere. Mauris vitae justo ut ipsum venenatis mollis ac vel nunc. Donec feugiat justo dolor, in aliquet ipsum ullamcorper in. Aenean mattis nisl at imperdiet semper.'
);

INSERT INTO skin_lesion (id, code, english_name, polish_name, description) VALUES (
	null,
	'bkl',
	'Benign keratosis-like lesions',
	'Rogowacenie łojotokowe',
	'Aenean quam augue, placerat at interdum et, egestas vitae leo. Donec commodo ante at arcu porttitor pretium. Fusce et ultricies leo. Sed vel sem eu orci blandit posuere eu sed massa. Nulla ullamcorper molestie odio, nec porta elit feugiat vel. Proin porta, felis sagittis imperdiet imperdiet, metus sapien sollicitudin lacus, sed sodales eros erat et lacus. Nam mattis in felis malesuada molestie. Nunc auctor justo vel dui maximus, non laoreet est blandit.'
);

INSERT INTO skin_lesion (id, code, english_name, polish_name, description) VALUES (
	null,
	'df',
	'Dermatofibroma',
	'Dermatofibroma',
	'Sed in pulvinar orci. Cras ullamcorper placerat risus, eu cursus tortor semper non. Aliquam lobortis a ante et bibendum. Fusce lacus sem, tempus interdum eleifend vitae, condimentum et orci. Maecenas sed nisl rhoncus, dignissim lacus sit amet, pellentesque felis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam convallis elit ut aliquam porta. Nullam bibendum ipsum mi, sit amet molestie justo bibendum eu. Sed dignissim sit amet libero quis auctor. Sed non consequat elit. Duis justo felis, efficitur eget bibendum sit amet, consequat vel nulla. Curabitur pharetra accumsan nisi, sed suscipit lectus rutrum in. Praesent consequat dolor nisl, id efficitur mauris laoreet et. Integer egestas eu turpis ac mollis. Vivamus purus massa, sollicitudin a fringilla ut, pharetra semper ipsum.'
);

INSERT INTO skin_lesion (id, code, english_name, polish_name, description) VALUES (
	null,
	'nv',
	'Melanocytic nevus',
	'Znamię melanocytowe',
	'Aliquam ac tortor dictum, commodo ante nec, interdum nunc. Proin dui nisi, feugiat at tellus non, efficitur volutpat elit. Sed id arcu ut odio mollis congue eget quis sem. Pellentesque porttitor nunc quis ex lobortis gravida. Donec euismod vel lorem ac mollis. In hac habitasse platea dictumst. Nullam eu nisi pellentesque, sollicitudin tellus vitae, tristique tellus. Nam vestibulum in odio ut semper. Pellentesque quis dignissim nisl. Donec vitae sagittis lorem, ac mattis augue. Fusce posuere tortor ac lorem maximus egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;'
);

INSERT INTO skin_lesion (id, code, english_name, polish_name, description) VALUES (
	null,
	'vasc',
	'Pyogenic granulomas and hemorrhage',
	'Ziarniniak naczyniowy',
	'Maecenas mattis diam et libero interdum luctus. Morbi vehicula feugiat aliquet. Nullam nisi eros, porttitor eu molestie in, faucibus sit amet nisl. Nunc vel tempor felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse iaculis enim bibendum fringilla molestie. Aenean eget libero dolor. Curabitur rhoncus feugiat aliquet. Aliquam erat volutpat. In nisi nisi, auctor nec erat non, malesuada dignissim nibh. Mauris finibus pharetra massa, vel laoreet ligula malesuada vitae. Nam auctor non leo eu condimentum. Ut nulla justo, rutrum et leo quis, sodales ultricies mi.'
);

INSERT INTO skin_lesion (id, code, english_name, polish_name, description) VALUES (
	null,
	'mel',
	'Melanoma',
	'Czerniak',
	'Etiam congue ornare mi eget commodo. Nulla quis rhoncus sem. Proin porta quam eros, non pretium enim interdum eget. Fusce varius est ut gravida laoreet. Quisque sollicitudin mauris finibus nunc pellentesque varius. Nunc tincidunt mattis malesuada. Duis quis ante ac ipsum pellentesque fringilla sit amet non risus. Sed ultricies magna sit amet ipsum varius maximus. Sed sodales eros odio, ac ullamcorper est interdum ut.'
);