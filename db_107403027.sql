CREATE DATABASE  IF NOT EXISTS `db_107403027` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_107403027`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_107403027
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Category_id` int NOT NULL,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'科技'),(2,'遊戲'),(3,'教育'),(4,'地方創生'),(5,'空間'),(6,'飲食'),(7,'時尚'),(8,'音樂'),(9,'新春賀喜'),(10,'攝影');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `Comment_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  `user_comment` varchar(2000) NOT NULL,
  `proposal_response` varchar(2000) DEFAULT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`Comment_id`,`proposal_id`,`member_id`),
  KEY `proposal_id_idx` (`proposal_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `member_id_comment` FOREIGN KEY (`member_id`) REFERENCES `member` (`Member_id`),
  CONSTRAINT `proposal_id_comment` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`Proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,5,9,'不好意思，我的贊助編號是P108681B 想問一下什麼時候會收到呢～！ 感謝','您好，禮盒已經送出，和豐店到店，應該已經抵達喔～ 感謝您對募資計畫的支持喔～ :)','2020-11-18 22:12:03'),(2,1,10,'GoPlus 已更新連線方式，你們還支援24小時不斷線嗎','丹尼的影片 1 : 40 秒有講解如何連線 GoPlus 功能喔～','2020-11-18 22:12:03'),(3,1,3,'請問當寶可夢執行背景應用程式or手機休眠時，247還會持續運作抓怪轉牌嗎?',NULL,'2020-11-18 22:12:03'),(4,5,4,'讚！！每日寫日記','太棒了，歡迎在我們FB粉絲頁跟大家分享喔～','2020-11-18 22:12:03'),(5,4,8,'加油！你的作品很有特色，如果size再完整一些，單價低一些應該很有市場的！','謝謝您的支持與鼓勵！！','2020-11-18 22:12:03'),(6,10,1,'上次短褲沒跟到，這次上衣短褲共下買。','謝謝您的支持 : )','2020-11-18 22:12:03'),(7,1,2,'我多訂一個能退嘛','要請您寄一封信到 support@zeczec.com','2020-11-18 22:12:03'),(8,2,6,'請問軟糖保存期限多久呢？因為同事都是垃圾讓人很需要囤貨 :)','您好，保存期限是一年喔！希望可以陪你平靜渡過被垃圾氣到不行的每一天 :)','2020-11-18 22:12:03'),(9,1,7,'有機會可以早點出貨嗎？6/1要等很久',NULL,'2020-11-18 22:12:03'),(10,3,1,'請問留言tag兩個人的活動我不小心讓他的網頁跳出來該怎麼再操作一次，謝謝。','您好！已另外傳送嘖嘖站內信給您，再請查收','2020-11-18 22:12:03');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `FAQ_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `last_editor_id` int NOT NULL,
  `question` varchar(200) NOT NULL,
  `answer` varchar(2000) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`FAQ_id`,`proposal_id`,`last_editor_id`),
  KEY `proposal_id_idx` (`proposal_id`),
  KEY `last_editor_id_idx` (`last_editor_id`),
  CONSTRAINT `last_editor_id_FAQ` FOREIGN KEY (`last_editor_id`) REFERENCES `member` (`Member_id`),
  CONSTRAINT `proposal_id_FAQ` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`Proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,4,8,'要如何下單？','先點擊想要贊助的方案之後，照著以下步驟 1、選擇您想要「信用卡付款」或是「ATM轉帳」2、選擇您要宅配或是超商取貨，並輸入對應的收件資訊 3、確認贊助人資訊，並按下立刻付款。 4、之後會根據付款方式給您相關的付款資料 5、付款後回到嘖嘖頁面，點選右上角選單的贊助紀錄，就可以確認剛剛是否付款成功囉！','2022-05-24 17:13:00'),(2,4,8,'請問何時會出貨？','預計於2022年7月初開始依訂單編號陸續出貨。','2022-05-24 15:03:00'),(3,1,7,'請問有什麼需要注意的呢？','由於新品PVC材質，於生產完成即封裝寄送，初次開啟會有些許味道屬於正常，收到後可先打開放置通風處即可消除。若有需清潔，可用中性清潔劑清洗乾淨並完全晾乾，切勿長時間曝曬於太陽下。 ','2022-05-24 15:03:00'),(4,2,6,'有多入之大宗採購需求該怎麼做？','歡迎加入LINE@好友搜尋「@550yisos」，將會有專人與您接洽喔！','2022-05-23 15:28:00'),(5,7,3,'付款方式有哪些？','目前開放ATM、信用卡。','2022-05-23 15:28:00'),(6,3,4,'可以用信用卡分期嗎？','【台灣的募資平台因應政府規定，均沒有提供分期付款的功能】不過，持卡者如果想以自己信卡來做【分期付款】這樣是可以的。但是，這樣就會有分期利率手續費的衍生（相關利率依每家銀行規範為準）所以，想要以分期付款的朋友，請你先與你持卡銀行確認相關資訊。','2022-05-23 15:18:00'),(7,10,1,'十月才能收到商品嗎？','事實上如果不受疫情或戰爭的影響~八月就能出貨了！目前確定八月最少可以出100組~先下單先拿到喔','2022-05-24 21:30:00'),(8,6,4,'有使用說明嗎?','請至粉絲專頁~魔術吸管~參考一下喔~','2022-05-15 14:36:00'),(9,6,4,'是否有分男女版型呢 ?','我們的版型皆為中性版型，中性版是男女皆適合喔！','2022-05-19 15:06:00'),(10,5,9,'可否寄送到國外？','目前我們的商品可以寄送到下列地區：香港(運費$250) / 澳門(運費$250) / 中國(運費$250) / 美國(運費$800) / 日本(運費$600)','2022-05-19 15:06:00');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `following_record`
--

DROP TABLE IF EXISTS `following_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `following_record` (
  `FollowingRecord_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`FollowingRecord_id`,`proposal_id`,`member_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `proposal_id_followingRecord` (`proposal_id`),
  CONSTRAINT `member_id_followingRecord` FOREIGN KEY (`member_id`) REFERENCES `member` (`Member_id`),
  CONSTRAINT `proposal_id_followingRecord` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`Proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `following_record`
--

LOCK TABLES `following_record` WRITE;
/*!40000 ALTER TABLE `following_record` DISABLE KEYS */;
INSERT INTO `following_record` VALUES (6,10,1),(10,3,1),(7,1,2),(3,1,3),(4,5,4),(8,2,6),(9,1,7),(5,4,8),(1,6,9),(2,1,10);
/*!40000 ALTER TABLE `following_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_id` int NOT NULL AUTO_INCREMENT,
  `member_name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `salt` varchar(15) NOT NULL,
  PRIMARY KEY (`Member_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `salt_UNIQUE` (`salt`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'毛若穎','921003614','in.consequat@yahoo.com','366 苗栗縣銅鑼鄉民權路31號','0oplfZ16tyLX'),(2,'林芳岑','988008346','adipiscing.enim.mi@outlook.com','600 嘉義市東區世賢路24號','7gB%z9Svg8EW'),(3,'胡素芝','922830125','nullam.velit@yahoo.com','325 桃園市龍潭區淮子埔一路29號','JJQF0j%tkx3i'),(4,'童雅婷','958351743','sed.auctor@hotmail.com','540 南投縣南投市三和一路14號','Rv$uGmL&C!%g'),(5,'賴麗萍','912587773','sagittis.nullam@google.com','508 彰化縣和美鎮潭北路15號','XcZg6Be^cU2y'),(6,'黃志斌','960105109','nec.leo.morbi@protonmail.com','711 臺南市歸仁區崙頂二街11號','aZjy*GvZt@s*'),(7,'廖松白','961749001','sociosqu.ad@yahoo.com','411 臺中市太平區北田路14號','j8tI5!wG88PM'),(8,'徐嘉柏','928735721','proin.non@protonmail.com','801 高雄市前金區自立二路18號','n7UDOe0uspZk'),(9,'李麗珠','968169143','arcu.vel.quam@hotmail.com','201 基隆市信義區義四路22號','wlmM33nAD@SR'),(10,'施泓音','970691667','dui.quis.accumsan@google.com','622 嘉義縣大林鎮早知31號','&@^ODhk0MH&l'),(15,'穆姿赭','09126543982','crowdfounding@gmail.com','桃園市中壢區中大路300號','#sviR81Ve@');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_credential`
--

DROP TABLE IF EXISTS `member_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_credential` (
  `MemberCredential_id` int NOT NULL AUTO_INCREMENT,
  `hashed_user_id` int NOT NULL,
  `hashed_pwd_string` varchar(64) NOT NULL,
  PRIMARY KEY (`MemberCredential_id`,`hashed_user_id`),
  UNIQUE KEY `hashed_user_id_UNIQUE` (`hashed_user_id`),
  UNIQUE KEY `hashed_pwd_string_UNIQUE` (`hashed_pwd_string`),
  CONSTRAINT `hashed_user_id_memberCredential` FOREIGN KEY (`hashed_user_id`) REFERENCES `member` (`Member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_credential`
--

LOCK TABLES `member_credential` WRITE;
/*!40000 ALTER TABLE `member_credential` DISABLE KEYS */;
INSERT INTO `member_credential` VALUES (2,2,'07703ba76ae595a212c8317146fb292fb773f34314a3708a6f3e916bbf6e499c'),(8,8,'1a4c96ddeda1e2bfc16abd7bd6f8a72dc416c10c824747cbe5b1f9cc20671c40'),(3,3,'1caf7cfa34bdb90fd7a332dfed5a5e0d1a153d6a164234aa98b7ba611b83abe7'),(1,1,'5459ffea690882061cfa56fa9033278370e48de356c700637aad68d14f2ae0ae'),(10,10,'5ad2e13f01b6c6597301b4dd8fa5b2a055c6e4245e84f63344f6bbb5c0f3c802'),(5,5,'7a09363a667de652e1666b0810219bb7886036dca13af909cd755c80df946365'),(7,7,'a5c5e74448987538a8bffda3518f59e2f3785cf460d4f882a2c563af654fe13f'),(6,6,'ccd108b762527fcdcdb8c5b6cad6480e9b81a5d92f29e6793d6865b274bc50dc'),(15,15,'d4273a1c226113fd2bbe3bcf72a7dcb9b9d5f3f31c3e51d0e786b4bdd11d08dc'),(9,9,'e9c59dd5748d8c0be520b37658c8da542720916cc6d7ff627ad2ba0e76237bca'),(4,4,'ea8ced964d6826e1eede67dccaea05e543e4bcf84ff06d6af8f7877413a91538');
/*!40000 ALTER TABLE `member_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal`
--

DROP TABLE IF EXISTS `proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal` (
  `Proposal_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `proposal_title` varchar(200) NOT NULL,
  `proposal_content` varchar(1000) DEFAULT NULL,
  `amount` int NOT NULL,
  `goal` int NOT NULL,
  `status` varchar(2) NOT NULL,
  `viewed_num` int NOT NULL,
  `create_date` datetime NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `is_deactivated` char(1) NOT NULL,
  PRIMARY KEY (`Proposal_id`),
  UNIQUE KEY `Proposal_title_UNIQUE` (`proposal_title`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id_proposal` FOREIGN KEY (`category_id`) REFERENCES `category` (`Category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal`
--

LOCK TABLES `proposal` WRITE;
/*!40000 ALTER TABLE `proposal` DISABLE KEYS */;
INSERT INTO `proposal` VALUES (1,1,'《 247 Catcher 》｜ 最全面的【抓寶 & 打團】輔助道具','大家好！我們是 PhotoFast 銀箭資訊。今年，我們創造出了一款能符合 Pokemon GO 玩家需求的抓寶利器！不只能突破現有的連線一小時限制，更讓您能夠在打團戰或攻道館時輕鬆應戰！',2393696,100000,'2',1150,'2022-04-06 00:00:00','2022-07-05 00:00:00','0'),(2,6,'【最後 3 天】台灣首發輕機能舒壓軟糖 ✧ Kimoo 情緒平衡軟糖 ✧日本專利「特濃舒壓ＧＡＢＡ」Ｘ「快樂Ｌ色氨酸」，面對再多鳥事也能有平靜好心情！','喜劇演員的起笑配方！募資前百人實測 → 75.8% 有感回饋：「吃了真的有鬆～」——— 你的心累了嗎？\"Not being O.K. is O.K.\"\" 沒關係，是情緒啊！吃一顆回到內在平靜小宇宙！\"',377200,200000,'2',251,'2022-03-23 00:00:00','2022-06-21 00:00:00','0'),(3,3,'數感宇宙探索課程｜為國小生打造的生活數學 DIY 影音學習組｜給孩子一堂不一樣的數學課','本課程結合數感實驗室逾 10 年數學教育經驗、史丹佛大學「成長型數學思維」理論。內容針對國小中年級以上的孩子，強調具體、跨域、手作、情境。鼓勵孩子探索思考，讓孩子愛上數學。',3737138,500000,'2',641,'2022-05-04 00:00:00','2022-08-02 00:00:00','0'),(4,7,'『Organs without body 2014 S/S 服裝秀』','「ORGANS WITHOUT BODY 」為 藝術家「安地羊 Andy Yen」2012創立之服裝品牌。',5050,100000,'3',4,'2013-08-21 00:00:00','2013-11-19 00:00:00','1'),(5,4,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','本次募資計畫是由茶品牌 Three Leafs Tea 透過45款茶做為與消費者連結的媒介，結合茶與藝術向世界說台灣。以「人、事、物、學、遊」五個層面介紹清晰易懂的台灣在地文化故事。',852482,50000,'3',194,'2021-12-12 00:00:00','2022-03-12 00:00:00','1'),(6,5,'樂待STAY 桃園水岸店 on Line 募資企劃-我們讓孩子樂呆 父母樂待','',282244,943038,'2',63,'2022-05-25 00:00:00','2022-08-23 00:00:00','0'),(7,3,'謎路人Way of Puzzle 2022【It\'s All I Have】專輯發?企劃','',45651,400000,'2',31,'2022-05-23 00:00:00','2022-08-21 00:00:00','0'),(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0,100000,'2',0,'2022-03-22 00:00:00',NULL,'0'),(9,10,'SIRUI 75mm ?變形鏡頭','還停留在變形鏡頭既沉且大的印象中？還以為變形鏡頭是高昂的貴族鏡頭？不！消費級別的變形鏡頭世界早已誕生——思銳1.33X寬銀幕變形鏡頭！目前，思銳已推出24mm/F2.8、35mm/F1.8、50mm/F1.8三個焦段，其以更小的體積、更高的性價比、更強的電影質感，讓大眾影友真正能無負擔地接觸變形鏡頭。',532600,100000,'3',200,'2021-07-20 00:00:00','2021-10-18 00:00:00','1'),(10,1,'【 HOMI｜地表最強全情境短袖 & EAM 登山防曬衣 】featuring CORDURA fabric / MIT 設計製造！','ㄧ件夏天的短袖可以有什麼不同？CORDURA 柔軟強韌，非塗層物理涼感，抗UV 前所未有的透氣調節，MIT 質感獨家設計製造 # 針對夏天的穿著環境，更舒適的穿著體驗而衍生出 HOMI 的第一件短袖物件 Movement T shirt，利用材料及設計創造出ㄧ件可以在夏日的不同環境下，隨時給你舒適機能與質感外型的短袖！',1556942,100000,'3',3148,'2022-05-24 00:00:00','2022-08-22 00:00:00','1'),(11,3,'好睏枕【讓你好好睏】脖子的溫柔靠山，釋放你的壓力與電力｜一夜好眠不是夢','台灣有超過20萬以上的人有睡眠障礙，你是不是也是其中一員？經常睡不好、睡不飽、醒來卻還是滿身疲累，一夜好眠成了一種奢求。',0,100000,'2',0,'2022-06-11 21:24:35','2022-09-09 21:24:35','0'),(12,3,'枕頭','好睡',0,900000,'2',0,'2022-06-11 21:26:53','2022-09-09 21:26:53','0'),(13,3,'可樂','好喝',0,80000,'2',0,'2022-06-11 21:27:54','2022-09-09 21:27:54','0'),(14,4,'雪碧','好喝',0,80000,'2',0,'2022-06-11 21:30:19','2022-09-09 21:30:19','0'),(15,3,'芬達','橘子',0,90000,'2',0,'2022-06-11 21:33:13','2022-09-09 21:33:13','0'),(16,2,'沙士','黑松',0,70000,'2',0,'2022-06-11 21:34:43','2022-09-09 21:34:43','0'),(17,2,'蘋果','富蘭克林',0,70000,'2',0,'2022-06-11 21:35:52','2022-09-09 21:35:52','0'),(18,2,'switch','好玩',0,100000,'3',0,'2022-06-12 19:46:26','2022-09-10 19:46:26','0'),(19,1,'ps4','好玩到爆',0,10000,'2',0,'2022-06-14 00:00:02',NULL,'0'),(20,6,'ps5','炫泡',0,90000,'2',0,'2022-06-14 00:07:27','2022-09-12 00:13:35','0');
/*!40000 ALTER TABLE `proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_member`
--

DROP TABLE IF EXISTS `proposal_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_member` (
  `ProposalMember_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`ProposalMember_id`,`proposal_id`,`member_id`),
  KEY `proposal_id_idx` (`proposal_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `member_id_proposalMember` FOREIGN KEY (`member_id`) REFERENCES `member` (`Member_id`),
  CONSTRAINT `proposal_id_proposalMember` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`Proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_member`
--

LOCK TABLES `proposal_member` WRITE;
/*!40000 ALTER TABLE `proposal_member` DISABLE KEYS */;
INSERT INTO `proposal_member` VALUES (2,1,7),(3,2,6),(5,3,4),(1,4,8),(9,5,9),(7,6,4),(8,6,3),(4,7,3),(10,8,2),(11,9,10),(6,10,1),(12,10,8),(13,11,3),(14,12,3),(15,13,3),(16,14,3),(17,15,3),(18,16,3),(19,17,3),(20,18,3),(21,19,3),(22,20,3);
/*!40000 ALTER TABLE `proposal_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_option`
--

DROP TABLE IF EXISTS `proposal_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_option` (
  `ProposalOption_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `proposalOption_title` varchar(200) NOT NULL,
  `proposalOption_description` varchar(1000) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`ProposalOption_id`,`proposal_id`),
  KEY `proposal_id_idx` (`proposal_id`),
  CONSTRAINT `proposal_id_proposalOption` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`Proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_option`
--

LOCK TABLES `proposal_option` WRITE;
/*!40000 ALTER TABLE `proposal_option` DISABLE KEYS */;
INSERT INTO `proposal_option` VALUES (1,1,'247 早鳥超值組','內容物包含：247 Catcher x 1 自動點擊器 x 1 usb - C 充電線 x 1 專屬收納包 x 1 247 Catcher 說明書 x 1【重要提醒】台灣本島地區免運費，外島地區收額外運費。全球地區皆可寄，運費於結帳時顯示。若需統編請輸入收件資訊時備註。',2290),(2,3,'單組 體驗初學','Ａ數學分析／Ｂ邏輯推演／Ｃ策略規劃：３組擇１ ',1790),(3,9,'【好評追加！超早鳥衣褲組合】','Movement 全情境短T X1 +  Movement 全情境短褲 X1 +  ▲未來售價：5060，現省1161 ',3899),(4,5,'小資支持 12個月每月茶包禮','【感謝禮】回饋您對我們計畫的支持，我們每個月會寄一包茶葉體驗包 + 電子刊物',800),(5,10,'75mm 超級早鳥價格','75mm F1.8 Anamorphic 1.33X Lens X1 ',18800),(6,8,'【 嘖嘖超早鳥優惠 】 未來售價 $1790｜現省300元','金字塔、諾克斯碉堡、龍之屋（三選一） ×1 款',1490),(7,6,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','想參與STAY最有名的親子活動嗎，此為一大一小體驗邀請，歡迎爸媽帶著你的孩子，或是孩子帶著你最愛的爸媽，參加我們90分鐘的專屬親子派對，和我們一起慶祝STAY桃園水岸店的開幕',1888),(8,7,'【只想聽歌組】','【謎路人 2022 It\'s All I Have】 概念專輯 1張 ',720),(9,4,'原畫畫作一件10號','原畫畫作',15000),(10,2,'【嘖嘖價】1 入 83 折','Kimoo情緒平衡軟糖 1 盒',690);
/*!40000 ALTER TABLE `proposal_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor_record`
--

DROP TABLE IF EXISTS `sponsor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor_record` (
  `SponsorRecord_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `proposal_option_id` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`SponsorRecord_id`,`member_id`,`proposal_option_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `proposal_option_id_idx` (`proposal_option_id`),
  CONSTRAINT `member_id_sponsorRecord` FOREIGN KEY (`member_id`) REFERENCES `member` (`Member_id`),
  CONSTRAINT `proposal_option_id_sponsorRecord` FOREIGN KEY (`proposal_option_id`) REFERENCES `proposal_option` (`ProposalOption_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_record`
--

LOCK TABLES `sponsor_record` WRITE;
/*!40000 ALTER TABLE `sponsor_record` DISABLE KEYS */;
INSERT INTO `sponsor_record` VALUES (1,9,4,800),(2,10,1,2290),(3,3,1,2290),(4,4,4,800),(5,8,9,15000),(6,1,5,18800),(7,2,1,2290),(8,6,10,690),(9,7,1,2290),(10,1,2,1790),(11,3,2,5000);
/*!40000 ALTER TABLE `sponsor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_107403027'
--

--
-- Dumping routines for database 'db_107403027'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateProposal`(
	IN in_member_id INT,
    IN in_title VARCHAR(120),
    IN in_content TEXT,
    IN in_goal INT,
    IN in_category INT,
    OUT affected_row_num INT
)
BEGIN
	SET @num=0;
    
    ### 新增提案
	INSERT INTO proposal 
	(category_id , proposal_title , proposal_content , amount , goal , status , viewed_num , create_date , due_date , is_deactivated)
	VALUES(in_category , in_title , in_content , 0 , in_goal , 1 , 0 , NOW() , NULL , 0);
    SELECT row_count() INTO affected_row_num;

    ### 插入新增提案紀錄到proposal_member
	INSERT INTO proposal_member
	(proposal_id , member_id)
	VALUES((SELECT MAX(Proposal_id) FROM proposal),in_member_id);
    SET affected_row_num=affected_row_num+(SELECT row_count());
    
    
    ###列出新增結果
    SELECT 
	proposal_id,proposal_title,proposal_content,amount,goal,status,viewed_num,create_date,due_date,category_name
	FROM proposal
	JOIN category
	ON proposal.category_id=category.Category_id
    WHERE proposal_id=(SELECT MAX(Proposal_id) FROM proposal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteMember`(
	IN in_member INT,
    OUT affected_row_num INT
)
BEGIN
	DELETE FROM member
    WHERE member_id=in_member;
    SELECT row_count() INTO affected_row_num;
    
    DELETE FROM member_credential
    WHERE hashed_user_id = in_member;
    SET affected_row_num=affected_row_num+(SELECT row_count());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN in_member_id INT,
    OUT num_of_rows_in_the_result_set INT
)
BEGIN
	SELECT following_record.member_id,proposal.proposal_title,proposal.amount AS proposal_amount,proposal.goal AS proposal_goal
	FROM following_record
	JOIN proposal
	ON following_record.proposal_id=proposal.Proposal_id
	WHERE following_record.member_id=in_member_id;
    SELECT found_rows() INTO num_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN in_member_id INT,
    OUT num_of_rows_in_the_result_set INT
)
BEGIN
	SELECT subtable.* , proposal.proposal_title , proposal.status 
    FROM proposal
	JOIN
		(SELECT sponsor_record.member_id , proposal_option.proposal_id , proposal_option.proposalOption_title , sponsor_record.amount
		FROM sponsor_record
		JOIN proposal_option
		ON sponsor_record.proposal_option_id=proposal_option.ProposalOption_id)subtable
	ON proposal.Proposal_id = subtable.proposal_id
    WHERE member_id=in_member_id;
    SELECT found_rows() INTO num_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN in_ratio FLOAT,
    OUT num_of_rows_in_the_result_set INT
)
BEGIN
	SELECT Proposal_id , proposal_title , amount , goal , (amount/goal) AS ratio
	FROM proposal
	WHERE (amount/goal)>in_ratio
    ORDER BY ratio DESC;
    SELECT found_rows() INTO num_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProposalsByKeyword`(
	IN in_keyword VARCHAR(64),
    OUT num_of_rows_in_the_result_set INT
)
BEGIN
	SELECT Proposal_id,proposal_title,due_date,amount
    FROM proposal
    WHERE proposal_title LIKE concat('%',in_keyword,'%');
    SELECT found_rows() INTO num_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetRecommendedProposals`(
	IN in_member_id INT,
    OUT num_of_rows_in_the_result_set INT
)
BEGIN
	CREATE TEMPORARY TABLE temp_proposal_id(
	proposal_id_sponsored INT
	); ### 用temp table  `temp_proposal_id` 存member_id贊助過的提案

	CREATE TEMPORARY TABLE temp_member_id(
		other_member_id INT
	); ### 用temp table  `temp_member_id` 存和member_id贊助過相同提案的人

	CREATE TEMPORARY TABLE temp_other_sponsored(
		other_proposal_sponsored_id INT
	); ### 存贊助相同提案的人贊助的其他提案

	INSERT INTO temp_proposal_id(proposal_id_sponsored)
	SELECT proposal_option.proposal_id
	FROM sponsor_record
	JOIN proposal_option
	ON sponsor_record.proposal_option_id = proposal_option.ProposalOption_id
	WHERE member_id= `in_member_id`; ### member_id贊助過的提案存進去temp table

	INSERT INTO temp_member_id(other_member_id)
	SELECT member_id
	FROM sponsor_record
	JOIN proposal_option
	ON sponsor_record.proposal_option_id = proposal_option.ProposalOption_id
	WHERE proposal_id  IN (SELECT * FROM temp_proposal_id) AND member_id<> `in_member_id`; ### 找贊助相同提案的人存進temp_member_id

	INSERT INTO temp_other_sponsored(other_proposal_sponsored_id)
	SELECT proposal_id
	FROM sponsor_record
	JOIN proposal_option
	ON sponsor_record.proposal_option_id = proposal_option.ProposalOption_id
	WHERE member_id  IN (SELECT * FROM temp_member_id) AND proposal_id NOT IN (SELECT * FROM temp_proposal_id); ###贊助相同提案的人贊助的其他提案

	SELECT count(*)
	FROM proposal
	JOIN proposal_member
	ON proposal.Proposal_id = proposal_member.proposal_id
	WHERE proposal.status=2 AND proposal.Proposal_id IN (SELECT * FROM temp_other_sponsored) AND proposal_member.member_id <> `in_member_id`
    INTO num_of_rows_in_the_result_set;
	
    ### number of rows in the result set 
    
    
    ### 不符合a,b,c,d條件就選觀看次數排名前五
    IF num_of_rows_in_the_result_set=0
		THEN
        SELECT Proposal_id AS proposal_id,proposal_title,status,viewed_num
		FROM proposal
		ORDER BY viewed_num DESC
		LIMIT 5;
	ELSE
		SELECT proposal.Proposal_id AS proposal_id , proposal.proposal_title ,proposal.status,proposal.viewed_num
		FROM proposal
		JOIN proposal_member
		ON proposal.Proposal_id = proposal_member.proposal_id
		WHERE proposal.status=2 AND proposal.Proposal_id IN (SELECT * FROM temp_other_sponsored) AND proposal_member.member_id <> `in_member_id`;
	END IF;
    SELECT found_rows() INTO num_of_rows_in_the_result_set;
    
	###丟掉temp table
	DROP TEMPORARY TABLE IF EXISTS temp_proposal_id; 
	DROP TEMPORARY TABLE IF EXISTS temp_member_id;
	DROP TEMPORARY TABLE IF EXISTS temp_other_sponsored;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetUnrepliedComments`(
	IN in_member_id INT,
    OUT num_of_rows_in_the_result_set INT
)
BEGIN
	SELECT subtable.*,proposal.proposal_title FROM proposal
	JOIN
		(SELECT proposal_member.member_id , proposal_member.proposal_id , comment.Comment_id AS comment_id
		, comment.user_comment AS member_comment , comment.comment_time,comment.proposal_response AS proposer_response
		FROM proposal_member
		JOIN comment
		ON proposal_member.proposal_id=comment.proposal_id) subtable
	ON subtable.proposal_id=proposal.Proposal_id
	WHERE subtable.member_id=in_member_id AND subtable.proposer_response IS NULL;
    
    SELECT found_rows() INTO num_of_rows_in_the_result_set;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Login`(
	IN in_email VARCHAR(64),
    IN in_hashedpwd VARCHAR(200),
    OUT out_status_code INT 
)
BEGIN
	SET @num=0;
	SET out_status_code=3;
    
    ### 確認email存在
	SELECT count(*) FROM member
    WHERE email=in_email
    INTO @num;
    SET out_status_code=out_status_code-@num;
    
    ### 確認密碼存在
    SELECT COUNT(*) FROM
		(SELECT member.* , member_credential.hashed_user_id,hashed_pwd_string
		FROM member
		JOIN member_credential ON member.Member_id = member_credential.hashed_user_id) subtable
	WHERE hashed_pwd_string=in_hashedpwd AND email=in_email
    INTO @num;
    SET out_status_code=out_status_code-@num;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegisterMember`(
	IN in_name VARCHAR(64),
    IN in_phone VARCHAR(64),
    IN in_email VARCHAR(64),
    IN in_address VARCHAR(255),
    IN in_salt CHAR(64),
    IN in_hashedPassword VARCHAR(200),
    
    OUT out_affected_row_num int
)
BEGIN
	SET @cal=0;
	INSERT INTO member (member_name , phone , email , address , salt)
	VALUES (in_name,in_phone,in_email,in_address,in_salt);
	SELECT ROW_COUNT() INTO out_affected_row_num;

    INSERT INTO member_credential (hashed_user_id,hashed_pwd_string)
    VALUES ((SELECT MAX(Member_id) FROM member),in_hashedPassword);
    SET out_affected_row_num=out_affected_row_num+(SELECT ROW_COUNT());
    
    SELECT * from 
		(SELECT member.* , member_credential.hashed_pwd_string
		FROM member
		JOIN member_credential ON member.Member_id = member_credential.hashed_user_id) subtable
	WHERE Member_id=(SELECT MAX(Member_id) FROM member);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateProposalStatus`(
	IN in_proposal_id INT,
    IN in_status INT,
    OUT affected_row_num INT
)
BEGIN
	SET @num=0;
    
    ###取出想更改狀態的提案的狀態
	SELECT status 
    FROM proposal
    WHERE Proposal_id=in_proposal_id
    INTO @num;
    
    ### 流程控制，要檢查原來的status可不可以更改
	IF @num=1 AND in_status=2 
		THEN 
        UPDATE proposal SET status=in_status WHERE Proposal_id=in_proposal_id;
        SELECT row_count() INTO affected_row_num;
        UPDATE proposal SET due_date=DATE_ADD(NOW(),INTERVAL 90 day) WHERE Proposal_id=in_proposal_id;
        SET affected_row_num=affected_row_num+(SELECT row_count());
        
	ELSEIF @num=2 AND in_status=3
		THEN UPDATE proposal SET status=in_status WHERE Proposal_id=in_proposal_id;
        SELECT row_count() INTO affected_row_num;
	ELSEIF @num=3
		THEN SELECT 'The proposal id has already been 3.' LIMIT 0;
        SET affected_row_num=0;
	ELSE 
		SELECT 'Your input is wrong.' LIMIT 0;
        SET affected_row_num=0;
    END IF;

    ###查詢結果
    SELECT Proposal_id,status
    FROM proposal
    WHERE Proposal_id=in_proposal_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdatePwd`(
	IN in_member_id INT,
    IN in_hashedPwd VARCHAR(200),
    IN in_salt char(64),
	OUT out_affected_row_num INT 
)
BEGIN
	###透過輸入的id更改salt
	UPDATE member 
    SET salt=in_salt
    WHERE Member_id = in_member_id;
    SELECT ROW_COUNT() INTO out_affected_row_num;
	
    ###透過輸入的id更改密碼
	UPDATE member_credential 
    SET hashed_pwd_string=in_hashedPwd
    WHERE hashed_user_id = in_member_id;
    SET out_affected_row_num=out_affected_row_num+(SELECT ROW_COUNT());
    
    SELECT * from 
		(SELECT member.* , member_credential.hashed_pwd_string
		FROM member
		JOIN member_credential ON member.Member_id = member_credential.hashed_user_id) subtable
	WHERE Member_id=in_member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 15:52:31
