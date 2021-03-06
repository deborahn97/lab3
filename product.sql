CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

INSERT INTO `product` (`id`,`name`,`description`,`category`,`price`,`date_created`)
VALUES
  (1,"per inceptos hymenaeos. Mauris ut","nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum","Tarts","99.96","2021-2-26 17:12:10"),
  (2,"non quam. Pellentesque","Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem","Cupcakes","51.65","2021-12-23 11:25:11"),
  (3,"accumsan sed, facilisis vitae,","dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris","Cupcakes","58.78","2021-3-19 19:53:21"),
  (4,"Suspendisse dui. Fusce diam nunc,","Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer","Cakes","73.84","2021-7-14 5:33:04"),
  (5,"Integer sem elit,","natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin","Tarts","65.56","2021-8-20 5:37:10"),
  (6,"libero. Morbi accumsan laoreet","est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus.","Tarts","16.91","2021-8-20 14:53:52"),
  (7,"erat, in consectetuer","consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus","Others","79.96","2021-4-2 12:16:04"),
  (8,"lorem vitae","nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in,","Tarts","36.97","2021-12-1 7:10:53"),
  (9,"natoque penatibus","erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et","Cakes","57.90","2021-11-10 5:58:49"),
  (10,"dui. Cras pellentesque. Sed","et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis.","Tarts","66.59","2021-1-29 4:00:31"),
  (11,"quis arcu vel","neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel","Cakes","34.86","2021-3-16 0:09:04"),
  (12,"Ut tincidunt orci quis lectus.","ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate,","Cakes","44.62","2021-2-13 22:03:06"),
  (13,"Duis sit amet","nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis","Cakes","42.35","2021-2-8 22:56:55"),
  (14,"porta elit,","egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at,","Cookies","17.36","2021-4-11 9:04:23"),
  (15,"ac arcu.","odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci.","Others","76.44","2021-3-23 0:04:05"),
  (16,"Vestibulum ut","vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse","Tarts","62.22","2021-6-27 16:50:22"),
  (17,"Sed nunc","lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis","Others","36.46","2021-12-20 8:38:01"),
  (18,"enim. Curabitur massa. Vestibulum accumsan","Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,","Tarts","47.57","2021-12-11 21:54:54"),
  (19,"consectetuer, cursus","dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu.","Others","49.92","2021-7-23 16:35:42"),
  (20,"non, hendrerit id, ante. Nunc","neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum","Cakes","51.26","2021-7-26 4:48:31"),
  (21,"Cras pellentesque. Sed","consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante.","Cookies","72.84","2021-2-8 11:23:27"),
  (22,"dui augue eu tellus. Phasellus","blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit","Cupcakes","64.02","2021-4-15 14:31:03"),
  (23,"tincidunt, nunc ac","non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum.","Others","71.31","2021-8-26 9:26:59"),
  (24,"fermentum fermentum arcu.","Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula","Cakes","34.83","2021-6-20 18:03:13"),
  (25,"dolor sit amet, consectetuer","Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit,","Cookies","20.22","2021-1-5 16:46:30"),
  (26,"sodales. Mauris blandit","tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit","Breads","81.85","2021-6-2 19:20:30"),
  (27,"scelerisque neque sed","neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur","Breads","46.27","2021-2-4 18:00:58"),
  (28,"ornare sagittis felis. Donec tempor,","Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum","Tarts","19.85","2021-3-17 19:46:01"),
  (29,"magna. Lorem ipsum dolor sit","libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada.","Cookies","84.40","2021-2-7 12:46:32"),
  (30,"ipsum leo elementum sem,","enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum","Breads","45.86","2021-6-14 4:42:12");
