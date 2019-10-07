INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'1.發表討論與本板討論方向無關的文章，必刪之。
2.討論下載以及盜版之相關文，必刪之。
3.過分謾罵或是筆戰文，必刪之。
4.違背善良風俗的文，必刪之。
5.灌水文及注音文，必刪之。
6.嚴重鬧板者，必刪之。',0,0,'20150111 10:00:00 AM','第九分局討論版版規',6,1,'版規',1);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'只能說做出了不同的嘗試，結果卻不如預期，坦白的說如果不是台灣電影有著台灣元素在，
整體《第九分局》的故事就是個劣質版的影集《超自然檔案》，而且男女主角還沒有火花。',0,0,'20150112 10:00:00 AM','這部電影的觀後感',9,1,'心得',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'有人可以分享一下這部的賣點在哪嗎?想知道一下評價',0,0,'20150113 10:00:00 AM','這部電影好看嗎',10,1,'問題',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'如題,大家有覺得誰更適合來演這個主角嗎?我覺得應該找林正英',0,0,'20150113 10:00:00 AM','主角的演員請誰來比較合適',10,1,'討論',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'1.發表討論與本板討論方向無關的文章，必刪之。
2.討論下載以及盜版之相關文，必刪之。
3.過分謾罵或是筆戰文，必刪之。
4.違背善良風俗的文，必刪之。
5.灌水文及注音文，必刪之。
6.嚴重鬧板者，必刪之。',0,0,'20150111 10:00:00 AM','極限逃生討論版版規',6,2,'版規',1);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'有人可以分享一下這部的賣點在哪嗎?想知道一下評價',0,0,'20150113 10:00:00 AM','這部電影好看嗎',10,2,'問題',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'會有人想看別的演員在這部的表現會如何嗎?',0,0,'20150113 10:00:00 AM','會想看誰來演這部?',10,2,'討論',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'1.發表討論與本板討論方向無關的文章，必刪之。
2.討論下載以及盜版之相關文，必刪之。
3.過分謾罵或是筆戰文，必刪之。
4.違背善良風俗的文，必刪之。
5.灌水文及注音文，必刪之。
6.嚴重鬧板者，必刪之。',0,0,'20150111 10:00:00 AM','你願意嫁給我老公嗎？討論版版規',6,3,'版規',1);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'基本上《你願意嫁給我老公嗎？》劇情和《婚禮之後》並無二致，
包含母愛，包含婚姻與愛情，同時亦關心著從原版就在關心的社會議題、
更透過不少抉擇糾結來點出「自己人生自己決定」之重要與必要。',0,0,'20150112 10:00:00 AM','這部電影的觀後感',9,3,'心得',0);

INSERT INTO Article(available,report,content,dislikeCount,likeCount,postTime,title,fk_author_id,fk_movie_id,tag,type)
values(1,0,'有人可以分享一下這部的賣點在哪嗎?想知道一下評價',0,0,'20150113 10:00:00 AM','這部電影好看嗎',10,3,'問題',0);

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

INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:31 AM',1,7);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:32 AM',1,8);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:33 AM',1,9);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'想看男女主角的火花應該去找別的電影類型吧','20191007 11:20:31 AM',2,7);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'在靈異恐怖電影找男女愛情是不是搞錯重點','20191007 11:20:32 AM',2,8);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'樓上害我笑了','20191007 11:20:33 AM',2,9);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'賣點就台灣文化元素跟靈異恐怖吧','20191007 11:20:31 AM',3,7);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'還有看別人倒楣就很開心','20191007 11:20:32 AM',3,8);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'樓上很壞喔','20191007 11:20:33 AM',3,9);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'找他來就不用演了啦,開始就結束了','20191007 11:20:31 AM',4,7);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'我想看劉德華','20191007 11:20:32 AM',4,8);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'我想看金城武','20191007 11:20:33 AM',4,9);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:31 AM',5,7);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:32 AM',5,8);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:33 AM',5,9);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:31 AM',8,7);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:32 AM',8,8);
INSERT INTO Reply(available,content,postTime,FK_ArticleBean_no,fk_author_no)
values(1,'版主大大辛苦了','20191007 11:20:33 AM',8,9);