INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'1.發表討論與本板討論方向無關的文章，必刪之。
2.討論下載以及盜版之相關文，必刪之。
3.過分謾罵或是筆戰文，必刪之。
4.違背善良風俗的文，必刪之。
5.灌水文及注音文，必刪之。
6.嚴重鬧板者，必刪之。',0,0,'20150111 10:00:00 AM','第九分局討論版版規',10,1,'版規',1);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'只能說做出了不同的嘗試，結果卻不如預期，坦白的說如果不是台灣電影有著台灣元素在
，整體《第九分局》的故事就是個劣質版的影集《超自然檔案》，而且男女主角還沒有火花。',0,0,'20150112 10:00:00 AM','這部電影的觀後感',9,1,'心得',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'有人可以分享一下這部的賣點在哪嗎?',0,0,'20150113 10:00:00 AM','這部電影好看嗎',10,1,'問題',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'如題,大家有覺得誰更適合來演這個主角嗎?',0,0,'20150113 10:00:00 AM','主角的演員請誰來比較合適',10,1,'討論',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'1.發表討論與本板討論方向無關的文章，必刪之。
2.討論下載以及盜版之相關文，必刪之。
3.過分謾罵或是筆戰文，必刪之。
4.違背善良風俗的文，必刪之。
5.灌水文及注音文，必刪之。
6.嚴重鬧板者，必刪之。',0,0,'20150111 10:00:00 AM','極限逃生討論版版規',10,2,'版規',1);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'有人可以分享一下這部的賣點在哪嗎?',0,0,'20150113 10:00:00 AM','這部電影好看嗎',10,2,'問題',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'會有人想看別的演員在這部的表現嗎?',0,0,'20150113 10:00:00 AM','會想看誰來演這部?',10,2,'討論',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'1.發表討論與本板討論方向無關的文章，必刪之。
2.討論下載以及盜版之相關文，必刪之。
3.過分謾罵或是筆戰文，必刪之。
4.違背善良風俗的文，必刪之。
5.灌水文及注音文，必刪之。
6.嚴重鬧板者，必刪之。',0,0,'20150111 10:00:00 AM','你願意嫁給我老公嗎？討論版版規',10,3,'版規',1);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'基本上《你願意嫁給我老公嗎？》劇情和《婚禮之後》並無二致，
包含母愛，包含婚姻與愛情，同時亦關心著從原版就在關心的社會議題、
更透過不少抉擇糾結來點出「自己人生自己決定」之重要與必要。',0,0,'20150112 10:00:00 AM','這部電影的觀後感',9,3,'心得',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'有人可以分享一下這部的賣點在哪嗎?',0,0,'20150113 10:00:00 AM','這部電影好看嗎',10,3,'問題',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'為什麼他要選擇把女兒接回來自己養?有人能分析一下這些行為跟動機嗎?',0,0,'20150113 10:00:00 AM','奧斯卡的行為跟這麼做的理由',10,3,'討論',0);

INSERT INTO AType(type,typeName)
values(0,'一般');

INSERT INTO AType(type,typeName)
values(1,'置頂');

INSERT INTO SysTag(tag)
values('版規');

  INSERT INTO SysTag(tag)
values('熱門');

  INSERT INTO SysTag(tag)
values('精華');

  INSERT INTO SysTag(tag)
values('討論');

  INSERT INTO SysTag(tag)
values('心得');

  INSERT INTO SysTag(tag)
values('問題');

INSERT INTO Tag(tag)
values('討論');

  INSERT INTO Tag(tag)
values('心得');

  INSERT INTO Tag(tag)
values('問題');